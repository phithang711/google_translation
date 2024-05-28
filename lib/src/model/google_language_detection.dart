// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// Inspire from https://cloud.google.com/translate/docs/reference/rest/v2/detect#detectlanguageresponselist
class GoogleLanguageDetection {
  final String language;
  final bool isReliable;
  final double confidence;

  GoogleLanguageDetection(
    this.language,
    this.isReliable,
    this.confidence,
  );

  GoogleLanguageDetection copyWith({
    String? language,
    bool? isReliable,
    double? confidence,
  }) {
    return GoogleLanguageDetection(
      language ?? this.language,
      isReliable ?? this.isReliable,
      confidence ?? this.confidence,
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
      map['language'] as String,
      map['isReliable'] as bool,
      map['confidence'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory GoogleLanguageDetection.fromJson(String source) =>
      GoogleLanguageDetection.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LanguageDetection(language: $language, isReliable: $isReliable, confidence: $confidence)';

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
