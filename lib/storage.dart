import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Storage {
  Future<Directory> get documentsDir async {
    return await getApplicationDocumentsDirectory();
  }

  Future<File> writeFile(File file, Map<String, dynamic> data) async {
    return await file.writeAsString(jsonEncode(data));
  }

  Future<Map<String, dynamic>> readFile(File file) async {
    String fileContent = await file.readAsString();
    return jsonDecode(fileContent) as Map<String, dynamic>;
  }
}
