import 'package:google_translation/src/model/google_language_detection.dart';
import 'package:google_translation/src/model/google_support_language.dart';
import 'package:google_translation/src/repository/google_translation_exception.dart';
import 'package:google_translation/src/repository/google_translation_repository.dart';
import 'package:google_translation/src/repository/google_translation_repository_implement.dart';

/// This package is built for support multiplatform Google Translation API Key.
class GoogleTranslation {
  String? _googleApiKey;
  late IGoogleTranslationRepository _repository;

  GoogleTranslation() {
    _repository = GoogleTranslationRepositoryImplement();
  }

  /// Setup API Key for once for no need update later
  void setupAPIKey(String apiKey) {
    _googleApiKey = apiKey;
  }

  /// Translate input text from source language to target language
  /// If source lanaguage is not defined, auto detect language and trasnlate
  Future<String> simpleTextTranslate({
    required String inputText,
    String? sourceLanguage,
    required String targetLanguage,
    String? googleAPIKey,
  }) {
    if (googleAPIKey == null && _googleApiKey == null) {
      throw const GoogleTranslationException("API Key has not define");
    }

    return _repository.simpleTextTranslate(
      inputText: inputText,
      sourceLanguage: sourceLanguage,
      targetLanguage: targetLanguage,
      googleApiKey: googleAPIKey ?? _googleApiKey!,
    );
  }

  /// Detect input text language and return list with confidence
  Future<List<GoogleLanguageDetection>> simpleTextDetectLanguages({
    required String inputText,
    String? googleAPIKey,
  }) {
    if (googleAPIKey == null && _googleApiKey == null) {
      throw const GoogleTranslationException("API Key has not define");
    }

    return _repository.simpleTextDetectLanguages(
      inputText: inputText,
      googleApiKey: googleAPIKey ?? _googleApiKey!,
    );
  }

  /// Get list support languages by Google Translation API
  /// If target language is defined, return with name with support language in that localized value.
  Future<List<GoogleSupportLanguage>> getListSupportLanguages({
    String? targetLanguage,
    String? googleAPIKey,
  }) {
    if (googleAPIKey == null && _googleApiKey == null) {
      throw const GoogleTranslationException("API Key has not define");
    }

    return _repository.getListSupportLanguages(
      targetLanguage: targetLanguage,
      googleApiKey: googleAPIKey ?? _googleApiKey!,
    );
  }
}
