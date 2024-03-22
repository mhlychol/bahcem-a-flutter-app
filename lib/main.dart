import 'package:bahcem/components/havadurumu_component.dart';
import 'package:bahcem/components/resimdeneme_component.dart';
import 'package:bahcem/screens/giris.dart';
import 'package:bahcem/services/firbasestorage_service.dart';
import 'package:bahcem/services/image_service.dart';
import 'package:bahcem/services/jsonfirebaseservice.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'utils/locator.dart';
import 'package:intl/date_symbol_data_local.dart';
//import 'screens/giris.dart';
import 'package:bahcem/services/sebzeservice.dart';
//import 'package:bahcem/services/geolocator_service.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeDateFormatting('Tr_TR', null).then((_) => const MyApp());
  setupLocator();
  
  await FirebaseStorageService().downloadAndPrintJsonFiles();
  await FirebaseStorageService().downloadImages();
  //await JsonfirbaseService.getfirebazetojson();
  await JsonService.loadSebzeler();
    await JsonService.loadZararlilar();
    await JsonService.loadHastalik();

  //await JsonFirestoreService().addDataFromJson("assets/bitkiler.json");
  await LocalImageService.loadImages();


  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: GirisEkrani(),
      //home: LocalImagesList (),
      //home: LocationServices(),
      //home:WeatherPage(),
      
    );
  }
}
