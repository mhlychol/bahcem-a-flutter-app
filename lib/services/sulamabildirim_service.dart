// //bitkitakip listesini al, tohum ve fidan bitki türüne göre 
// //tohumlar günlük kontrol edilecek, toprak kuruysa sulama yapılacak,
// //fidanlar bilgiye göre sulama yapacak günde 2 kere ise mevsime göre akşam ve sabah sulama saatleri değişecek.



// import 'dart:developer';

// import 'package:bahcem/models/uruntakip_model.dart';
// import 'package:bahcem/services/takiplistesi_service.dart';

// int convertSulamaSikligiToString(String sulamaSikligi) {
//     // String değerlere karşılık gelen sayısal değerlerin bulunduğu bir Map oluşturuyoruz
//     final Map<String, int> conversionMap = {
//       "Günde 1 kez": 1,
//       "Günde 2 kez": 2,
//       "Günde 1-2 kez": 1,
//       "Haftada 1 kez": 7,
//       "Haftada 2 kez": 3,
//       "Haftada 1-2 kez": 4,
//       "Haftada 2-3 kez": 3,
//     };

//     // conversionMap içindeki değeri döndürüyoruz, eğer değer bulunamazsa 0 döndürüyoruz
//     return conversionMap[sulamaSikligi] ?? 0;
//   }

//   void SulamaTakip() {
//     log('sulamatakip calisti'); // Bitki tarihini konsola yaz
//     for (var bitki in favoriListesi) {
//       //log("adtakip ${bitki.adtakip} ${bitki.dikimTipi} ");
//       if (bitki.dikimTipi == 'Fidan') {
//         // Bugünün tarihinden dikim tarihini çıkar
//         //log('Bitki Tarihi: ${bitki.tarihtakip} ${DateTime.now()}'); // Bitki tarihini konsola yaz
//         Duration difference = DateTime.now().difference(bitki.tarihtakip);
//         // Sulama sıklığını kontrol etmek için gün sayısına böl
//         double result = difference.inDays /
//             convertSulamaSikligiToString(bitki.sulamaSikligitakip);
//         print("aradaki fark gün cinsinden: ${difference.inDays}");

//         log('Result: $result ${bitki.adtakip}');

//         if (result.toInt() == result) {
//           // Uyarı listesine ekle
//           warningList.add(bitki);
//         }
//       } else if (bitki.dikimTipi == 'Tohum') {
//         warningList.add(bitki);
//       }
//     }