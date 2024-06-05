import 'package:flutter/material.dart';
import 'package:google_transalation_example/presentation/detect_language_page/detect_language_page.dart';
import 'package:google_transalation_example/presentation/translation_page/translation_page.dart';
import 'package:google_transalation_example/util/util_dialog.dart';
import 'package:google_translation/google_translation.dart';

// How to get API Key found here
// https://cloud.google.com/translate/docs/setup
const googleTranslateAPIKey = "";
final googleTranslation = GoogleTranslation();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Translation Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Google API Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController apiKeyTextFieldController =
      TextEditingController(text: googleTranslateAPIKey);
  List<String> listGoogleSupportLanguages = [];
  String? dropDownValue;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: apiKeyTextFieldController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text("List supported language"),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Colors.blue,
                        style: BorderStyle.solid,
                        width: 0.80,
                      ),
                    ),
                    child: DropdownButton(
                        items: listGoogleSupportLanguages
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: dropDownValue,
                        onChanged: (String? chosenLanguage) {
                          setState(() {
                            dropDownValue = chosenLanguage;
                          });
                        }),
                  ),
                  OutlinedButton(
                    onPressed: () => _didTapSyncListSupportedLanguage(),
                    child: const Text("Sync"),
                  ),
                ],
              ),
              OutlinedButton(
                onPressed: () => _didTapTranslationPageButton(),
                child: const Text(
                  "Go to translation page",
                ),
              ),
              OutlinedButton(
                onPressed: () => _didTapTransitionPageButton(),
                child: const Text(
                  "Go to detecion language page",
                ),
              ),
              if (isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _didTapSyncListSupportedLanguage() async {
    if (apiKeyTextFieldController.text == "") {
      _showAlertNoApiKeyDialog();
      return;
    }

    setState(() {
      isLoading = true;
    });

    List<String> listGoogleSupportLanguages = [];

    final supportLanguages = await googleTranslation.getListSupportLanguages(
      googleAPIKey: apiKeyTextFieldController.text,
    );
    for (var value in supportLanguages) {
      listGoogleSupportLanguages.add(value.language);
    }

    setState(() {
      this.listGoogleSupportLanguages = listGoogleSupportLanguages;
      if (listGoogleSupportLanguages.isNotEmpty) {
        dropDownValue = this.listGoogleSupportLanguages[0];
      }
      isLoading = false;
    });
  }

  void _showAlertNoApiKeyDialog() {
    UtilDialog.showAlertNoApiKeyDialog(
      context: context,
      dialogTitle: 'No API Key',
      dialogMessage: 'Please Input Google API Key',
    );
  }

  Future<void> _didTapTranslationPageButton() async {
    if (apiKeyTextFieldController.text == "") {
      _showAlertNoApiKeyDialog();
      return;
    }

    if (listGoogleSupportLanguages.isEmpty) {
      await _didTapSyncListSupportedLanguage();
    }

    googleTranslation.setupAPIKey(apiKeyTextFieldController.text);

    if (mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TranslationPage(
            listSupportedLanguage: listGoogleSupportLanguages,
          ),
        ),
      );
    }
  }

  Future<void> _didTapTransitionPageButton() async {
    if (apiKeyTextFieldController.text == "") {
      _showAlertNoApiKeyDialog();
      return;
    }

    googleTranslation.setupAPIKey(apiKeyTextFieldController.text);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const DetectLanguagePage(),
      ),
    );
  }
}
