import 'dart:io';

void genEn({
  required String filePath,
  required String languageCode,
  required String splitElement,
}) {
  // Construct the full file path for the file gen
  String currentPath = Directory.current.path;
  String fileName = 'app_$languageCode.arb';
  String fullPath = '$currentPath/lib/$fileName';

  try {
    // Create a new output file and open a write stream
    var outputFile = File(filePath);
    var outputSink = outputFile.openWrite();
    // Write the initial opening brace for the JSON object
    outputSink.write('{\n');

    // Process each block (you can replace this with your logic)
    // For demonstration purposes, writing a sample block
    outputSink.write('"key1": "English Translation 1",\n');
    outputSink.write('"@key1": {\n');
    outputSink.write('  "description": "Other language translation 1"\n');
    outputSink.write('},\n');
    outputSink.write('"key2": "English Translation 2",\n');
    outputSink.write('"@key2": {\n');
    outputSink.write('  "description": "Other language translation 2"\n');
    outputSink.write('}\n');

    // Write the closing brace for the JSON object
    outputSink.write('}\n');
    // Close the output stream
    outputSink.close();

    // Print a success message
    print('File generated successfully: $filePath');
  } catch (e) {
    // Handle any errors that occur during file writing
    print('Error writing file: $e');
  }
}
