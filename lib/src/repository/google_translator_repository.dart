import 'package:google_translator/src/model/google_language_detection.dart';
import 'package:google_translator/src/model/google_support_language.dart';

abstract interface class IGoogleTranslatorRepository {
  // Simple Translator (v2)
  Future<String> simpleTextTranslate({
    required String inputText,
    String? sourceLanguage,
    required String targetLanguage,
    required String googleApiKey,
  });

  Future<List<GoogleLanguageDetection>> simpleTextDetectLanguages({
    required String inputText,
    required String googleApiKey,
    bool onlyGetHighestConfidence = false,
  });

  Future<List<GoogleSupportLanguage>> getListSupportLanguages({
    String? targetLanguage,
    required String googleApiKey,
  });
}
