import 'package:flutter/material.dart';
import 'package:google_transalation_example/main.dart';
import 'package:google_transalation_example/util/util_dialog.dart';

class DetectLanguagePage extends StatefulWidget {
  const DetectLanguagePage({super.key});

  @override
  State<DetectLanguagePage> createState() => _DetectLanguagePageState();
}

class _DetectLanguagePageState extends State<DetectLanguagePage> {
  final TextEditingController inputDetectLanguageTextController =
      TextEditingController();

  String? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Detect Language Page"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: inputDetectLanguageTextController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              OutlinedButton(
                onPressed: () => _didTapDetectLangauge(),
                child: const Text(
                  "Detect langauge",
                ),
              ),
              if (result != null)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Text("Result is: $result"),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _didTapDetectLangauge() async {
    if (inputDetectLanguageTextController.text == "") {
      UtilDialog.showAlertNoApiKeyDialog(
          context: context,
          dialogTitle: "No detect text",
          dialogMessage: "Please input text to detect");

      return;
    }

    final listDetectLangue = await googleTranslation.simpleTextDetectLanguages(
        inputText: inputDetectLanguageTextController.text);

    if (listDetectLangue.isNotEmpty) {
      setState(() {
        result = listDetectLangue[0].language;
      });
    }
  }
}
