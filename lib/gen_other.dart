import 'dart:io';

void genOther(String inputFilePath, String languageCode) {
  // Get the current working directory
  String currentPath = Directory.current.path;

  // Create a file name based on the language code
  String fileName = 'app_$languageCode.arb';

  // Construct the full file path for the output file
  String filePath = '$currentPath\\lib/$fileName';

  try {
    // Read the contents of the input translation file
    var file = File(inputFilePath);
    var contents = file.readAsStringSync();

    // Split the contents into blocks based on line breaks
    var blocks = contents.split('\n');

    // Create a new output file and open a write stream
    var outputFile = File(filePath);
    var outputSink = outputFile.openWrite();

    // Write the initial opening brace for the JSON object
    outputSink.write('{\n');

    // Process each block in the translation file
    for (var block in blocks) {
      // Check if the block is not empty
      if (block.trim().isNotEmpty) {
        // Split the block into lines based on semicolons
        var lines = block.split(';');

        // Check if the block has the expected number of lines (3)
        if (lines.length == 3) {
          // Extract key and Russian translation
          var key = lines[0].trim().replaceAll('"', '');
          var otherLang = lines[1].trim().replaceAll('"', '');

          // Write the Russian translation to the output file
          outputSink.write(' "$key": "$otherLang",\n');
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

    // Create an empty file at the specified path
    File filefile = File(filePath);
    filefile.createSync();

    // Print a success message
    print('File generated successfully: $filePath');
  } catch (e) {
    // Handle any errors that occur during file reading/writing
    print('Error reading/writing file: $e');
  }
}
