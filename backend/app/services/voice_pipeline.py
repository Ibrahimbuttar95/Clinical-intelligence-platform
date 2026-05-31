from app.services.voice_engine import process_voice_text
from app.services.urdu_normalizer import normalize

def run_pipeline(text: str):

    result = process_voice_text(text)

    normalized = normalize(
        result["transcript"]
    )

    return {
        "transcript": result["transcript"],
        "normalized_text": normalized,
        "confidence": result["confidence"]
    }
