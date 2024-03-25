import 'dart:convert';
import 'dart:io';
import 'package:bahcem/models/uruntakip_model.dart';
import 'package:bahcem/models/bitkihastalik.dart';
import 'package:bahcem/models/sebzeler.dart';
import 'package:bahcem/models/zararlilar.dart';

import 'package:path_provider/path_provider.dart';

class JsonService {
  static final List<Sebze> _sebzeMenu = [];
  static final List<Zararli> _zararliMenu = [];
static final List<Hastalik> _hastalikMenu = [];


  static List<Sebze> get sebzeMenu => _sebzeMenu;
  static List<Zararli> get zararliMenu => _zararliMenu;
  static List<Hastalik> get hastalikMenu => _hastalikMenu;

  static Future<void> loadSebzeler() async {
    // Clear previous data
    _sebzeMenu.clear();

    // Get the documents directory
    final directory = await getApplicationDocumentsDirectory();
      final localPath = '${directory.path}';
      final filePath = File('$localPath/assets/jsonfiles/bitkiler.json');
    // Check if the file exists
    if (await filePath.exists()) {
      // Read data from the file
      final data = await filePath.readAsString();
      var jsonData = json.decode(data)["Sebze"] as List<dynamic>;

      // Add data to sebzeMenu
    _sebzeMenu.addAll(jsonData.map((e) => Sebze.fromJson(e, localPath)));
    } else {
      print('Dosya bulunamadı.');
    }
  }

static Future<void> loadZararlilar() async {
    // Clear previous data
    _zararliMenu.clear();

    // Get the documents directory
    final directory = await getApplicationDocumentsDirectory();
      final localPath = '${directory.path}';
      final filePath = File('$localPath/assets/jsonfiles/zararlilar.json');
    // Check if the file exists
    if (await filePath.exists()) {
      // Read data from the file
      final data = await filePath.readAsString();
      var jsonData = json.decode(data)["Zararli"] as List<dynamic>;

      // Add data to sebzeMenu
    _zararliMenu.addAll(jsonData.map((e) => Zararli.fromJson(e, localPath)));
    } else {
      print('Dosya bulunamadı.');
    }
  }

  
  static Future<void> loadHastalik() async {
    // Clear previous data
    _hastalikMenu.clear();

    // Get the documents directory
    final directory = await getApplicationDocumentsDirectory();
      final localPath = '${directory.path}';
      final filePath = File('$localPath/assets/jsonfiles/hastalik.json');
    // Check if the file exists
    if (await filePath.exists()) {
      // Read data from the file
      final data = await filePath.readAsString();
      var jsonData = json.decode(data)["Hastalik"] as List<dynamic>;

      // Add data to sebzeMenu
    _hastalikMenu.addAll(jsonData.map((e) => Hastalik.fromJson(e, localPath)));
    } else {
      print('Dosya bulunamadı.');
    }
  }
}

/*
class JsonService {
  static final List<Sebze> _sebzeMenu = [];

  static List<Sebze> get sebzeMenu => _sebzeMenu;

  static Future<void> loadSebzeler() async {
  // Clear previous data
  _sebzeMenu.clear();

  final data = await rootBundle.loadString('assets/bitkiler.json');
  var jsonData = json.decode(data)["Sebze"] as List<dynamic>;

  // Add data to sebzeMenu
  _sebzeMenu.addAll(jsonData.map((e) => Sebze.fromJson(e)));
}

}

*/
/*
class SebzeService {
  Future<List<Sebze>> getSebzeMenu(BuildContext context) async {
    String jsonData = await DefaultAssetBundle.of(context).loadString("assets/json/sebzeler.json");
    List<Map<String, dynamic>> sebzeListesi = List<Map<String, dynamic>>.from(jsonDecode(jsonData)["Sebze"]);

    List<Sebze> sebzeler = sebzeListesi.map((sebzeMap) {
      return Sebze(
        ad: sebzeMap["ad"],
        imagePath: sebzeMap["imagePath"],
        aciklama: sebzeMap["aciklama"],
        aciklamadetay: sebzeMap["aciklamadetay"],
        dikimAyi: List<String>.from(sebzeMap["dikimAyi"]),
        cimlenmeSuresi: sebzeMap["cimlenmeSuresi"],
        buyumeSuresi: sebzeMap["buyumeSuresi"],
        sulamaSikligi: sebzeMap["sulamaSikligi"],
        toprakTuru: sebzeMap["toprakTuru"],
        iklimTuru: sebzeMap["iklimTuru"],
        mevsim: List<String>.from(sebzeMap["mevsim"]),
      );
    }).toList();

    return sebzeler;
  }
}
*/    