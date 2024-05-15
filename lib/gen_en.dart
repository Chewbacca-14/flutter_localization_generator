import 'dart:io';

/// Generates an English translation file based on the input translation file.
///
/// The generated file follows the ARB (Application Resource Bundle) format.
/// The input translation file should have each translation block separated by a [splitElement].
/// Each translation block should have three values: key, other language translation, and English translation.
/// The generated file will have the English translation as the value for each key, and the other language translation as the description.
///
/// Parameters:
/// - [filePath] - The path to the input translation file.
/// - [languageCode] - The language code for the generated file.
/// - [splitElement] - The element used to split each translation block in the input file.
void genEn({
  required String filePath,
  required String languageCode,
  required String splitElement,
}) {
  try {
    // Construct the full file path for the generated file
    String currentPath = Directory.current.path;
    String fileName = 'app_$languageCode.arb';
    String fullPath = '$currentPath/lib/$fileName';

    // Read the contents of the input translation file
    var file = File(fullPath);
    file.createSync();
    var outputSink = file.openWrite();
    var translationfilePath = File(filePath);
    var contents = translationfilePath.readAsLinesSync().toList();
    contents.removeWhere((element) => element.isEmpty);

    // Write the initial opening brace for the JSON object
    outputSink.write('{\n');

    // Process each block in the translation file
    for (var block in contents) {
      // Check if the block is the last block in the file
      bool isLastBlock = block == contents.last;

      // Check if the block is not empty
      if (block.trim().isNotEmpty) {
        // Split the block into lines based on the split element
        var lines = block.split(splitElement);

        // Check if the line has the expected number of values (3)
        if (lines.length == 3) {
          // Extract key, other language translation, and English translation
          var key = lines[0].trim().replaceAll('"', '');
          var otherLang = lines[1].trim().replaceAll('"', '');
          var english = lines[2].trim().replaceAll('"', '');

          // Write the English translation to the output file (type en)
          outputSink.write(' "$key": "$english",\n');
          outputSink.write(' "@$key": {\n');
          outputSink.write('   "description": "$otherLang"\n');
          isLastBlock ? outputSink.write(' }\n') : outputSink.write(' },\n');
        } else {
          // If the block does not have the expected format, print an error
          outputSink.write('Incorrect translation file format: $block\n');
        }
      }
    }

    // Write the closing brace for the JSON object
    outputSink.write('}\n');

    // Close the output stream
    outputSink.close();

    // Print a success message
    print('File generated successfully: $filePath');
  } catch (e) {
    // Handle any errors that occur during file reading/writing
    print('Error reading/writing file: $e');
  }
}
