Dart package for generating .arb localization files.

ATTENTION!

You should have a ready-made .txt file with localization in . The first value is the key, the second value is the translation in another language, the third value is the text in English.
All values ​​must be in double brackets and there must be a semicolon between them.
Between individual rows in the file there must be 2 empty lines.

yourtanslatefile.txt

"welcome";"Добро пожаловать";"Welcome"


"hellow";"Привет Мир";"Hello World"


How to use?

1. Add this repository to the dependencies in your flutter project

dependencies:
  filearbgen:
    git:
      url: https://github.com/Chewbacca-14/filearbgen.git

2. Run command in the Terminal

dart run filearbgen --filepath C:\Users\Max\Downloads\translate.txt --languagecode test --type en

--filepath - path to the your file with translate

--languagecode - language code for which you are translating (if you are making the main file in English, use en)

--type - en / other. Use en if you are creating a standard English translation file and if you are creating additional translation files, use other
