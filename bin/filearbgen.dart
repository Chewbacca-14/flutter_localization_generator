import 'dart:io';
import 'package:args/args.dart';
import 'package:filearbgen/gen_en.dart';

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
  genEn(filePath);
  // try {
  //   var file = File(filePath);
  //   var contents = file.readAsStringSync();

  //   // Replace this with your actual logic for processing language files
  //   // For example, you might split the contents into lines and process each line
  //   // ...

  //   // Example: Writing processed contents to a new file in the Downloads folder
  //   var outputFileName = 'language.arb';
  //   var outputDirectory = Directory('Downloads');
  //   if (!outputDirectory.existsSync()) {
  //     outputDirectory.createSync();
  //   }

  //   var outputFile = File('${outputDirectory.path}/$outputFileName');
  //   outputFile.writeAsStringSync(contents);

  //   print('Language file successfully created in the Downloads folder.');
  // } catch (e) {
  //   print('Error reading/writing files: $e');
  // }
}
