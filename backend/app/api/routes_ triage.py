from fastapi import APIRouter
from app.services.triage_engine import analyze
from app.services.urdu_normalizer import normalize
from app.services.ml_engine import predict

router = APIRouter()

@router.post("/triage")
def triage(data: dict):
    text = normalize(data["symptoms"])

    rule_result = analyze(text)
    ml_result = predict(text)

    return {
        "rule_based": rule_result,
        "ml_based": ml_result
    }
