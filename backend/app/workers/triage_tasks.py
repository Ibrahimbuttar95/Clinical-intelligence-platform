from app.workers.celery_app import celery

@celery.task
def process_triage(
    symptoms
):
    return symptoms
