#FileARBGen
FileARBGen is a Dart package for generating .arb localization files in Flutter. It simplifies the process of creating and maintaining localization files based on a provided .txt file.

How to Use
Add this repository to the dependencies in your Flutter project:

yaml
Copy code
dependencies:
  filearbgen:
    git: https://github.com/Chewbacca-14/filearbgen.git
Run the following command in the Terminal:

bash
Copy code
dart run filearbgen --filepath <path_to_your_translate_file.txt> --languagecode <language_code> --type <en/other>
--filepath: Path to your file with translations.
--languagecode: Language code for the translation (e.g., 'en' for English).
--type: Use 'en' if you are creating a standard English translation file. Use 'other' if you are creating additional translation files.
Translation File Format
Your translation file (e.g., yourtranslatefile.txt) should have the following format:

txt
Copy code
"welcome";"Добро пожаловать";"Welcome"

"helloworld";"Привет Мир";"Hello World"
Ensure that all values are enclosed in double brackets and separated by semicolons. Additionally, there should be two empty lines between individual rows in the file.

Feel free to customize and use this package to streamline your Flutter localization process!

