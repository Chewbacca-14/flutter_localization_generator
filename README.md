# 🖥️ flutter_localization_generator

flutter_localization_generator is a Dart package for generating .arb localization files in Flutter. It simplifies the process of creating and maintaining localization files based on a provided .txt file.

## How to Use

Add this repository to the dependencies in your Flutter project:

```dart
dependencies:
  flutter_localization_generator:
    git:
      url: https://github.com/Chewbacca-14/flutter_localization_generator.git
```

Run the following command in the Terminal:
<br/>

```dart
dart run flutter_localization_generator --filePath <path_to_your_translate_file.txt> --languageCode <language_code> --type <en/other> --splitElement ";"
```

<br/>

**--filePath:** path to your file with translations.

**--languagecCode:** language code for the translation (e.g., 'en' for English).

**--type:** use 'en' if you are creating a standard English translation file. Use 'other' if you are creating additional translation files.

**--splitElement:** specifies the element used to separate the values in the translation file. In the provided example, semicolon (;) is used as the split element.
<br/><br/>

## Translation File Format

Your translation file (e.g., yourtranslatefile.txt) should have the following format:

<br/>

**Example of translate.txt**

splitElement is ";"

```bash
welcome;Добро пожаловать;Welcome
helloworld;Привет Мир;Hello World
```

or
splitElement is ".."

```bash
welcome..Добро пожаловать..Welcome
helloworld..Привет Мир..Hello World
```

- Ensure that all values are separated by splitElement

<br/>

## Example

<br/>

**translate.txt**

```bash
welcome;Добро пожаловать;Welcome
helloworld;Привет Мир;Hello World
```

**RUN**

```dart
dart run flutter_localization_generator --filePath C:\Users\Max\Downloads\translate.txt --languageCode en --type en --splitElement ";"
```

<br/>

**OUTPUT**

**app_en.arb**

```dart
{
 "welcome": "Welcome",
 "@welcome": {
   "description": "Добро пожаловать"
 },
 "helloworld": "Hello World",
 "@helloworld": {
   "description": "Привет Мир"
 }
}
```

<br/>

**RUN**

```dart
dart run flutter_localization_generator --filePath C:\Users\Max\Downloads\translate.txt --languageCode ru --type other --splitElement ";"
```

<br/>

**OUTPUT**

**app_ru.arb**

```dart
{
 "welcome":"Добро пожаловать",
 "helloworld":"Привет Мир"
}
```

<br/>

\***\*Feel free to customize and use this package to streamline your Flutter localization process!\*\***
