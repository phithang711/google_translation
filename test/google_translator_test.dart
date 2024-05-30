import 'package:flutter_test/flutter_test.dart';

import 'package:google_translator/google_translator.dart';

void main() {
  test('adds one to input values', () async {
    GoogleTranslator.instance.setupAPIKey("AIzaSyCFZPwxguzEe8MzCSh-QYDZrqBxI6BhD9Q");
    String text = await GoogleTranslator.instance.simpleTextTranslate(
      inputText: "Hello",
      sourceLanguage: "en",
      targetLanguage: "vi",
    );

    expect(text, "Xin chào");
  });
}
