from celery import Celery

celery = Celery(
    "clinical_platform",
    broker="redis://localhost:6379/0"
)
