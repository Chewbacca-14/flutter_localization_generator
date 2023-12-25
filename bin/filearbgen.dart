import 'dart:io';
import 'package:args/args.dart';

void genEn(String inputFilePath) {
  String currentPath = Directory.current.path;

  // Укажите имя файла и путь, где вы хотите его создать
  String fileName = 'entest.arb';
  String filePath = '$currentPath/$fileName';

  var outputFilePath = filePath;

  try {
    var file = File(inputFilePath); // Use the function parameter here
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
    File filefile = File(filePath);
    filefile.createSync();

    print('Файл testen.arb успешно создан: $outputFilePath');
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
    genEn(filePath);
  } catch (e) {
    print('Error parsing command line arguments: $e');
  }
}
