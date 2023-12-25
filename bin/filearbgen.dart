import 'dart:io';
import 'package:args/args.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption('filepath', abbr: 'f', mandatory: true)
    ..addOption('languagecode', abbr: 'l', defaultsTo: 'app_langcode.arb')
    ..addOption('type', abbr: 't', defaultsTo: 'en');

  try {
    final results = parser.parse(arguments);
    final filePath = results['filepath'] as String;
    final outputFileName = results['languagecode'] as String;
    final type = results['type'] as String;

    if (!File(filePath).existsSync()) {
      print('File not found: $filePath');
      return;
    }
    if (type == 'en') {
      genEn(filePath, outputFileName);
    } else if (type == 'other') {
      genOther(filePath, outputFileName);
    } else {
      print('Type error, please write type en or other');
    }
  } catch (e) {
    print('Error parsing command line arguments: $e');
  }
}

void genEn(String inputFilePath, String languageCode) {
  String currentPath = Directory.current.path;

  // Укажите имя файла и путь, где вы хотите его создать
  String fileName = 'app_$languageCode.arb';
  String filePath = '$currentPath\\lib/$fileName';

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

    print('Файл успешно создан: $outputFilePath');
  } catch (e) {
    print('Ошибка при чтении/записи файла: $e');
  }
}

void genOther(String inputFilePath, String languageCode) {
  String currentPath = Directory.current.path;

  // Укажите имя файла и путь, где вы хотите его создать
  String fileName = 'app_$languageCode.arb';
  String filePath = '$currentPath\\lib/$fileName';

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

          outputSink.write(' "$key": "$russian",\n');
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

    print('Файл успешно создан: $outputFilePath');
  } catch (e) {
    print('Ошибка при чтении/записи файла: $e');
  }
}
