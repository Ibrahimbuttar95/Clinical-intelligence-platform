def predict(symptoms: str):
    return {
        "possible_conditions": [
            {"name": "viral infection", "probability": 0.62},
            {"name": "fatigue syndrome", "probability": 0.41}
        ],
        "note": "Model is probabilistic, not diagnostic"
    }
