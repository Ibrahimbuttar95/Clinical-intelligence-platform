def normalize(text: str):

    replacements = {
        "بخار": "fever",
        "سر درد": "headache",
        "کھانسی": "cough",
        "سانس": "breathing",
        "کمزوری": "fatigue",
        "پیٹ درد": "abdominal pain"
    }

    for ur, en in replacements.items():
        text = text.replace(ur, en)

    return text.lower()
