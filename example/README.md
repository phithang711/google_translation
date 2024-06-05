Google Translation API Example

Usage example

``` dart
final result = await GoogleTranslation().simpleTextTranslate(
    inputText: "TEXT_NEED_TRANSLATE",
    sourceLanguage: "en", // optional
    targetLanguage: "vi",
    googleAPIKey: "YOUR_GOOGLE_API_KEY", // optional. If already setup above then doesn't need
);

print("Result: $result"); // output value
```

Go to [google_translation_example](https://github.com/phithang711/google_translation/tree/main/example/google_transalation_example) to view more.