class Weather {
  final String cityName;
  final double temperature;
   final String mainCondution;
   Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondution

   });

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(cityName: json['name'],
    temperature: json['main']['temp'].toDouble(),
    mainCondution: json['weather'][0]['main'],
    );
  }

}