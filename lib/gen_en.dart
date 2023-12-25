// import 'dart:io';

// void genEn(String filePath) {
//   Directory current = Directory.current;
//   String currentclear = current
//       .toString()
//       .replaceAll('Directory:', '')
//       .replaceAll('\'', '')
//       .replaceAll(' ', '');
//   String path = '${currentclear}\lib';
//   var outputFilePath = path;
//   print(path);

//   try {
//     var file = File(filePath);
//     var contents = file.readAsStringSync();

//     var blocks = contents.split('\n');

//     var outputFile = File(outputFilePath);
//     var outputSink = outputFile.openWrite();

//     outputSink.write('{\n');

//     for (var block in blocks) {
//       if (block.trim().isNotEmpty) {
//         var lines = block.split(';');
//         if (lines.length == 3) {
//           var key = lines[0].trim().replaceAll('"', '');
//           var russian = lines[1].trim().replaceAll('"', '');
//           var english = lines[2].trim().replaceAll('"', '');

//           outputSink.write(' "$key": "$english",\n');
//           outputSink.write(' "@$key": {\n');
//           outputSink.write('   "description": "$russian"\n');
//           outputSink.write(' },\n');
//         } else {
//           outputSink
//               .write('// Пропущен блок из-за неверного формата: $block\n');
//         }
//       }
//     }

//     outputSink.write('}\n');
//     outputSink.close();

//     print('Файл en.arb успешно создан: $outputFilePath');
//   } catch (e) {
//     print('Ошибка пр чтении/записи файла: $e');
//   }
// }
// //gg