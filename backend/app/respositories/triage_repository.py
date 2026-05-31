from sqlalchemy.orm import Session

from app.models.triage_log import TriageLog

class TriageRepository:

    @staticmethod
    def save(
        db: Session,
        user_id: int,
        symptoms: str,
        result: str
    ):
        log = TriageLog(
            user_id=user_id,
            symptoms=symptoms,
            result=result
        )

        db.add(log)
        db.commit()

        return log
