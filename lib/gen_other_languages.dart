import 'dart:io';

/// Generates an output file in ARB format based on the input translation file.
///
/// The generated file will contain translations for a specific language.
/// The input translation file should have a specific format where each block
/// represents a translation entry with three lines: key, translation, and
/// additional information.
///
/// The generated file will be saved in the same directory as the input file
/// with a file name based on the language code.
///
/// Parameters:
/// - [inputFilePath] - The path to the input translation file.
/// - [languageCode] - The language code for the translations.
/// - [splitElement] - The element used to split the translation blocks.
void genOther({
  required String inputFilePath,
  required String languageCode,
  required String splitElement,
}) {
  // Get the current working directory
  String currentPath = Directory.current.path;

  // Create a file name based on the language code
  String fileName = 'app_$languageCode.arb';

  // Construct the full file path for the output file
  String filePath = '$currentPath\\lib/$fileName';

  // Read the contents of the input translation file
  File file = File(filePath);
  file.createSync();
  IOSink outputSink = file.openWrite();
  File translationfilePath = File(inputFilePath);
  List<String> contents = translationfilePath.readAsLinesSync().toList();
  contents.removeWhere((element) => element.isEmpty);
  print(contents);

  // Create a new output file and open a write stream

  // Write the initial opening brace for the JSON object
  outputSink.write('{\n');
  try {
    // Process each block in the translation file
    for (String block in contents) {
      // Check if the block is the last block in the file
      bool isLastBlock = block == contents.last;
      // Check if the block is not empty
      if (block.trim().isNotEmpty) {
        // Split the block into lines based on the split element
        var lines = block.split(splitElement);

        // Check if the block has the expected number of lines (3)
        if (lines.length == 3) {
          // Extract key and translation
          var key = lines[0].trim().replaceAll('"', '');
          var otherLang = lines[1].trim().replaceAll('"', '');

          // Write the translation to the output file
          isLastBlock
              ? outputSink.write(' "$key": "$otherLang"\n')
              : outputSink.write(' "$key": "$otherLang",\n');
        } else {
          // If the block does not have the expected format, print an error
          outputSink.write(
              '[Input File Error] Incorrect translation file format: $block\n');
        }
      }
    }

    // Write the closing brace for the JSON object
    outputSink.write('}\n');

    // Close the output stream
    outputSink.close();

    // Create an empty file at the specified path
    File filefile = File(filePath);
    filefile.createSync();

    // Print a success message
    print('File generated successfully: $filePath');
  } catch (e) {
    // Handle any errors that occur during file reading/writing
    print('[Reading/Writing File Error] $e');
  }
}
