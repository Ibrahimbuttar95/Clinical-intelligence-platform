from pydantic_settings import BaseSettings
from typing import Optional


class Settings(BaseSettings):
    """Application settings loaded from environment variables"""
    
    # Application
    APP_NAME: str = "Clinical Intelligence Platform"
    APP_VERSION: str = "2.0.0"
    
    # Security
    SECRET_KEY: str = "CHANGE_ME_IN_PRODUCTION"  # Override with env var
    JWT_ALGORITHM: str = "HS256"
    ACCESS_TOKEN_EXPIRE_MINUTES: int = 30
    
    # Database
    DATABASE_URL: str = "postgresql://user:password@localhost:5432/clinical_db"
    
    # Redis (for cache & Celery)
    REDIS_URL: str = "redis://localhost:6379/0"
    
    # Payment Gateways
    PAYFAST_MERCHANT_ID: str = ""
    PAYFAST_SECRET: str = ""
    
    JAZZCASH_MERCHANT_ID: str = ""
    JAZZCASH_PASSWORD: str = ""
    
    EASYPAISA_STORE_ID: str = ""
    EASYPAISA_HASH_KEY: str = ""
    
    # Razorpay
    RAZORPAY_KEY_ID: str = ""
    RAZORPAY_KEY_SECRET: str = ""
    
    # Environment
    ENVIRONMENT: str = "development"
    DEBUG: bool = False
    
    class Config:
        env_file = ".env"
        case_sensitive = True


settings = Settings()
