import 'dart:io';

void genOther(String languageCode) {
  var filePath = 'C:\\Users\\Max\\Downloads\\testb.txt';
  var outputFilePath = 'C:\\Users\\Max\\Downloads\\app_$languageCode.arb';

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

          outputSink.write(' "$key": "$russian",\n');
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
