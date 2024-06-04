// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// Inspire from https://cloud.google.com/translate/docs/reference/rest/v2/detect#detectlanguageresponselist
class GoogleLanguageDetection {
  final String language;
  final bool isReliable;
  final num confidence;

  GoogleLanguageDetection({
    required this.language,
    required this.isReliable,
    required this.confidence,
  });

  GoogleLanguageDetection copyWith({
    String? language,
    bool? isReliable,
    num? confidence,
  }) {
    return GoogleLanguageDetection(
      language: language ?? this.language,
      isReliable: isReliable ?? this.isReliable,
      confidence: confidence ?? this.confidence,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'language': language,
      'isReliable': isReliable,
      'confidence': confidence,
    };
  }

  factory GoogleLanguageDetection.fromMap(Map<String, dynamic> map) {
    return GoogleLanguageDetection(
      language: map['language'] as String,
      isReliable: map['isReliable'] as bool,
      confidence: map['confidence'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory GoogleLanguageDetection.fromJson(String source) =>
      GoogleLanguageDetection.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'GoogleLanguageDetection(language: $language, isReliable: $isReliable, confidence: $confidence)';

  @override
  bool operator ==(covariant GoogleLanguageDetection other) {
    if (identical(this, other)) return true;

    return other.language == language &&
        other.isReliable == isReliable &&
        other.confidence == confidence;
  }

  @override
  int get hashCode =>
      language.hashCode ^ isReliable.hashCode ^ confidence.hashCode;
}
