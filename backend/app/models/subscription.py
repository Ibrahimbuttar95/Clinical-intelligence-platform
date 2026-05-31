from sqlalchemy import Column, Integer, String
from app.db.base import Base

class Subscription(Base):
    __tablename__ = "subscriptions"

    id = Column(Integer, primary_key=True)
    user_id = Column(Integer)
    plan = Column(String)
    status = Column(String)
