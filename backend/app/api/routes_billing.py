from fastapi import APIRouter, Depends
from pydantic import BaseModel
from sqlalchemy.orm import Session
from app.core.deps import get_db, get_current_user

router = APIRouter()


class SubscriptionPlan(BaseModel):
    """Subscription plan model"""
    name: str
    price: float
    currency: str = "PKR"
    features: list


class PaymentRequest(BaseModel):
    """Payment request model"""
    amount: float
    currency: str = "PKR"
    payment_method: str  # "payfast", "jazzcash", "easypaisa", "razorpay"


@router.get("/billing/plans")
async def get_subscription_plans():
    """
    Get available subscription plans.
    
    Returns:
        List of subscription plans
    """
    # TODO: Implement subscription plans listing
    return {
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


@router.post("/billing/subscribe")
async def subscribe_plan(
    plan_id: str,
    current_user: dict = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """
    Subscribe to a plan.
    
    Args:
        plan_id: ID of the plan to subscribe to
        current_user: Current authenticated user
        db: Database session
        
    Returns:
        Subscription confirmation
    """
    # TODO: Implement subscription logic
    return {"status": "success", "subscription_id": "sub_123"}


@router.post("/billing/payment")
async def process_payment(
    payment_data: PaymentRequest,
    current_user: dict = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """
    Process payment through selected gateway.
    
    Args:
        payment_data: Payment details
        current_user: Current authenticated user
        db: Database session
        
    Returns:
        Payment processing result
    """
    # TODO: Route to appropriate payment gateway
    return {"status": "processing", "transaction_id": "txn_123"}
