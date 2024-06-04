import 'package:flutter/material.dart';
import 'package:google_translation/google_translation.dart';

// How to get API Key found here
// https://cloud.google.com/translate/docs/setup
const googleTranslateAPIKey = "";
final googleTranslation = GoogleTranslator();

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
  List<String> listSupportedLangauges = [];
  String dropDownValue = "";

  void _incrementCounter() {}

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("List supported language"),
                  DropdownButton(
                      items: listSupportedLangauges
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: dropDownValue,
                      onChanged: (String? chosenLanguage) {}),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text("Sync"),
                  ),
                ],
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "Go to detecion language page",
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "Go to translation page",
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _didTapSyncListSupportedLanguage() {}
}