import 'package:flutter/material.dart';
import 'package:google_transalation_example/main.dart';
import 'package:google_transalation_example/util/util_dialog.dart';

class TranslationPage extends StatefulWidget {
  final List<String> listSupportedLanguage;
  const TranslationPage({
    super.key,
    required this.listSupportedLanguage,
  });

  @override
  State<TranslationPage> createState() => _TranslationPageState();
}

class _TranslationPageState extends State<TranslationPage> {
  String? translateFromValue;
  String? translateToValue;
  final TextEditingController inputTranslatedTextController = TextEditingController();

  String? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Translate Page"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: inputTranslatedTextController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text("Translate from language"),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.blue, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: DropdownButton(
                        items: widget.listSupportedLanguage.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: translateFromValue,
                        onChanged: (String? chosenLanguage) {
                          setState(() {
                            translateFromValue = chosenLanguage;
                          });
                        }),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text("Translate to language"),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.blue, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: DropdownButton(
                        items: widget.listSupportedLanguage.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: translateToValue,
                        onChanged: (String? chosenLanguage) {
                          setState(() {
                            translateToValue = chosenLanguage;
                          });
                        }),
                  ),
                ],
              ),
              OutlinedButton(
                onPressed: () => _didTapTrasnlateLanguage(),
                child: const Text(
                  "Translate",
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

  Future<void> _didTapTrasnlateLanguage() async {
    if (translateToValue == null || translateFromValue == "") {
      UtilDialog.showAlertNoApiKeyDialog(context: context, dialogTitle: "No target language", dialogMessage: "Please chose target language");

      return;
    }

    if (inputTranslatedTextController.text == "") {
      UtilDialog.showAlertNoApiKeyDialog(context: context, dialogTitle: "No translate text", dialogMessage: "Please input text to translate");

      return;
    }

    final textTranslationResponse = await googleTranslation.simpleTextTranslate(
      inputText: inputTranslatedTextController.text,
      sourceLanguage: translateFromValue,
      targetLanguage: translateToValue!,
    );

    setState(() {
      result = textTranslationResponse;
    });
  }
}
