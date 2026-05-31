from fastapi import FastAPI

from app.api.routes_auth import router as auth
from app.api.routes_triage import router as triage
from app.api.routes_voice import router as voice
from app.api.routes_billing import router as billing

app = FastAPI(title="Clinical Intelligence Backend")

app.include_router(auth, prefix="/auth")
app.include_router(triage, prefix="/api")
app.include_router(voice, prefix="/api")
app.include_router(billing, prefix="/api")
