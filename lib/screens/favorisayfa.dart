import 'dart:developer';

import 'package:bahcem/models/uruntakip_model.dart';
import 'package:flutter/material.dart';
import 'package:bahcem/services/takiplistesi_service.dart';
import 'package:bahcem/components/favori_component.dart';

class FavoriSayfa extends StatefulWidget {
  @override
  _FavoriSayfaState createState() => _FavoriSayfaState();
}

class _FavoriSayfaState extends State<FavoriSayfa> {
  List<Sebzetakip> favoriListesi = [];
  late List<Sebzetakip> warningList =
      []; // warningList'i late keyword ile tanımlıyoruz ve başlangıçta boş bir liste olarak başlatıyoruz

  @override
  void initState() {
    super.initState();
    _getFavoriListesi();
  }

  Future<void> _getFavoriListesi() async {
    try {
      List<Sebzetakip> list = await BitkiTakipService.readBitkiTakip();
      setState(() {
        favoriListesi = list;
        for (var bitki in favoriListesi) {
          log(list.toString());
        }
        SulamaTakip(); // favoriListesi güncellendiğinde SulamaTakip fonksiyonunu çağır
      });
    } catch (e) {
      print('Hata: $e');
    }
  }

  void removeFromFavorites(Sebzetakip bitki) async {
    try {
      await BitkiTakipService.removeBitkiTakip(
          bitki.adtakip, bitki.tarihtakip, bitki.dikimTipi);
      setState(() {
        favoriListesi.remove(bitki);
      });
    } catch (e) {
      print('Hata: $e');
    }
  }

  int convertSulamaSikligiToString(String sulamaSikligi) {
    // String değerlere karşılık gelen sayısal değerlerin bulunduğu bir Map oluşturuyoruz
    final Map<String, int> conversionMap = {
      "Günde 1 kez": 1,
      "Günde 2 kez": 2,
      "Günde 1-2 kez": 1,
      "Haftada 1 kez": 7,
      "Haftada 2 kez": 3,
      "Haftada 1-2 kez": 4,
      "Haftada 2-3 kez": 3,
    };

    // conversionMap içindeki değeri döndürüyoruz, eğer değer bulunamazsa 0 döndürüyoruz
    return conversionMap[sulamaSikligi] ?? 0;
  }

  void SulamaTakip() {
    log('sulamatakip calisti'); // Bitki tarihini konsola yaz
    for (var bitki in favoriListesi) {
      //log("adtakip ${bitki.adtakip} ${bitki.dikimTipi} ");
      if (bitki.dikimTipi == 'Fidan') {
        // Bugünün tarihinden dikim tarihini çıkar
        //log('Bitki Tarihi: ${bitki.tarihtakip} ${DateTime.now()}'); // Bitki tarihini konsola yaz
        Duration difference = DateTime.now().difference(bitki.tarihtakip);
        // Sulama sıklığını kontrol etmek için gün sayısına böl
        double result = difference.inDays /
            convertSulamaSikligiToString(bitki.sulamaSikligitakip);
        print("aradaki fark gün cinsinden: ${difference.inDays}");

        log('Result: $result ${bitki.adtakip}');

        if (result.toInt() == result) {
          // Uyarı listesine ekle
          warningList.add(bitki);
        }
      } else if (bitki.dikimTipi == 'Tohum') {
        warningList.add(bitki);
      }
    }

    // Daha sonra warningList'i kullanabilirsiniz
    // Örneğin, ekrana bir uyarı vermek veya başka bir işlem yapmak için
    // Şu anda sadece uyarı listesini konsola yazıyoruz
    String warningNames = warningList
        .map((bitki) => '${bitki.adtakip} (${bitki.dikimTipi})')
        .join(', ');
    log("uyari adlari ${warningNames}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 66, 66, 66),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            const Icon(
              Icons.grass,
              color: Color.fromARGB(255, 0, 205, 24),
              size: 30,
            ),
            const SizedBox(width: 8),
            const Text(
              "Bahçemin Favorileri",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Uyarı listesindeki bitkilerin adlarını gösteren bir Container
          Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8),
constraints: BoxConstraints(minHeight: 60),            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 200, 200, 200),
              borderRadius:
                  BorderRadius.circular(20), // 10 birimlik kenar yuvarlama
            ),
            child: Text(
    '${warningList.map((bitki) => '${bitki.adtakip}(${bitki.dikimTipi})').join(', ')} için Sulama zamanı!',
              style: TextStyle(
                color: Color.fromARGB(255, 52, 52, 52),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
               maxLines: null,
                textAlign: TextAlign.center,
            ),
          ),
          // Favori listesini gösteren ListView
          Expanded(
            child: ListView.builder(
              itemCount: favoriListesi.length,
              itemBuilder: (context, index) {
                return FavoriComponent(
                  bitki: favoriListesi[index],
                  removeCallback: removeFromFavorites,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
