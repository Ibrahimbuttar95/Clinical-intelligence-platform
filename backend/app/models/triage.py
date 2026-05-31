from sqlalchemy import Column
from sqlalchemy import Integer
from sqlalchemy import Text

from app.db.base import Base

class TriageLog(Base):

    __tablename__ = "triage_logs"

    id = Column(
        Integer,
        primary_key=True
    )

    user_id = Column(Integer)

    symptoms = Column(Text)

    result = Column(Text)
