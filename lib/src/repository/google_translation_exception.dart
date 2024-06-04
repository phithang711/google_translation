abstract class IGoogleTranslationdException implements Exception {
  const IGoogleTranslationdException([this.message]);

  final String? message;

  @override
  String toString() {
    String result = 'Google Translator Exception';
    if (message != null) return '$result: $message';
    return result;
  }
}

class GoogleTranslationException extends IGoogleTranslationdException {
  const GoogleTranslationException([super.message]);
}
