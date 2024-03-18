import 'dart:convert';
import 'dart:developer';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:bahcem/models/weather_model.dart';
import 'package:http/http.dart' as http;




class WeatherService{
  static const BASE_URL ='https://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  WeatherService(this.apiKey);

  Future<Weather> getWeather(String cityName) async{
    final response = await http
    .get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=metric'));
    log("$BASE_URL?q=$cityName&appid=$apiKey&units=metric");
    log("response=$response");
    if (response.statusCode==200){
      return Weather.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to load weather data');
    }
  }

  Future<String> getCurrentCity() async{
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever){
      permission = await Geolocator.requestPermission();
    }
Position position = await Geolocator.getCurrentPosition(
  desiredAccuracy: LocationAccuracy.high);

List<Placemark> placemarks=
 await placemarkFromCoordinates(position.latitude, position.longitude);

    log("placemarks=$placemarks.");

    String? city = placemarks[0].subAdministrativeArea;
    log("city=$city");

return city?? "";


  }
}

// class WeatherService {
//   final String apiKey = 'c613adc83cc28163b82b232269367ead';
//   final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

//   Future<Map<String, dynamic>> getCurrentWeather() async {
//     try {
//       Map<String, double> locationData = await LocationService.getCurrentLocation();
//       double latitude = locationData['latitude']!;
//       double longitude = locationData['longitude']!;

//       final url = '$baseUrl?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';

//       final response = await http.get(Uri.parse(url));

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(response.body);
//         return data;
//       } else {
//         throw Exception('Failed to load weather data');
//       }
//     } catch (e) {
//       throw Exception('Failed to connect to the weather service: $e');
//     }
//   }
// }
