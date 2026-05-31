from fastapi import APIRouter
from app.billing.service import create_order

router = APIRouter()

@router.post("/billing/order")
def order(data: dict):
    return create_order(data["amount"])
