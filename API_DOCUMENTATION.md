# Clinical Intelligence Platform - API Documentation

## Base URL
```
http://localhost:8000
```

## Authentication
All protected endpoints require a Bearer token in the Authorization header:
```
Authorization: Bearer <access_token>
```

---

## Endpoints

### Health Check

#### GET `/`
Health check endpoint - returns service status
```bash
curl http://localhost:8000/
```

**Response:**
```json
{
  "status": "ok",
  "service": "Clinical Intelligence Platform",
  "version": "2.0.0"
}
```

#### GET `/health`
Health check endpoint
```bash
curl http://localhost:8000/health
```

**Response:**
```json
{
  "status": "healthy"
}
```

---

## Authentication Endpoints

### POST `/auth/register`
Register a new user

**Request:**
```json
{
  "email": "user@example.com",
  "password": "secure_password_123"
}
```

**Response (200):**
```json
{
  "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "token_type": "bearer"
}
```

**Error (400):**
```json
{
  "detail": "Email already registered"
}
```

**cURL Example:**
```bash
curl -X POST http://localhost:8000/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "user@example.com",
    "password": "secure_password_123"
  }'
```

---

### POST `/auth/login`
Login with email and password

**Request:**
```json
{
  "email": "user@example.com",
  "password": "secure_password_123"
}
```

**Response (200):**
```json
{
  "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "token_type": "bearer"
}
```

**Error (401):**
```json
{
  "detail": "Invalid email or password"
}
```

**cURL Example:**
```bash
curl -X POST http://localhost:8000/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "user@example.com",
    "password": "secure_password_123"
  }'
```

---

## Triage Endpoints

### POST `/api/triage`
Analyze symptoms using rule-based and ML approaches

**Request:**
```json
{
  "symptoms": "fever, headache, body ache"
}
```

**Response (200):**
```json
{
  "rule_based": {
    "condition": "possible_flu",
    "severity": "moderate",
    "recommendations": ["Rest", "Stay hydrated", "Monitor temperature"]
  },
  "ml_based": {
    "diagnosis": "Influenza",
    "confidence": 0.87,
    "risk_level": "medium"
  }
}
```

**cURL Example:**
```bash
# First get access token
TOKEN=$(curl -X POST http://localhost:8000/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "user@example.com",
    "password": "secure_password_123"
  }' | jq -r '.access_token')

# Then use it for triage
curl -X POST http://localhost:8000/api/triage \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" \
  -d '{
    "symptoms": "fever, headache, body ache"
  }'
```

---

## Voice Processing Endpoints

### POST `/api/voice/transcribe`
Transcribe voice input to text

**Request:**
- Form data with audio file

**Response (200):**
```json
{
  "transcription": "I have fever and headache",
  "language": "en",
  "confidence": 0.95
}
```

**cURL Example:**
```bash
curl -X POST http://localhost:8000/api/voice/transcribe \
  -H "Authorization: Bearer $TOKEN" \
  -F "file=@audio.wav"
```

---

## Billing Endpoints

### GET `/api/billing/plans`
Get available subscription plans

**Response (200):**
```json
{
  "plans": [
    {
      "name": "Free",
      "price": 0,
      "currency": "PKR",
      "features": ["Basic triage", "Limited queries"]
    },
    {
      "name": "Pro",
      "price": 999,
      "currency": "PKR",
      "features": ["Unlimited triage", "Priority support"]
    }
  ]
}
```

**cURL Example:**
```bash
curl http://localhost:8000/api/billing/plans
```

---

### POST `/api/billing/subscribe`
Subscribe to a plan

**Request:**
```json
{
  "plan_id": "pro"
}
```

**Response (200):**
```json
{
  "status": "success",
  "subscription_id": "sub_123"
}
```

**cURL Example:**
```bash
curl -X POST http://localhost:8000/api/billing/subscribe \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "plan_id": "pro"
  }'
```

---

### POST `/api/billing/payment`
Process payment

**Request:**
```json
{
  "amount": 999,
  "currency": "PKR",
  "payment_method": "razorpay"
}
```

**Response (200):**
```json
{
  "status": "processing",
  "transaction_id": "txn_123"
}
```

**cURL Example:**
```bash
curl -X POST http://localhost:8000/api/billing/payment \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "amount": 999,
    "currency": "PKR",
    "payment_method": "razorpay"
  }'
```

---

## Error Responses

### 400 Bad Request
```json
{
  "detail": "Email already registered"
}
```

### 401 Unauthorized
```json
{
  "detail": "Invalid email or password"
}
```

### 422 Unprocessable Entity
```json
{
  "detail": [
    {
      "loc": ["body", "email"],
      "msg": "invalid email format",
      "type": "value_error.email"
    }
  ]
}
```

### 500 Internal Server Error
```json
{
  "detail": "Internal server error"
}
```

---

## Request/Response Models

### User Registration Request
```json
{
  "email": "string (required, valid email)",
  "password": "string (required, min 8 chars)"
}
```

### Token Response
```json
{
  "access_token": "string",
  "token_type": "string"
}
```

### Triage Request
```json
{
  "symptoms": "string (required)"
}
```

### Triage Response
```json
{
  "rule_based": {
    "condition": "string",
    "severity": "string",
    "recommendations": ["string"]
  },
  "ml_based": {
    "diagnosis": "string",
    "confidence": "float",
    "risk_level": "string"
  }
}
```

---

## Rate Limiting (Future)
```
- Free tier: 10 requests/hour
- Pro tier: Unlimited requests
```

---

## Pagination (Future)
```
GET /api/resource?skip=0&limit=10
```

---

## Filtering & Sorting (Future)
```
GET /api/resource?filter=value&sort=field&order=asc
```

---

## Testing with Postman

1. **Import Collection:**
   - Create new request in Postman
   - Set method to POST
   - URL: `http://localhost:8000/auth/login`
   - Body (raw JSON):
   ```json
   {
     "email": "user@example.com",
     "password": "secure_password_123"
   }
   ```

2. **Save Token:**
   - Copy access token from response
   - In Authorization tab, select "Bearer Token"
   - Paste the token

3. **Test Protected Endpoints:**
   - Use the saved Bearer token for other endpoints

---

## API Response Status Codes

| Code | Meaning |
|------|---------|
| 200 | OK - Request successful |
| 201 | Created - Resource created |
| 400 | Bad Request - Invalid input |
| 401 | Unauthorized - Authentication required |
| 403 | Forbidden - Access denied |
| 404 | Not Found - Resource not found |
| 422 | Unprocessable Entity - Validation error |
| 500 | Internal Server Error |

---

## Interactive API Documentation

- **Swagger UI:** http://localhost:8000/docs
- **ReDoc:** http://localhost:8000/redoc

These provide interactive API exploration and testing.

---

## Webhook Endpoints (Future)

### POST `/api/webhooks/payment`
Receive payment notifications from payment gateways

**Razorpay Webhook:**
```json
{
  "event": "payment.authorized",
  "payload": {
    "payment": {
      "id": "pay_123",
      "amount": 99900,
      "currency": "INR"
    }
  }
}
```

---

## API Versioning (Future)

```
/api/v1/resource  - Version 1
/api/v2/resource  - Version 2
```

---

## Support

For API issues or questions:
- Check error response details
- Review logs in application output
- Check Interactive docs at `/docs`
