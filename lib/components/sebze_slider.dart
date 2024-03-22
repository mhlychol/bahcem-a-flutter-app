import 'dart:developer';

import 'package:bahcem/models/sebzeler.dart';
import 'package:bahcem/services/image_service.dart';
import 'package:flutter/material.dart';

class KareSebzeTile extends StatelessWidget {
  final Sebze sebze;
  
  const KareSebzeTile({Key? key, required this.sebze}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      int? imageIndex = LocalImageService.getImageIndex('${sebze.imagePath}');

    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      width: 100,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: imageIndex != null
                ? Image.file(
                    LocalImageService.imageFiles[imageIndex],
                    
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  )
                : Container(), // Eğer resim bulunamazsa boş bir container döndür
          ),
          Text(
            sebze.ad,
            style: const TextStyle(
              color: Color.fromARGB(255, 6, 75, 9),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
