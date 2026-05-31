from sqlalchemy import Column
from sqlalchemy import Integer
from sqlalchemy import String

from app.db.base import Base

class UserProfile(Base):

    __tablename__ = "user_profiles"

    id = Column(
        Integer,
        primary_key=True
    )

    user_id = Column(Integer)

    age = Column(Integer)

    gender = Column(String)

    medications = Column(String)

    allergies = Column(String)
