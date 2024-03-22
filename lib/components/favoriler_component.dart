import 'package:bahcem/services/image_service.dart';
import 'package:bahcem/services/takiplistesi_service.dart';
import 'package:flutter/material.dart';
import 'package:bahcem/models/sebzeler.dart'; // Sebze ve Sebzetakip modellerinin bulunduğu dosyanın yolu
import 'package:intl/intl.dart'; // intl paketini ekleyin

class BitkiTakipListesiComponent extends StatefulWidget {
  @override
  _BitkiTakipListesiComponentState createState() =>
      _BitkiTakipListesiComponentState();
}

class _BitkiTakipListesiComponentState
    extends State<BitkiTakipListesiComponent> {
  List<dynamic> bitkiTakipListesi = [];

  @override
  void initState() {
    super.initState();
    _getBitkiTakipListesi();
  }

  Future<void> _getBitkiTakipListesi() async {
    try {
      List<dynamic> list = await BitkiTakipService.readBitkiTakip();
      setState(() {
        bitkiTakipListesi = list;
      });
    } catch (e) {
      print('Hata: $e');
    }
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: ListView.builder(
      itemCount: bitkiTakipListesi.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> bitki = bitkiTakipListesi[index];
        DateTime tarih = DateTime.parse(bitki['tarihtakip']);
        String formattedDate = DateFormat.yMMMd().format(tarih);
        
        // Burada imageIndex değerini alın
        int? imageIndex = LocalImageService.getImageIndex(bitki['imagePathtakip']);

        return ListTile(
          leading: imageIndex != null
              ? Image.file(
                  LocalImageService.imageFiles[imageIndex],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )
              : Container(width: 50, height: 50), // Resim bulunamazsa boş bir container döndür
          title: Text(bitki['adtakip']),
          subtitle: Text('Eklenme Tarihi: $formattedDate'),
          trailing: IconButton(
            icon: Icon(Icons.heart_broken),
            onPressed: () async {
              await BitkiTakipService.removeBitkiTakip(
                  bitki['adtakip'], DateTime.parse(bitki['tarihtakip']));
              await _getBitkiTakipListesi();
            },
          ),
        );
      },
    ),
  );
}

}
