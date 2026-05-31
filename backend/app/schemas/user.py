from pydantic import BaseModel
from typing import Optional

class UserProfileCreate(BaseModel):
    age: Optional[int] = None
    gender: Optional[str] = None
    medications: Optional[str] = None
    allergies: Optional[str] = None

class UserProfileResponse(BaseModel):
    age: Optional[int]
    gender: Optional[str]
    medications: Optional[str]
    allergies: Optional[str]

    class Config:
        from_attributes = True
