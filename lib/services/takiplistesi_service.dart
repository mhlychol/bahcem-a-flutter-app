//dosya yoksa olusturacak
//secili urunu json dosyasina ekleyecek
//secili urunu json dosyasindan silecek
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class BitkiTakipService {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/bitkitakip.json');
  }

  static Future<List<dynamic>> readBitkiTakip() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      return jsonDecode(contents);
    } catch (e) {
      return [];
    }
  }

  static Future<File> writeBitkiTakip(List<dynamic> bitkiTakip) async {
    final file = await _localFile;
    return file.writeAsString(jsonEncode(bitkiTakip));
  }

  static Future<void> addBitkiTakip(Map<String, dynamic> bitki) async {
    List<dynamic> bitkiTakipList = await readBitkiTakip();
    bitkiTakipList.add(bitki);
    await writeBitkiTakip(bitkiTakipList);
  }
}
