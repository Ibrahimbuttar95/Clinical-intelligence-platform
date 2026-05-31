from app.workers.celery_app import celery

@celery.task
def send_notification(
    user_id
):
    return user_id
