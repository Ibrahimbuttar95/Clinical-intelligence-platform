from fastapi import APIRouter, Depends
from app.core.security import hash_password, create_token

router = APIRouter()

fake_db = {}

@router.post("/register")
def register(data: dict):
    email = data["email"]
    password = hash_password(data["password"])

    fake_db[email] = password
    return {"status": "registered"}

@router.post("/login")
def login(data: dict):
    email = data["email"]
    password = data["password"]

    if email not in fake_db:
        return {"error": "user not found"}

    token = create_token({"email": email})
    return {"access_token": token}
