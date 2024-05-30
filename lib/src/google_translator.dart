import 'package:google_translator/src/model/google_language_detection.dart';
import 'package:google_translator/src/model/google_support_language.dart';
import 'package:google_translator/src/repository/google_translator_repository.dart';
import 'package:google_translator/src/repository/google_translator_repository_implement.dart';

class GoogleTranslator {
  late String _googleApiKey;
  late IGoogleTranslatorRepository _repository;

  static final GoogleTranslator instance = GoogleTranslator._internal();

  GoogleTranslator._internal() {
    _repository = GoogleTranslatorRepositoryImplement();
  }

  void setupAPIKey(String apiKey) {
    _googleApiKey = apiKey;
  }

  Future<String> simpleTextTranslate({
    required String inputText,
    String? sourceLanguage,
    required String targetLanguage,
  }) {
    return _repository.simpleTextTranslate(
      inputText: inputText,
      sourceLanguage: sourceLanguage,
      targetLanguage: targetLanguage,
      googleApiKey: _googleApiKey,
    );
  }

  Future<List<GoogleLanguageDetection>> simpleTextDetectLanguages({
    required String inputText,
    bool onlyGetHighestConfidence = false,
  }) {
    return _repository.simpleTextDetectLanguages(
      inputText: inputText,
      googleApiKey: _googleApiKey,
      onlyGetHighestConfidence: onlyGetHighestConfidence,
    );
  }

  Future<List<GoogleSupportLanguage>> getListSupportLanguages({
    String? targetLanguage,
  }) {
    return _repository.getListSupportLanguages(
      targetLanguage: targetLanguage,
      googleApiKey: _googleApiKey,
    );
  }
}
