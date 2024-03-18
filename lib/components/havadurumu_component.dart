import 'package:flutter/material.dart';
import 'package:bahcem/models/weather_model.dart';
import 'package:bahcem/services/weather_service.dart';

class WeatherComponent extends StatefulWidget {
  const WeatherComponent({Key? key}) : super(key: key);

  @override
  State<WeatherComponent> createState() => _WeatherComponentState();
}

class _WeatherComponentState extends State<WeatherComponent> {
  final _weatherService = WeatherService('2ad19f25eb3c00253c9d3de8987fef34');
  Weather? _weather;

  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Arka plan rengi beyaz
        borderRadius: BorderRadius.circular(20), // Köşeleri yuvarlak yapma
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${_weather?.cityName} " ?? "Bölge bilgisi bekleniyor.."),
              Text('${_weather?.temperature.round()}°C '),
              Text("Hava ${_weather?.mainCondution}"),
            ],
          ),
          SizedBox(height: 10), // Boşluk ekleyebilirsiniz
          ElevatedButton(
            onPressed: _fetchWeather,
            child: Text('Hava Durumunu Güncelle'),
          ),
        ],
      ),
    );
  }
}
