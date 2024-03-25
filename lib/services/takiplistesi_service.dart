import 'dart:convert';
import 'dart:io';

import 'package:bahcem/models/uruntakip_model.dart';
import 'package:path_provider/path_provider.dart';

class BitkiTakipService {
  
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/assets/jsonfiles/bitkitakip.json');
  }

  static Future<List<Sebzetakip>> readBitkiTakip() async {
    try {
      final file = await _localFile;
      if (!await file.exists()) {
        print('Bitki takip dosyası bulunamadı, yeni dosya oluşturuluyor.');
        await file.create();
        return [];
      }
      String contents = await file.readAsString();
      List<dynamic> jsonList = jsonDecode(contents);
      List<Sebzetakip> bitkiTakipList = jsonList.map((json) => Sebzetakip.fromJson(json)).toList();
      return bitkiTakipList;
    } catch (e) {
      print('Hata: $e');
      return [];
    }
  }

  static Future<File> writeBitkiTakip(List<Sebzetakip> bitkiTakip) async {
    final file = await _localFile;
    try {
      List<Map<String, dynamic>> jsonList = bitkiTakip.map((bitki) => bitki.toJson()).toList();
      return file.writeAsString(jsonEncode(jsonList));
    } catch (e) {
      print('Hata: $e');
      rethrow;
    }
  }

  static Future<void> addBitkiTakip(Sebzetakip bitki) async {
    try {
      List<Sebzetakip> bitkiTakipList = await readBitkiTakip();
      bitkiTakipList.add(bitki);
      await writeBitkiTakip(bitkiTakipList);
      print('Bitki takip verisi başarıyla eklendi: $bitki');
    } catch (e) {
      print('Bitki takip verisi eklenirken bir hata oluştu: $e');
    }
  }

  static Future<void> removeBitkiTakip(String adtakip, DateTime tarihtakip, String dikimTipi) async {
    try {
      List<Sebzetakip> bitkiTakipList = await readBitkiTakip();
      bitkiTakipList.removeWhere((bitki) =>
          bitki.adtakip == adtakip && bitki.tarihtakip == tarihtakip && bitki.dikimTipi == dikimTipi);
      await writeBitkiTakip(bitkiTakipList);
      print('Bitki takip verisi başarıyla silindi: $adtakip, $dikimTipi, $tarihtakip');
    } catch (e) {
      print('Bitki takip verisi silinirken bir hata oluştu: $e');
    }
  }
}


// import 'dart:convert';
// import 'dart:io';

// import 'package:path_provider/path_provider.dart';

// class BitkiTakipService {
  
//   static Future<String> get _localPath async {
//     final directory = await getApplicationDocumentsDirectory();
//     return directory.path;
//   }

//   static Future<File> get _localFile async {
//     final path = await _localPath;
//     return File('$path/assets/jsonfiles/bitkitakip.json');
//   }

//   static Future<List<dynamic>> readBitkiTakip() async {
//     try {
//       final file = await _localFile;
//       if (!await file.exists()) {
//         print('Bitki takip dosyası bulunamadı, yeni dosya oluşturuluyor.');
//         await file.create();
//         return [];
//       }
//       String contents = await file.readAsString();
       

//       return jsonDecode(contents);
//     } catch (e) {
//       print('Hata: $e');
//       return [];
//     }
//   }

//   static Future<File> writeBitkiTakip(List<dynamic> bitkiTakip) async {
//     final file = await _localFile;
//     try {
//       return file.writeAsString(jsonEncode(bitkiTakip));
//     } catch (e) {
//       print('Hata: $e');
//       rethrow;
//     }
//   }

//   static Future<void> addBitkiTakip(Map<String, dynamic> bitki) async {
//     try {
//       List<dynamic> bitkiTakipList = await readBitkiTakip();
//       bitkiTakipList.add(bitki);
//       await writeBitkiTakip(bitkiTakipList);
//       print('Bitki takip verisi başarıyla eklendi: $bitki');
//     } catch (e) {
//       print('Bitki takip verisi eklenirken bir hata oluştu: $e');
//     }
//   }
//   static Future<void> removeBitkiTakip(String adtakip, DateTime tarihtakip, String dikimTipi) async {
//     try {
//       List<dynamic> bitkiTakipList = await readBitkiTakip();
//       bitkiTakipList.removeWhere((bitki) =>
//           bitki['adtakip'] == adtakip && bitki['tarihtakip'] == tarihtakip.toIso8601String() &&bitki['dikimTipi'] == dikimTipi);
//       await writeBitkiTakip(bitkiTakipList);
//       print('Bitki takip verisi başarıyla silindi: $adtakip,$dikimTipi, $tarihtakip');
//     } catch (e) {
//       print('Bitki takip verisi silinirken bir hata oluştu: $e');
//     }
//   }
  
// }
