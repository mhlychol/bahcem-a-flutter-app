import 'dart:developer';

// import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class LocationService {
  static String latitude = '';
  static String longitude = '';
  static String regionName = ''; // Bölge ismi değişkeni

  static getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      log("Location Denied");
      LocationPermission ask = await Geolocator.requestPermission();
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      
      latitude = currentPosition.latitude.toString();
      longitude = currentPosition.longitude.toString();

      log("Latitude=${currentPosition.latitude.toString()}");
      log("Longitude=${currentPosition.longitude.toString()}");

      // Konum alındıktan sonra bölge ismini al
      //await _reverseGeocode();
    }
  }

  // static _reverseGeocode() async {
  //   String apiUrl =
  //       'https://nominatim. .org/reverse?format=json&lat=$latitude&lon=$longitude';
  //   var response = await http.get(Uri.parse(apiUrl));
  //   if (response.statusCode == 200) {
  //     var data = json.decode(response.body);
  //     log('data=$data');
  //     regionName = data['display_name'];
  //           log("Longitude=$regionName");

  //   } else {
  //     throw Exception('Failed to load reverse geocoding data');
  //   }
  // }
}
// class LocationService {
//   static String latitude = '';
//   static String longitude = '';

//   static getCurrentLocation() async {
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied ||
//         permission == LocationPermission.deniedForever) {
//       log("Location Denied");
//       LocationPermission ask = await Geolocator.requestPermission();
//     } else {
//       Position currentPosition = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.best);
      
//       latitude = currentPosition.latitude.toString();
//       longitude = currentPosition.longitude.toString();

//       log("Latitude=${currentPosition.latitude.toString()}");
//       log("Longitude=${currentPosition.longitude.toString()}");
//     }
//   }
// }


// class LocationServices extends StatefulWidget{
//   const LocationServices({super.key});

//    @override
// State<LocationServices> createState()=> _LocationServicesState();
// }
// class _LocationServicesState extends State<LocationServices>   {

// getCurrentLocation()async{
//   LocationPermission permission=await Geolocator.checkPermission();
//   if(permission==LocationPermission.denied || permission==LocationPermission.deniedForever) {
//     log("Location Denied");
//     LocationPermission ask=await Geolocator.requestPermission();
//   }
//   else{
//     Position currentposition = await Geolocator.getCurrentPosition(desiredAccuracy:LocationAccuracy.best );
//     log("Lattitude=${currentposition.latitude.toString()}");
//     log("Longtitude=${currentposition.longitude.toString()}");
//   }
// }

// @override
// Widget build(BuildContext context){
//   return Scaffold(
//     appBar: AppBar(title: Text("Geolocator"),
//     centerTitle: true,
//     ),
// body: Center(child: ElevatedButton(onPressed: (){
// getCurrentLocation();

// },child: Text("Grab Location")),
// ),
//   );
// }
// }