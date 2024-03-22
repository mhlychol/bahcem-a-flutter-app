import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> downloadAndPrintJsonFiles() async {
    try {
      // Uygulamanın yerel dizinini alın
      Directory directory = await getApplicationDocumentsDirectory();
      String localPath = '${directory.path}/assets/jsonfiles';

      // Eğer klasör yoksa, oluşturun
      Directory(localPath).create(recursive: true);

      // Firebase Storage'daki JSON dosyaları için referansı oluşturun
      Reference jsonStorageRef = _storage.ref().child('assets/jsonfiles');

      // İndirme işlemi için JSON dosyalarının listesini alın
      ListResult jsonResult = await jsonStorageRef.listAll();

      // Her bir JSON dosyasını indirin, yerel dosyaya kaydedin ve içeriğini yazdırın
      for (var item in jsonResult.items) {
        String fileName = item.name;
        File localFile = File('$localPath/$fileName');

        // Eğer dosya zaten varsa, üzerine yazmayın
        if (localFile.existsSync()) {
          await item.writeToFile(localFile);

          log('${localPath}/${fileName} dosyası var, guncellendi...');
        } else {
          // Dosya yoksa, normal indirme işlemi
          await item.writeToFile(localFile);
          log('${localPath}/${fileName} dosyası başarıyla indirildi ve yerel dosyaya kaydedildi.');

          // Dosyanın içeriğini okuyun
          
        }
        String fileContent = await localFile.readAsString();

          // İçeriği konsola yazdırın
          log('JSON dosyası içeriği:');
          log(fileContent);
      }

      log('Tüm JSON dosyaları başarıyla indirildi, yerel dosyalara kaydedildi ve içerikleri konsola yazdırıldı.');
    } catch (e) {
      log('JSON dosyalarını indirirken bir hata oluştu: $e');
    }
  }

  Future<void> downloadImages() async {
    try {
      // Uygulamanın yerel dizinini alın
      Directory directory = await getApplicationDocumentsDirectory();
      String localPath = '${directory.path}/assets/images';

      // Eğer klasör yoksa, oluşturun
      Directory(localPath).create(recursive: true);

      // Firebase Storage'daki resim dosyaları için referansı oluşturun
      Reference imageStorageRef = _storage.ref().child('assets/images');

      // İndirme işlemi için resim dosyalarının listesini alın
      ListResult imageResult = await imageStorageRef.listAll();

      // Her bir resim dosyasını indirin ve yerel dosyaya kaydedin
      for (var item in imageResult.items) {
        String fileName = item.name;
        File localFile = File('$localPath/$fileName');

        // Eğer dosya zaten varsa, üzerine yazmayın
        if (localFile.existsSync()) {
          log('${localPath}/${fileName} dosyası var, guncellendi...');
        } else {
          // Dosya yoksa, normal indirme işlemi
          await item.writeToFile(localFile);
          log('${localPath}/${fileName} dosyası başarıyla indirildi ve yerel dosyaya kaydedildi.');
        }
      }

      log('Tüm resim dosyaları başarıyla indirildi ve yerel dosyalara kaydedildi.');
    } catch (e) {
      log('Resim dosyalarını indirirken bir hata oluştu: $e');
    }
  }
}

