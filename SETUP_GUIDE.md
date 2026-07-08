# Development Setup Guide

## Prerequisites

- Python 3.11+
- PostgreSQL 14+
- Redis 7+
- Docker & Docker Compose (optional)
- Git

## Backend Setup

### 1. Clone the Repository

```bash
git clone https://github.com/Ibrahimbuttar95/Clinical-intelligence-platform.git
cd Clinical-intelligence-platform
```

### 2. Create Virtual Environment

```bash
cd backend
python -m venv venv

# Activate virtual environment
# On Linux/macOS:
source venv/bin/activate

# On Windows:
venv\Scripts\activate
```

### 3. Install Dependencies

```bash
pip install -r requirements.txt
```

### 4. Setup Environment Variables

```bash
cp .env.example .env
# Edit .env with your local configuration
```

**Example `.env` for development:**

```env
SECRET_KEY=dev-secret-key-change-in-production
ENVIRONMENT=development
DEBUG=true

DATABASE_URL=postgresql://postgres:password@localhost:5432/clinical_dev
REDIS_URL=redis://localhost:6379/0

JWT_ALGORITHM=HS256
ACCESS_TOKEN_EXPIRE_MINUTES=30

PAYFAST_MERCHANT_ID=test_merchant
PAYFAST_SECRET=test_secret
```

### 5. Setup Database

```bash
# Create PostgreSQL database
createdb clinical_dev

# Run migrations
alembic upgrade head
```

### 6. Run Development Server

```bash
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

Access the API:
- **Swagger UI:** http://localhost:8000/docs
- **ReDoc:** http://localhost:8000/redoc
- **Health Check:** http://localhost:8000/health

---

## Docker Setup (Recommended)

### Using Docker Compose

Create `docker-compose.yml` in root directory:

```yaml
version: '3.8'

services:
  postgres:
    image: postgres:15-alpine
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: clinical_db
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres"]
      interval: 10s
      timeout: 5s
      retries: 5

  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"
    healthcheck:
      test: ["CMD", "redis-cli", "ping"]
      interval: 10s
      timeout: 5s
      retries: 5

  backend:
    build:
      context: ./backend
      dockerfile: Dockerfile
    environment:
      DATABASE_URL: postgresql://postgres:postgres@postgres:5432/clinical_db
      REDIS_URL: redis://redis:6379/0
      SECRET_KEY: dev-secret-key
      DEBUG: "true"
    ports:
      - "8000:8000"
    depends_on:
      postgres:
        condition: service_healthy
      redis:
        condition: service_healthy
    volumes:
      - ./backend:/app

volumes:
  postgres_data:
```

### Run with Docker Compose

```bash
# Start all services
docker-compose up -d

# View logs
docker-compose logs -f backend

# Stop services
docker-compose down
```

---

## API Testing

### Using cURL

```bash
# Health Check
curl http://localhost:8000/health

# Register User
curl -X POST http://localhost:8000/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "user@example.com",
    "password": "secure_password_123"
  }'

# Login
curl -X POST http://localhost:8000/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "user@example.com",
    "password": "secure_password_123"
  }'
```

### Using Python Requests

```python
import requests

BASE_URL = "http://localhost:8000"

# Register
response = requests.post(f"{BASE_URL}/auth/register", json={
    "email": "user@example.com",
    "password": "secure_password_123"
})
print(response.json())

# Login
response = requests.post(f"{BASE_URL}/auth/login", json={
    "email": "user@example.com",
    "password": "secure_password_123"
})
token = response.json()["access_token"]
print(f"Token: {token}")

# Triage
headers = {"Authorization": f"Bearer {token}"}
response = requests.post(f"{BASE_URL}/api/triage", 
    headers=headers,
    json={"symptoms": "fever and headache"})
print(response.json())
```

---

## Frontend Setup (Flutter)

### Prerequisites

- Flutter SDK 3.3.0+
- Android Studio (for Android) or Xcode (for iOS)
- Android/iOS emulator or physical device

### 1. Navigate to Frontend

```bash
cd frontend
```

### 2. Get Dependencies

```bash
flutter pub get
```

### 3. Run the App

```bash
# List available devices
flutter devices

# Run on device/emulator
flutter run

# Run with verbose output
flutter run -v
```

### 4. Build for Production

```bash
# iOS
flutter build ios

# Android
flutter build apk
flutter build appbundle
```

---

## Project Structure

```
Clinical-intelligence-platform/
├── backend/
│   ├── app/
│   │   ├── api/              # FastAPI route handlers
│   │   │   ├── routes_auth.py
│   │   │   ├── routes_triage.py
│   │   │   ├── routes_voice.py
│   │   │   └── routes_billing.py
│   │   ├── core/             # Configuration & security
│   │   │   ├── config.py
│   │   │   ├── security.py
│   │   │   ├── deps.py
│   │   │   └── tier.py
│   │   ├── db/               # Database setup
│   │   │   ├── session.py
│   │   │   ├── base.py
│   │   │   └── init_db.py
│   │   ├── models/           # SQLAlchemy models
│   │   │   ├── user.py
│   │   │   ├── user_profile.py
│   │   │   ├── triage.py
│   │   │   ├── subscription.py
│   │   │   └── payment.py
│   │   ├── services/         # Business logic (to implement)
│   │   │   ├── triage_engine.py
│   │   │   ├── ml_engine.py
│   │   │   ├── urdu_normalizer.py
│   │   │   └── voice_processor.py
│   │   ├── schemas/          # Request/Response models
│   │   ├── middleware/       # Custom middleware
│   │   ├── workers/          # Celery tasks
│   │   ├── notifications/    # Email/SMS
│   │   ├── cache/            # Redis caching
│   │   └── main.py           # FastAPI app entry
│   ├── alembic/              # Database migrations
│   ├── requirements.txt
│   ├── Dockerfile
│   ├── .env
│   └── .env.example
├── frontend/
│   ├── lib/
│   │   ├── models/           # Dart data models
│   │   ├── services/         # API client, services
│   │   ├── screens/          # Flutter screens
│   │   ├── widgets/          # Reusable widgets
│   │   ├── providers/        # Provider state management
│   │   ├── localization/     # i18n (Urdu/English)
│   │   └── main.dart
│   ├── assets/
│   │   ├── images/
│   │   ├── icons/
│   │   └── audio/
│   └── pubspec.yaml
├── ANALYSIS_AND_FIXES.md     # This document
├── CONTRIBUTING.md
├── LICENSE
└── README.md
```

---

## Troubleshooting

### Database Connection Issues

```bash
# Check PostgreSQL is running
psql -U postgres -h localhost -d clinical_dev

# If connection fails, reset database
dropdb clinical_dev
createdb clinical_dev
alembic upgrade head
```

### Redis Connection Issues

```bash
# Check Redis is running
redis-cli ping

# Should return: PONG

# Clear Redis cache (development only)
redis-cli FLUSHALL
```

### Import Errors

```bash
# Ensure you're in the correct directory
cd backend

# Reinstall dependencies
pip install --upgrade -r requirements.txt

# Clear Python cache
find . -type d -name __pycache__ -exec rm -r {} +
find . -type f -name "*.pyc" -delete
```

### Port Already in Use

```bash
# Find process using port 8000
lsof -i :8000

# Kill the process
kill -9 <PID>

# Or use different port
uvicorn app.main:app --port 8001
```

---

## Environment Variables Reference

| Variable | Description | Example |
|----------|-------------|---------|
| `SECRET_KEY` | JWT signing key | `your-secret-key` |
| `ENVIRONMENT` | Deployment environment | `development` or `production` |
| `DEBUG` | Debug mode | `true` or `false` |
| `DATABASE_URL` | PostgreSQL connection | `postgresql://user:pass@host:5432/db` |
| `REDIS_URL` | Redis connection | `redis://localhost:6379/0` |
| `JWT_ALGORITHM` | JWT algorithm | `HS256` |
| `ACCESS_TOKEN_EXPIRE_MINUTES` | Token expiry | `30` |
| `PAYFAST_MERCHANT_ID` | PayFast merchant ID | `your_id` |
| `JAZZCASH_MERCHANT_ID` | JazzCash merchant ID | `your_id` |
| `RAZORPAY_KEY_ID` | Razorpay key ID | `your_key` |

---

## Useful Commands

```bash
# Backend
cd backend

# Create database migration
alembic revision --autogenerate -m "Add new table"

# Upgrade database
alembic upgrade head

# Downgrade database
alembic downgrade -1

# Run tests (when available)
pytest

# Format code
black app/

# Lint code
pylint app/

# Type check
mypy app/
```

---

## Next Steps

1. **Complete Service Implementations:**
   - Implement `triage_engine.py` for rule-based analysis
   - Implement `ml_engine.py` for ML predictions
   - Implement `urdu_normalizer.py` for NLP

2. **Add Tests:**
   - Unit tests for services
   - Integration tests for APIs
   - End-to-end tests

3. **Setup CI/CD:**
   - GitHub Actions workflows
   - Automated testing
   - Automated deployment

4. **Mobile Integration:**
   - Complete Flutter UI
   - API client integration
   - Local storage setup

5. **Production Deployment:**
   - Setup production database
   - Configure payment gateways
   - Setup monitoring & logging

---

## Support & Resources

- **FastAPI Documentation:** https://fastapi.tiangolo.com/
- **Flutter Documentation:** https://flutter.dev/docs
- **SQLAlchemy Documentation:** https://docs.sqlalchemy.org/
- **PostgreSQL Documentation:** https://www.postgresql.org/docs/

---

## License

Private Project - All Rights Reserved © Ahmad Mansoor Buttar
