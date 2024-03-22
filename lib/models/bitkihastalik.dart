class Hastalik {
  String hastalikadi;
  String hastalikaciklama;
  String hastalikcozum;
  List<String> hastalikbitkileri;
  String hastalikresim;
  List<String> hastalikdetayresim;

  Hastalik({
    required this.hastalikadi,
    required this.hastalikaciklama,
    required this.hastalikcozum,
    required this.hastalikbitkileri,
    required this.hastalikresim,
    required this.hastalikdetayresim,
  });

  factory Hastalik.fromJson(Map<String, dynamic> json, String directoryPath) {
    return Hastalik(
      hastalikadi: json['hastalikadi'],
      hastalikaciklama: json['hastalikaciklama'],
      hastalikcozum: json['hastalikcozum'],
      hastalikbitkileri: List<String>.from(json['hastalikbitkileri']),
      hastalikresim: json['hastalikresim'],
      hastalikdetayresim: List<String>.from(json['hastalikdetayresim']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hastalikadi': hastalikadi,
      'hastalikaciklama': hastalikaciklama,
      'hastalikcozum': hastalikcozum,
      'hastalikbitkileri': hastalikbitkileri,
      'hastalikresim': hastalikresim,
      'hastalikdetayresim': hastalikdetayresim,
    };
  }
}
