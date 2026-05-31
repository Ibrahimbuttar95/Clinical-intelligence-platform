from app.workers.celery_app import celery

@celery.task
def process_payment(
    payment_id
):
    return payment_id
