import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class LocalImagesList extends StatefulWidget {
  @override
  _LocalImagesListState createState() => _LocalImagesListState();
}

class _LocalImagesListState extends State<LocalImagesList> {
  List<File> _imageFiles = [];

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String localPath = '${directory.path}/assets/images';
    Directory localDirectory = Directory(localPath);
    List<FileSystemEntity> entities = localDirectory.listSync();
    List<File> imageFiles = [];

    entities.forEach((entity) {
      if (entity is File && _isImageFile(entity)) {
        imageFiles.add(entity);
      }
    });

    setState(() {
      _imageFiles = imageFiles;
    });
  }

  bool _isImageFile(FileSystemEntity entity) {
    String path = entity.path.toLowerCase();
    return path.endsWith('.jpg') || path.endsWith('.jpeg') || path.endsWith('.png') || path.endsWith('.gif');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Images'),
      ),
      body: _imageFiles.isEmpty
          ? Center(
              child: Text('No images found.'),
            )
          : ListView.builder(
              itemCount: _imageFiles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.file(
                    _imageFiles[index],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(_imageFiles[index].path.split('/').last),
                );
              },
            ),
    );
  }
}
