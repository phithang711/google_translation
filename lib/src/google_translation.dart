import 'package:google_translation/src/model/google_language_detection.dart';
import 'package:google_translation/src/model/google_support_language.dart';
import 'package:google_translation/src/repository/google_translation_exception.dart';
import 'package:google_translation/src/repository/google_translation_repository.dart';
import 'package:google_translation/src/repository/google_translation_repository_implement.dart';

class GoogleTranslator {
  String? _googleApiKey;
  late IGoogleTranslationRepository _repository;

  GoogleTranslator() {
    _repository = GoogleTranslatorRepositoryImplement();
  }

  void setupAPIKey(String apiKey) {
    _googleApiKey = apiKey;
  }

  Future<String> simpleTextTranslate({
    required String inputText,
    String? sourceLanguage,
    required String targetLanguage,
    String? googleAPIKey,
  }) {
    if (googleAPIKey == null && _googleApiKey == null) {
      throw const GoogleTranslatorException("API Key has not define");
    }

    return _repository.simpleTextTranslate(
      inputText: inputText,
      sourceLanguage: sourceLanguage,
      targetLanguage: targetLanguage,
      googleApiKey: googleAPIKey ?? _googleApiKey!,
    );
  }

  Future<List<GoogleLanguageDetection>> simpleTextDetectLanguages({
    required String inputText,
    bool onlyGetHighestConfidence = false,
    String? googleAPIKey,
  }) {
    if (googleAPIKey == null && _googleApiKey == null) {
      throw const GoogleTranslatorException("API Key has not define");
    }

    return _repository.simpleTextDetectLanguages(
      inputText: inputText,
      googleApiKey: googleAPIKey ?? _googleApiKey!,
      onlyGetHighestConfidence: onlyGetHighestConfidence,
    );
  }

  Future<List<GoogleSupportLanguage>> getListSupportLanguages({
    String? targetLanguage,
    String? googleAPIKey,
  }) {
    if (googleAPIKey == null && _googleApiKey == null) {
      throw const GoogleTranslatorException("API Key has not define");
    }

    return _repository.getListSupportLanguages(
      targetLanguage: targetLanguage,
      googleApiKey: googleAPIKey ?? _googleApiKey!,
    );
  }
}
