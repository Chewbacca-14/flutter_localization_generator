import 'dart:io';
import 'package:args/args.dart';
import 'package:filearbgen/gen_en.dart';
import 'package:filearbgen/gen_other.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    //filepath - path to the translation file
    ..addOption('filepath', abbr: 'f', mandatory: true)
    //language code to create the file name
    ..addOption('languagecode', abbr: 'l', defaultsTo: 'app_langcode.arb')
    //generation type. en for the main file, other for additional
    ..addOption('type', abbr: 't', defaultsTo: 'en');

  try {
    // Parse the command line arguments
    final results = parser.parse(arguments);
    // Extract values from the parsed results

    final filePath = results['filepath'] as String;
    final outputFileName = results['languagecode'] as String;
    final type = results['type'] as String;

    // Check if the file at the specified path exists
    if (!File(filePath).existsSync()) {
      print('File not found: $filePath');
      return;
    }
    // Check the value of the 'type' option. en for the main file, other for additional
    if (type == 'en') {
      genEn(filePath, outputFileName);
    } else if (type == 'other') {
      genOther(filePath, outputFileName);
    } else {
      print('Type error. Please write en or other');
    }
  } catch (e) {
    print('Error parsing command line arguments: $e');
  }
}
