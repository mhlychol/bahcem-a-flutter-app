import 'dart:convert';
import 'dart:io';
import 'package:bahcem/models/bitkihastalik.dart';
import 'package:bahcem/services/image_service.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Hastalikliste extends StatelessWidget {
  final Hastalik hastalik;
  
  const Hastalikliste({Key? key, required this.hastalik});
 
  @override
  Widget build(BuildContext context) {
    int? imageIndex = LocalImageService.getImageIndex('${hastalik.hastalikresim}');

    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ZararlidetaySayfa(selectedzararli: zararli),
        //   ),
        // );
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(  
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).
  size.width / 4,
              height: 100,
             child: ClipOval(
            child: imageIndex != null
                ? Image.file(
                    LocalImageService.imageFiles[imageIndex],
                    
                     height: MediaQuery.of(context).size.width / 4,
                  width: MediaQuery.of(context).size.width / 4,
                    fit: BoxFit.cover,
                  )
                : Container(), // Eğer resim bulunamazsa boş bir container döndür
          ),
            //   child: ClipOval(
            //     child: Image.asset(
            //       sebze.imagePath,
            //       height: MediaQuery.of(context).size.width / 4,
            //       width: MediaQuery.of(context).size.width / 4,
            //       fit: BoxFit.cover,
            //     ),
            //   ),
             ),
            Expanded(
              child: Column(
                children: [
                  Container(
  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              hastalik.hastalikadi,
              style: TextStyle(
                color: Colors.green[500],
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            Text(
              hastalik.hastalikbitkileri.join(', '),
              style: TextStyle(
                color: Color.fromARGB(255, 255, 111, 0),
                fontSize: 14,
              ),
              maxLines: 2,
            ),
          ],
        ),
      ),
    ],
  ),
),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      hastalik.hastalikaciklama,
                      style: const TextStyle(
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
