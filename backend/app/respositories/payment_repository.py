from sqlalchemy.orm import Session

from app.models.payment import Payment

class PaymentRepository:

    @staticmethod
    def create(
        db: Session,
        user_id: int,
        amount: int,
        status: str
    ):

        payment = Payment(
            user_id=user_id,
            amount=amount,
            status=status
        )

        db.add(payment)
        db.commit()

        return payment
