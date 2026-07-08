from fastapi import APIRouter, Depends
from pydantic import BaseModel
from app.services.triage_engine import analyze
from app.services.urdu_normalizer import normalize
from app.services.ml_engine import predict

router = APIRouter()


class TriageRequest(BaseModel):
    """Request model for triage endpoint"""
    symptoms: str


class TriageResponse(BaseModel):
    """Response model for triage endpoint"""
    rule_based: dict
    ml_based: dict


@router.post("/triage", response_model=TriageResponse)
def triage(data: TriageRequest):
    """
    Analyze symptoms using both rule-based and ML-based approaches.
    
    Args:
        data: Triage request containing symptoms
        
    Returns:
        TriageResponse with both rule-based and ML-based analysis results
    """
    text = normalize(data.symptoms)

    rule_result = analyze(text)
    ml_result = predict(text)

    return {
        "rule_based": rule_result,
        "ml_based": ml_result
    }
