import 'dart:io';

/// This script scans all generated `.g.dart` files and scales down 
/// any integer literal that exceeds JavaScript's MAX_SAFE_INTEGER 
/// so that Flutter Web can compile successfully.
void main() async {
  final directory = Directory('lib');
  
  if (!directory.existsSync()) {
    print('Run this from the root of your Flutter project.');
    return;
  }

  // JS Number.MAX_SAFE_INTEGER
  final maxSafeInt = BigInt.parse('9007199254740991');
  
  // Find all generated dart files
  final files = directory
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) => f.path.endsWith('.g.dart'));

  int filesPatched = 0;

  for (final file in files) {
    String content = await file.readAsString();
    bool fileChanged = false;

    // Regex to find large numbers (16+ digits usually cross the JS threshold)
    final regex = RegExp(r'\b(\d{16,})\b');

    content = content.replaceAllMapped(regex, (match) {
      final numStr = match.group(1)!;
      final bigNumber = BigInt.tryParse(numStr);

      if (bigNumber != null && bigNumber > maxSafeInt) {
        fileChanged = true;
        // Modulo the huge number by the max safe integer to keep it unique but safe for JS
        final safeNumber = bigNumber.remainder(maxSafeInt).abs();
        print('  - Replaced $numStr -> $safeNumber in ${file.path.split(Platform.pathSeparator).last}');
        return safeNumber.toString();
      }
      return numStr;
    });

    if (fileChanged) {
      await file.writeAsString(content);
      filesPatched++;
    }
  }

  print('✅ Finished patching $filesPatched Isar generated file(s) for Web.');
}