from backend.db.session import SessionLocal
from backend.models import Subscription

def get_user_tier(user_id):
    db = SessionLocal()

    sub = db.query(Subscription).filter(
        Subscription.user_id == user_id,
        Subscription.status == "active"
    ).first()

    if not sub:
        return "free"

    return sub.plan


def require_pro(user_id):
    return get_user_tier(user_id) in ["pro", "clinic"]
