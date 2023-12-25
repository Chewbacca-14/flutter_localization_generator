// gen_en.dart
import 'dart:io';

import 'package:args/args.dart';

void genEn(String filePath) {
  Directory current = Directory.current;
  String currentclear = current
      .toString()
      .replaceAll('Directory:', '')
      .replaceAll('\'', '')
      .replaceAll(' ', '');
  String path = '${currentclear}\\lib';
  var outputFilePath = '$path/en.arb'; // Include the file name
  print(path);

  try {
    var file = File(filePath);
    var contents = file.readAsStringSync();

    var blocks = contents.split('\n');

    var outputFile = File(outputFilePath);
    var outputSink = outputFile.openWrite();

    outputSink.write('{\n');

    for (var block in blocks) {
      if (block.trim().isNotEmpty) {
        var lines = block.split(';');
        if (lines.length == 3) {
          var key = lines[0].trim().replaceAll('"', '');
          var russian = lines[1].trim().replaceAll('"', '');
          var english = lines[2].trim().replaceAll('"', '');

          outputSink.write(' "$key": "$english",\n');
          outputSink.write(' "@$key": {\n');
          outputSink.write('   "description": "$russian"\n');
          outputSink.write(' },\n');
        } else {
          outputSink
              .write('// Пропущен блок из-за неверного формата: $block\n');
        }
      }
    }

    outputSink.write('}\n');
    outputSink.close();

    print('Файл en.arb успешно создан: $outputFilePath');
  } catch (e) {
    print('Ошибка при чтении/записи файла: $e');
  }
}

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
}

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