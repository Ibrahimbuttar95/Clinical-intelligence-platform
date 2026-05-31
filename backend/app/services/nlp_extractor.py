def extract_symptoms(text: str):

    known = [
        "fever",
        "headache",
        "cough",
        "fatigue",
        "abdominal pain",
        "chest pain",
        "breathing difficulty"
    ]

    found = []

    text = text.lower()

    for symptom in known:
        if symptom in text:
            found.append(symptom)

    return found
