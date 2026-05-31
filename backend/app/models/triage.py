from sqlalchemy import Column, Integer, String, Text
from app.db.base import Base

class TriageLog(Base):
    __tablename__ = "triage_logs"

    id = Column(Integer, primary_key=True)
    user_id = Column(Integer)
    input_text = Column(Text)
    result = Column(Text)
