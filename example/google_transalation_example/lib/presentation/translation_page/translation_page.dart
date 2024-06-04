import 'package:flutter/material.dart';

class TranslationPage extends StatefulWidget {
  final String apiKey;
  final List<String> listSupportedLanguage;
  const TranslationPage({
    super.key,
    required this.apiKey,
    required this.listSupportedLanguage,
  });

  @override
  State<TranslationPage> createState() => _TranslationPageState();
}

class _TranslationPageState extends State<TranslationPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
