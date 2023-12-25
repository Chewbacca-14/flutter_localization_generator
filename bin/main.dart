import 'dart:io';
import 'package:args/args.dart';

void main(List<String> arguments) {
  final parser = ArgParser()..addOption('file', abbr: 'f', mandatory: true);

  try {
    final results = parser.parse(arguments);
    final filePath = results['file'] as String;

    if (!File(filePath).existsSync()) {
      print('File not found: $filePath');
      return;
    }

    // Call the function to generate language files
    genLanguageFiles(filePath);
  } catch (e) {
    print('Error parsing command line arguments: $e');
  }
}

void genLanguageFiles(String filePath) {
  // Modify the rest of your code accordingly
  try {
    var file = File(filePath);
    var contents = file.readAsStringSync();

    // The rest of your existing code for processing language files
    // ...

    print('Language files successfully created in the lib folder.');
  } catch (e) {
    print('Error reading/writing files: $e');
  }
}
