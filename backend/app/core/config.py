import os

class Settings:
    SECRET_KEY = os.getenv("SECRET_KEY", "dev_secret")
    ALGORITHM = "HS256"

    DATABASE_URL = os.getenv(
        "DATABASE_URL",
        "sqlite:///./local.db"
    )

    RAZORPAY_KEY_ID = os.getenv("RAZORPAY_KEY_ID", "")
    RAZORPAY_KEY_SECRET = os.getenv("RAZORPAY_KEY_SECRET", "")

settings = Settings()
