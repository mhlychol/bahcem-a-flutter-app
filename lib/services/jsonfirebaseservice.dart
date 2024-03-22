/*import 'dart:convert';
import 'dart:io';
import 'package:bahcem/models/sebzeler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

class JsonfirbaseService {
  static Future<List<Sebze>> getfirebazetojson() async {
    // Firestore'dan veri çek
    List<Sebze> sebzeler = await getSebzelerFromFirestore();

    // Çekilen veriyi JSON dosyasına kaydet
    await saveSebzelerListToJson(sebzeler);

    return sebzeler;
  }

  static Future<void> saveSebzelerListToJson(List<Sebze> sebzeler) async {
    final jsonData = sebzeler.map((sebze) => sebze.toJson()).toList();
    final jsonString = json.encode({"Sebze": jsonData});

    // Belgeler dizinine getApplicationDocumentsDirectory() ile eriş
    final directory = await getApplicationDocumentsDirectory();
    final filePath = File('${directory.path}/bitkiler.json');

    // JSON verisini dosyaya yaz
    await filePath.writeAsString(jsonString);

    String fileContent = await filePath.readAsString();

    if (await filePath.exists()) {
  print('Dosya mevcut: ${filePath.path}');

  // Dosyanın içeriğini satır satır konsola yazdır
  List<String> lines = fileContent.split('\n');
  for (String line in lines) {
    print(line);
}
} else {
  print('Dosya mevcut değil: ${filePath.path}');
}
  }

  static Future<List<Sebze>> getSebzelerFromFirestore() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('Sebzeler').get();

      List<Sebze> sebzeler = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        return Sebze(
          ad: data['ad'],
          imagePath: data['imagePath'],
          aciklama: data['aciklama'],
          aciklamadetay: data['aciklamadetay'],
          dikimAyi: List<String>.from(data['dikimAyi']),
          cimlenmeSuresi: data['cimlenmeSuresi'],
          buyumeSuresi: data['buyumeSuresi'],
          sulamaSikligi: data['sulamaSikligi'],
          toprakTuru: data['toprakTuru'],
          iklimTuru: data['iklimTuru'],
          mevsim: List<String>.from(data['mevsim']),
        );
        
      }).toList();

      print('Firebase\'den veri çekildi: ${sebzeler.length} öğe');
      return sebzeler;
    } catch (e) {
      print('Hata oluştu (getSebzelerFromFirestore): $e');
      return [];
    }
  }
}


*/


/*
class JsonFirebaseService {
  static Future<void> fetchAndWriteDataToFile() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Firebase'den Sebzeleri al
    List<Sebze> sebzeler = await getSebzelerFromFirestore();

    // Sebzeleri JSON dosyasına yaz
    await writeDataToFile(sebzeler);
  }

  static Future<void> writeDataToFile(List<Sebze> sebzeler) async {
    try {
     /* // Dizini al
      final directory = await getExternalStorageDirectory();
     */ final path = 'assets';

      // Dosya adı
      final fileName = 'bitkiler.json';

      // Dosya yolu oluştur
      final filePath = 'assets/bitkiler.json';

      // JSON verilerini bir dosyaya yaz
      final file = File(filePath);

      // Dosyayı oluşturmadan önce dizini kontrol et
      if (!Directory(path).existsSync()) {
        Directory(path).createSync(recursive: true);
        print('dosya yoktu olustu : $path');

      }
      else{
        print('dosya var');
      }

      // Dosyaya yazma işlemi
      await file.writeAsString(json.encode(sebzeler.map((sebze) => sebze.toJson()).toList()));

      print('Veriler başarıyla dosyaya yazıldı: $filePath');
    } catch (e) {
      print('Hata oluştu (writeDataToFile): $e');
    }
  }

  static Future<List<Sebze>> getSebzelerFromFirestore() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('Sebzeler').get();

      List<Sebze> sebzeler = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data()!;
        return Sebze(
          ad: data['ad'],
          imagePath: data['imagePath'],
          aciklama: data['aciklama'],
          aciklamadetay: data['aciklamadetay'],
          dikimAyi: List<String>.from(data['dikimAyi']),
          cimlenmeSuresi: data['cimlenmeSuresi'],
          buyumeSuresi: data['buyumeSuresi'],
          sulamaSikligi: data['sulamaSikligi'],
          toprakTuru: data['toprakTuru'],
          iklimTuru: data['iklimTuru'],
          mevsim: List<String>.from(data['mevsim']),
        );
      }).toList();

      print('Firebase\'den veri çekildi: ${sebzeler.length} öğe');
      return sebzeler;
    } catch (e) {
      print('Hata oluştu (getSebzelerFromFirestore): $e');
      return [];
    }
  }
}
*/