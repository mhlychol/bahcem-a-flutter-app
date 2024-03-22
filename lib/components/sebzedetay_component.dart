import 'dart:developer';
import 'package:bahcem/services/image_service.dart';
import 'package:bahcem/services/takiplistesi_service.dart';
import 'package:intl/intl.dart';

import 'package:bahcem/models/sebzeler.dart';
import 'package:bahcem/models/uruntakip_model.dart';
import 'package:flutter/material.dart';

class Sebzedetaycomp extends StatelessWidget {
  final Sebze sebze;
  const Sebzedetaycomp({super.key, required this.sebze});

  void takipbuton(BuildContext context) async {
  DateTime? secilenTarih = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(DateTime.now().month - 6),
    lastDate: DateTime.now(),
    //locale: const Locale('tr', 'TR'), // Türkçe dil ayarı
    
  );

  if (secilenTarih != null) {
        DateTime tarihSadece = DateTime(secilenTarih.year, secilenTarih.month, secilenTarih.day);

    Sebzetakip sebzeTakip = Sebzetakip(
      adtakip: sebze.ad,
      imagePathtakip: sebze.imagePath,
      dikimAyitakip: sebze.dikimAyi,
      cimlenmeSuresitakip: sebze.cimlenmeSuresi,
      buyumeSuresitakip: sebze.buyumeSuresi,
      sulamaSikligitakip: sebze.sulamaSikligi,
      mevsimtakip: sebze.mevsim,
      tarihtakip: secilenTarih,
    );
    String formattedDate = DateFormat('dd.MM.yyyy').format(secilenTarih!);
log(formattedDate);
      await BitkiTakipService.addBitkiTakip(sebzeTakip.toJson());

    // Burada sebzeyi takip listesine ekleyebilirsiniz.
    // Örneğin:
    // takipListesi.add(sebzeTakip);
  }
}


  @override
  Widget build(BuildContext context) {
              int? imageIndex = LocalImageService.getImageIndex('${sebze.imagePath}');

    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 227, 227, 227),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sebze.ad,
                  style: TextStyle(
                    color: Color.fromARGB(225, 17, 139, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Text(
                  sebze.dikimAyi.join(', '),
                  style: TextStyle(
                    color: Colors.green[150],
                    fontSize: 15,
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(10.0), // Adjust the value as needed
                  child: AspectRatio(
                    aspectRatio: 0.75,
                    child: imageIndex != null
                ? Image.file(
                    LocalImageService.imageFiles[imageIndex],
                    
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  )
                 : Container(),
                //     child: Image.asset(
                //       sebze.imagePath,
                //       fit: BoxFit.cover,
                //     ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 5),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 238, 238, 238),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                      child: Text(
                                        'MEVSİM',
                                        style: TextStyle(
                                          color: Colors.green[500],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                      child: Text(
                                        sebze.mevsim.join(', '),
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                                width:
                                    4), // Aralarda 2 birimlik boşluk ekleniyor
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                      child: Text(
                                        'İKLİM',
                                        style: TextStyle(
                                          color: Colors.green[500],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                      child: Text(
                                        sebze.iklimTuru,
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Aralarda 2 birimlik boşluk ekleniyor
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 5),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                      child: Text(
                                        'TOPRAK TÜRÜ',
                                        style: TextStyle(
                                          color: Colors.green[500],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                      child: Text(
                                        sebze.toprakTuru,
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                                width:
                                    4), // Aralarda 2 birimlik boşluk ekleniyor
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                      child: Text(
                                        'ÇİMLENME',
                                        style: TextStyle(
                                          color: Colors.green[500],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                      child: Text(
                                        sebze.cimlenmeSuresi,
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 5),

                            // Aralarda 2 birimlik boşluk ekleniyor
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                      child: Text(
                                        'BÜYÜME',
                                        style: TextStyle(
                                          color: Colors.green[500],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                      child: Text(
                                        sebze.buyumeSuresi,
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                                width:
                                    4), // Aralarda 2 birimlik boşluk ekleniyor
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                      child: Text(
                                        'SULAMA',
                                        style: TextStyle(
                                          color: Colors.green[500],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                      child: Text(
                                        sebze.sulamaSikligi,
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            height: 80,
            child: SingleChildScrollView(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Takip listeme ekle',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                      width:
                          10), // Buton ile metin arasında boşluk eklemek için
                  IconButton(
      onPressed: () => takipbuton(context), // Anonim fonksiyon kullanarak takipbuton'u sarmalama
      icon: Icon(Icons.favorite),
      iconSize: 50,
      color: Colors.red,
      padding: EdgeInsets.zero,
      splashRadius: 24,
    ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            height: 400,
            child: SingleChildScrollView(
              child: Text(
                sebze.aciklamadetay,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
