def detect_language(text: str):

    urdu_chars = "اآبپتٹثجچحخدڈذرڑزژسشصضطظعغفقکگلمنوہی"

    for char in text:
        if char in urdu_chars:
            return "urdu"

    return "english"
