from fastapi import APIRouter
from app.services.voice_engine import process_voice

router = APIRouter()

@router.post("/voice")
def voice_input(data: dict):
    return process_voice(data["text"])
