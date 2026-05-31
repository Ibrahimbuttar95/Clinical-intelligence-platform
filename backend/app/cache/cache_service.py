from app.cache.redis_client import redis_client

def set_cache(
    key,
    value,
    ttl=300
):
    redis_client.setex(
        key,
        ttl,
        value
    )

def get_cache(key):
    return redis_client.get(key)
