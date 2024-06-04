import 'package:google_translation/src/model/google_language_detection.dart';
import 'package:google_translation/src/model/google_support_language.dart';
import 'package:google_translation/src/network/network_provider.dart';
import 'package:google_translation/src/repository/google_translation_repository.dart';

class GoogleTranslationRepositoryImplement
    implements IGoogleTranslationRepository {
  String baseURL = "https://translation.googleapis.com/language/translate/v2";

  @override
  Future<List<GoogleSupportLanguage>> getListSupportLanguages({
    String? targetLanguage,
    required String googleApiKey,
  }) async {
    Map<String, String> params = {};
    if (targetLanguage != null) {
      params['target'] = targetLanguage;
    }

    final response = (targetLanguage != null)
        ? await api.post(
            "$baseURL/languages",
            queryParameters: {"key": googleApiKey},
            data: params,
          )
        : await api.get(
            "$baseURL/languages",
            queryParameters: {"key": googleApiKey},
          );

    List<dynamic> data = response.data['data']['languages'];

    if (data.isEmpty) {
      return [];
    }

    return data.map((value) => GoogleSupportLanguage.fromMap(value)).toList();
  }

  @override
  Future<List<GoogleLanguageDetection>> simpleTextDetectLanguages({
    required String inputText,
    required String googleApiKey,
  }) {
    Map<String, String> params = {
      "q": inputText,
    };

    return api
        .post("$baseURL/detect",
            queryParameters: {"key": googleApiKey}, data: params)
        .then(
      (response) {
        List<dynamic> data = response.data['data']['detections'][0];
        if (data.isEmpty) {
          return [];
        }
        return data
            .map((value) => GoogleLanguageDetection.fromMap(value))
            .toList();
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
