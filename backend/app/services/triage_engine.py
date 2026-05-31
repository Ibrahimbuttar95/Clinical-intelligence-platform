def evaluate(symptoms):

    score = 0
    flags = []

    if "chest pain" in symptoms:
        score += 80
        flags.append("urgent")

    if "breathing difficulty" in symptoms:
        score += 70
        flags.append("urgent")

    if "fever" in symptoms:
        score += 20

    if "fatigue" in symptoms:
        score += 10

    if score >= 80:
        level = "HIGH"
        advice = "Professional medical evaluation is recommended."

    elif score >= 40:
        level = "MODERATE"
        advice = "Monitor symptoms and consult a healthcare professional if they worsen."

    else:
        level = "LOW"
        advice = "Self-care and observation may be appropriate."

    return {
        "risk_level": level,
        "risk_score": score,
        "flags": flags,
        "advice": advice
    }
