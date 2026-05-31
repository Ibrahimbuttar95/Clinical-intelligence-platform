from pydantic import BaseModel

class TriageRequest(BaseModel):
    symptoms: str

class TriageResponse(BaseModel):
    risk_level: str
    risk_score: int
    advice: str
