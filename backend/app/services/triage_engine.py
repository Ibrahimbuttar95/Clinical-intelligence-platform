def analyze(symptoms: str):
    s = symptoms.lower()

    risk_score = 0
    flags = []

    if "chest pain" in s:
        risk_score += 80
        flags.append("cardiac_risk")

    if "breathing difficulty" in s:
        risk_score += 70
        flags.append("respiratory_risk")

    if "fever" in s:
        risk_score += 30

    if "headache" in s:
        risk_score += 20

    if risk_score >= 80:
        level = "HIGH"
        advice = "Seek immediate medical attention"
    elif risk_score >= 40:
        level = "MODERATE"
        advice = "Consult doctor if persists"
    else:
        level = "LOW"
        advice = "Home care possible"

    return {
        "risk_level": level,
        "risk_score": risk_score,
        "flags": flags,
        "advice": advice
    }
