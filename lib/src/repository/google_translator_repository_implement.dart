import 'package:google_translator/src/model/google_language_detection.dart';
import 'package:google_translator/src/model/google_support_language.dart';
import 'package:google_translator/src/network/network_provider.dart';
import 'package:google_translator/src/repository/google_translator_repository.dart';

class GoogleTranslatorRepositoryImplement implements IGoogleTranslatorRepository {
  String baseURL = "https://translation.googleapis.com/language/translate/v2";

  @override
  Future<List<GoogleSupportLanguage>> getListSupportLanguages({
    String? targetLanguage,
    required String googleApiKey,
  }) {
    Map<String, String> params = {};
    if (targetLanguage != null) {
      params['target'] = targetLanguage;
    }

    return api.post("$baseURL/languages", queryParameters: {"key": googleApiKey}, data: params).then(
      (response) {
        List<dynamic> data = response.data['data']['detections'];
        if (data.isEmpty) {
          return [];
        }
        return data.map((value) => GoogleSupportLanguage.fromMap(value)).toList();
      },
    );
  }

  @override
  Future<List<GoogleLanguageDetection>> simpleTextDetectLanguages({
    required String inputText,
    required String googleApiKey,
    bool onlyGetHighestConfidence = false,
  }) {
    Map<String, String> params = {
      "q": inputText,
    };

    return api.post("$baseURL/detect", queryParameters: {"key": googleApiKey}, data: params).then(
      (response) {
        List<dynamic> data = response.data['data']['detections'];
        if (data.isEmpty) {
          return [];
        }
        return data.map((value) => GoogleLanguageDetection.fromMap(value)).toList();
      },
    );
  }

  @override
  Future<String> simpleTextTranslate({
    required String inputText,
    String? sourceLanguage,
    required String targetLanguage,
    required String googleApiKey,
  }) {
    Map<String, String> params = {
      "q": inputText,
      "target": targetLanguage,
    };
    if (sourceLanguage != null) {
      params['source'] = sourceLanguage;
    }

    return api
        .post(
      baseURL,
      queryParameters: {"key": googleApiKey},
      data: params,
    )
        .then((response) {
      List<dynamic> data = response.data['data']['translations'];
      if (data.isEmpty) {
        return "";
      }
      return data.first['translatedText'] as String;
    });
  }
}
