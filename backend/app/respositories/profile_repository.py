from sqlalchemy.orm import Session

from app.models.user_profile import UserProfile

class ProfileRepository:

    @staticmethod
    def create(
        db: Session,
        user_id: int
    ):
        profile = UserProfile(
            user_id=user_id
        )

        db.add(profile)
        db.commit()

        return profile
