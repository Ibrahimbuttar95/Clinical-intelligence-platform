from pydantic import BaseModel

class CreatePaymentRequest(BaseModel):
    plan: str

class PaymentResponse(BaseModel):
    status: str
    payment_url: str
