abstract class IGoogleTranslatordException implements Exception {
  const IGoogleTranslatordException([this.message]);

  final String? message;

  @override
  String toString() {
    String result = 'Google Translator Exception';
    if (message != null) return '$result: $message';
    return result;
  }
}

class GoogleTranslatorException extends IGoogleTranslatordException {
  const GoogleTranslatorException([super.message]);
}
