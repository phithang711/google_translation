// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// Inspire from https://cloud.google.com/translate/docs/reference/rest/v2/languages#getsupportedlanguagesresponselist
class GoogleSupportLanguage {
  final String language;
  // Can be null if not provided target language when call API
  final String? name;

  GoogleSupportLanguage({
    required this.language,
    this.name,
  });

  GoogleSupportLanguage copyWith({
    String? language,
    String? name,
  }) {
    return GoogleSupportLanguage(
      language: language ?? this.language,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'language': language,
      'name': name,
    };
  }

  factory GoogleSupportLanguage.fromMap(Map<String, dynamic> map) {
    return GoogleSupportLanguage(
      language: map['language'] as String,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GoogleSupportLanguage.fromJson(String source) =>
      GoogleSupportLanguage.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'GoogleSupportLanguage(language: $language, name: $name)';

  @override
  bool operator ==(covariant GoogleSupportLanguage other) {
    if (identical(this, other)) return true;

    return other.language == language && other.name == name;
  }

  @override
  int get hashCode => language.hashCode ^ name.hashCode;
}
