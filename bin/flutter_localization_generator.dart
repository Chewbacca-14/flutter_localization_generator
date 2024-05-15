import 'dart:io';
import 'package:args/args.dart';
import 'package:flutter_localization_generator/gen_en.dart';
import 'package:flutter_localization_generator/gen_other_languages.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    //filepath - path to the translation file
    ..addOption('filePath', abbr: 'f', mandatory: true)
    //language code to create the file name
    ..addOption('languageCode', abbr: 'l', defaultsTo: 'app_langcode.arb')
    //generation type. en for the main file, other for additional
    ..addOption('type', abbr: 't', defaultsTo: 'en')
    // splitElement is used to split translated word with English words
    ..addOption('splitElement', abbr: 's', mandatory: true);

  try {
    // Parse the command line arguments
    final results = parser.parse(arguments);
    // Extract values from the parsed results

    final filePath = results['filePath'] as String;
    final languageCode = results['languageCode'] as String;
    final type = results['type'] as String;
    final splitElement = results['splitElement'] as String;

    // Check if the file at the specified path exists
    if (!File(filePath).existsSync()) {
      print('[File Path error] file not found: $filePath');
      return;
    }
    // Check the value of the 'type' option. en for the main file, other for additional

    if (type == 'en') {
      genEn(
          filePath: filePath,
          languageCode: languageCode,
          splitElement: splitElement);
    } else if (type == 'other') {
      genOther(
          inputFilePath: filePath,
          languageCode: languageCode,
          splitElement: splitElement);
    } else {
      print('[Type error] please write en or other');
    }
  } catch (e) {
    print('[Parsing error] error parsing command line arguments: $e');
  }
}
