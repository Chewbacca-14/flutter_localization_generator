# 🖥️ FileARBGen


FileARBGen is a Dart package for generating .arb localization files in Flutter. It simplifies the process of creating and maintaining localization files based on a provided .txt file.

## How to Use
Add this repository to the dependencies in your Flutter project:

```dart
dependencies:
  filearbgen:
    git:
      url: https://github.com/Chewbacca-14/filearbgen.git
```
Run the following command in the Terminal:
<br/>
```dart
dart run filearbgen --filepath <path_to_your_translate_file.txt> --languagecode <language_code> --type <en/other>
```

<br/>


**--filepath:** path to your file with translations.

**--languagecode:** language code for the translation (e.g., 'en' for English).

**--type:** use 'en' if you are creating a standard English translation file. Use 'other' if you are creating additional translation files.
<br/><br/>

## Translation File Format
Your translation file (e.g., yourtranslatefile.txt) should have the following format:

<br/>

**Example of translate.txt**
```bash
welcome;Добро пожаловать;Welcome

helloworld;Привет Мир;Hello World
```
- Ensure that all values are separated by semicolons (;).

  
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
dart run filearbgen --filepath C:\Users\Max\Downloads\translate.txt --languagecode en --type en
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
 },
}
```
<br/>

**RUN**

```dart
dart run filearbgen --filepath C:\Users\Max\Downloads\translate.txt --languagecode ru --type other
```
<br/>



**OUTPUT**

**app_ru.arb**

```dart
{
 "welcome":"Добро пожаловать",
 "helloworld":"Привет Мир",
}
```

<br/>


**ATTENTION. AFTER GENERATING THE FILES, DO NOT FORGET TO ERASE THE LAST COMMA IN EACH FILE. THIS ERROR WILL BE CORRECTED LATER**

```dart
{
 "welcome": "Welcome",
 "@welcome": {
   "description": "Добро пожаловать"
 },
 "helloworld": "Hello World",
 "@helloworld": {
   "description": "Привет Мир"
 }, <-- **THIS**
}
```

```dart
{
 "welcome":"Добро пожаловать",
 "helloworld":"Привет Мир",  <-- **THIS**
}
```

__**Feel free to customize and use this package to streamline your Flutter localization process!**__

