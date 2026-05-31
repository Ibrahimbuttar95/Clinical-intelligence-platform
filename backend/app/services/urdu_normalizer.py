def normalize(text: str) -> str:
    text = text.lower()

    replacements = {
        "sar dard": "headache",
        "pet dard": "abdominal pain",
        "bukhar": "fever",
        "chakkar": "dizziness",
        "kamzori": "fatigue"
    }

    for k, v in replacements.items():
        text = text.replace(k, v)

    return text
