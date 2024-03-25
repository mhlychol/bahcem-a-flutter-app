import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bahcem/services/image_service.dart';
import 'package:bahcem/models/uruntakip_model.dart'; // Sebzetakip sınıfını dahil ediyoruz
import 'package:bahcem/services/takiplistesi_service.dart';

class FavoriComponent extends StatelessWidget {
  final Sebzetakip bitki; // Değişken türünü Sebzetakip olarak güncelliyoruz
  final Function(Sebzetakip) removeCallback; // removeCallback fonksiyonunun türünü güncelliyoruz

  FavoriComponent({required this.bitki, required this.removeCallback});

  @override
  Widget build(BuildContext context) {
    DateTime tarih = bitki.tarihtakip; // tarih değişkenini bitki.nesnesinden alıyoruz
    String formattedDate = DateFormat.yMMMd().format(tarih);
    int? imageIndex =
        LocalImageService.getImageIndex(bitki.imagePathtakip);

    return Container(
      height: 200,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(  
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 4,
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
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            bitki.adtakip + ' ',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(bitki.dikimTipi), // Using null-aware operator
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(Icons.heart_broken,color: Colors.red,),
                            onPressed: () async {
                              await BitkiTakipService.removeBitkiTakip(
                                bitki.adtakip, 
                                bitki.tarihtakip, 
                                bitki.dikimTipi ?? ""
                              );
                              removeCallback(bitki);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text('Eklenme Tarihi: $formattedDate'),
                Text('Sulama Sıklığı: ' + bitki.sulamaSikligitakip),
                Text('Çimlenme Süresi: ' + bitki.cimlenmeSuresitakip),
                Text('Mevsim: ${bitki.mevsimtakip.join(', ')}'),
                Text('Büyüme Süresi: ' + bitki.buyumeSuresitakip),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
