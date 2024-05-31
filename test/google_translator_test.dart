import 'package:flutter_test/flutter_test.dart';

import 'package:google_translator/google_translator.dart';
import 'package:google_translator/src/repository/google_translator_exception.dart';

void main() {
  test('adds one to input values', () async {
    final googleTranslator = GoogleTranslator();
    googleTranslator.setupAPIKey("AIzaSyCFZPwxguzEe8MzCSh-QYDZrqBxI6BhD9Q");
    String text = await googleTranslator.simpleTextTranslate(
      inputText: "Hello",
      sourceLanguage: "en",
      targetLanguage: "vi",
    );

    expect(text, "Xin chào");
  });

  test('run without API key define', () async {
    final googleTranslator = GoogleTranslator();

    try {
      await googleTranslator.simpleTextTranslate(
        inputText: "Hello",
        sourceLanguage: "en",
        targetLanguage: "vi",
      );
    } catch (exception) {
      expect(
        exception,
        allOf(
          isA<GoogleTranslatorException>(),
          predicate<GoogleTranslatorException>(
            (exceptionMessage) =>
                exceptionMessage.toString() ==
                "Google Translator Exception: API Key has not define",
          ),
        ),
      );
    }
  });
}
