import 'package:flutter/material.dart';
import 'package:bahcem/services/geolocator_service.dart';
//import 'package:geolocator/geolocator.dart';

class KonumComponent extends StatefulWidget {
  const KonumComponent({Key? key}) : super(key: key);

  @override
  _KonumComponentState createState() => _KonumComponentState();
}

class _KonumComponentState extends State<KonumComponent> {
  String latitude = '';
  String longitude = '';
    String region = '';

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Widget oluşturulduğunda doğrudan LocationService.getCurrentLocation() fonksiyonunu çağırın
    _getCurrentLocation();
  }

  _getCurrentLocation() async {
    await LocationService.getCurrentLocation();
    setState(() {
      latitude = LocationService.latitude;
      longitude = LocationService.longitude;
      isLoading = false;
      //region = LocationService.regionName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Konum Component', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            isLoading
                ? CircularProgressIndicator() // Bekleme göstergesi göster
                : Column(
                    children: [
                      Text('$latitude, $longitude ', style: TextStyle(fontSize: 16)),
                      //SizedBox(height: 10),
                     // Text('Longitude: $longitude', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10),
                      //Text('Bolge: $region', style: TextStyle(fontSize: 16)),
                      
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}