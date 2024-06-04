import 'package:flutter_test/flutter_test.dart';

import 'package:google_translation/google_translation.dart';
import 'package:google_translation/src/repository/google_translation_exception.dart';

void main() {
  test('run without API key define', () async {
    final googleTranslation = GoogleTranslation();

    try {
      await googleTranslation.simpleTextTranslate(
        inputText: "Hello",
        sourceLanguage: "en",
        targetLanguage: "vi",
      );
    } catch (exception) {
      expect(
        exception,
        allOf(
          isA<GoogleTranslationException>(),
          predicate<GoogleTranslationException>(
            (exceptionMessage) =>
                exceptionMessage.toString() ==
                "Google Translator Exception: API Key has not define",
          ),
        ),
      );
    }
  });
}
