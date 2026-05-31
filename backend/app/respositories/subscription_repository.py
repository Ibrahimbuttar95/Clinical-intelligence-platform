from sqlalchemy.orm import Session

from app.models.subscription import Subscription

class SubscriptionRepository:

    @staticmethod
    def create(
        db: Session,
        user_id: int,
        plan: str
    ):
        sub = Subscription(
            user_id=user_id,
            plan=plan,
            status="active"
        )

        db.add(sub)
        db.commit()
        db.refresh(sub)

        return sub
