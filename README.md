# Google translation
Google Translation for using Google API key easily.

[Pub package](https://pub.dev/packages/google_translation)

[Github](https://github.com/phithang711/google_translation)

## First announcement

Google Translation package currently only support for [basic addition](https://cloud.google.com/translate/docs/editions#basic) of Google Translation API. 

[Advanced addition](https://cloud.google.com/translate/docs/editions#advanced) will be supported later.

Learn more about [Google Translation](https://cloud.google.com/translate/docs/overview#editions) and the different between basic and advanced addition [here](https://cloud.google.com/translate/docs/editions).

## Get started

### **Setup API Key**

When using Google Translation API, you need to setup [Google Translation API key](https://cloud.google.com/translate/docs/setup).

### **Install**

Add `google_translation` to your [pubspec dependencies](https://pub.dev/packages/google_translation/install).

### **Usage**

#### **Configuration**

Setup Google Translation API for once.

``` dart
final googleTranslation = GoogleTranslation();
googleTranslation.setupAPIKey("YOUR_GOOGLE_API_KEY");
```

Google Translation API can update or overwrite when call function anytime.

#### **Simple Translation**

For translate text

``` dart
final result = await googleTranslation.simpleTextTranslate(
    inputText: "TEXT_NEED_TRANSLATE",
    sourceLanguage: "en", // optional
    targetLanguage: "vi",
    googleAPIKey: "YOUR_GOOGLE_API_KEY", // optional. If already setup above then doesn't need
);

print("Result: $result"); // output value
```

#### **Language Detection**

For language detection, get list detect languages

``` dart
final listDetectLanguages = await googleTranslation.simpleTextDetectLanguages(
    inputText: "TEXT_NEED_TO_DETECT_LANGUAGE",
    googleAPIKey: "YOUR_GOOGLE_API_KEY", // optional. If already setup above then doesn't need
);

print("List detect languages: $listDetectLanguages"); // output value
```

#### **Get Language Supported**

There are two methods support

1. Get Supported language at default

``` dart
final supportLanguages = await googleTranslation.getListSupportLanguages(
   googleAPIKey: "YOUR_GOOGLE_API_KEY", // optional. If already setup above then doesn't need
);

print("List support languages: $supportLanguages"); // output value
```

2. Get Supported language at specific target localization

``` dart
final supportLanguages = await googleTranslation.getListSupportLanguages(
    targetLanguage: "en", // Define this
    googleAPIKey: "YOUR_GOOGLE_API_KEY", // optional. If already setup above then doesn't need
);

print("List support languages: $supportLanguages"); // output value
```


[Read more](https://cloud.google.com/translate/docs/basic/discovering-supported-languages#translate_list_language_names-drest)