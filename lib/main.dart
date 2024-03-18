import 'package:bahcem/components/havadurumu_component.dart';
import 'package:bahcem/screens/giris.dart';
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

  await JsonfirbaseService.getfirebazetojson();
  await JsonService.loadSebzeler();
  //await JsonFirestoreService().addDataFromJson("assets/bitkiler.json");
 
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
            locale: const Locale('tr', 'TR'), // Uygulama dilini Türkçe olarak ayarla

      //home: SebzeListesiScreen(),
      home: GirisEkrani(),
      //home: LocationServices(),
      //home:WeatherPage(),
      
    );
  }
}
