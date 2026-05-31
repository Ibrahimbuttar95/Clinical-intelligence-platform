from fastapi import APIRouter, Request
import json
from backend.billing.service import activate_subscription

router = APIRouter()

@router.post("/billing/webhook")
async def razorpay_webhook(request: Request):
    payload = await request.body()
    event = json.loads(payload)

    if event["event"] == "payment.captured":
        payment = event["payload"]["payment"]["entity"]

        user_id = payment["notes"]["user_id"]
        plan = payment["notes"]["plan"]

        activate_subscription(
            user_id=user_id,
            plan=plan,
            payment_id=payment["id"],
            order_id=payment["order_id"]
        )

    return {"status": "ok"}
