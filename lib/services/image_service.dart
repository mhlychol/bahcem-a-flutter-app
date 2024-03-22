import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class LocalImageService {
  static List<File> _imageFiles = [];

  static Future<void> loadImages() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String localPath = '${directory.path}/assets/images';
    Directory localDirectory = Directory(localPath);
    List<FileSystemEntity> entities = localDirectory.listSync();

    _imageFiles.clear();

    entities.forEach((entity) {
      if (entity is File && _isImageFile(entity)) {
        _imageFiles.add(entity);
        print('Added image: ${entity.path.split('/').last}'); // Resim adını konsola yazdır
      }
    });
  }

  static String? getImagePath(String imageName) {
    String? imagePath;
    for (var file in _imageFiles) {
      if (file.path.split('/').last == imageName) {
        imagePath = file.path;
        
        break;
      }
    }
    return imagePath;
  }

  static int? getImageIndex(String imageName) {
    int? imageIndex;
    for (int i = 0; i < _imageFiles.length; i++) {
      log('Image name: ${_imageFiles[i].path.split('/').last}, Sebze image path: $imageName');

      if (_imageFiles[i].path.split('/').last == imageName) {
        imageIndex = i;
        log('imageIndex $imageIndex');
        break;
      }
    }
    return imageIndex;
  }

  static List<File> get imageFiles => _imageFiles; // imageFiles adında bir metot eklendi

  static bool _isImageFile(FileSystemEntity entity) {
    String path = entity.path.toLowerCase();
    return path.endsWith('.jpg') ||
        path.endsWith('.jpeg') ||
        path.endsWith('.png') ||
        path.endsWith('.gif');
  }
}
