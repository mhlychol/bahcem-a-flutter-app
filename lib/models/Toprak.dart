class Toprak {
  String ad;
  String imagePath;
  String aciklama;
  String aciklamadetay;
  List<String> dikimAyi;
  String cimlenmeSuresi;
  String buyumeSuresi;
  String sulamaSikligi;
  String toprakTuru;
  String iklimTuru;
  List<String> mevsim;

Toprak({
  required this.ad,
  required this.imagePath,
  required this.aciklama,
  required this.aciklamadetay,
  required this.dikimAyi,
  required this.cimlenmeSuresi,
  required this.buyumeSuresi,
  required this.sulamaSikligi,
  required this.toprakTuru,
  required this.iklimTuru,
  required this.mevsim,

  });


factory Toprak.fromJson(Map<String, dynamic> json, String directoryPath) {
  return Toprak(
    ad: json['ad'],
    imagePath: json['imagePath'],
    aciklama: json['aciklama'],
    aciklamadetay: json['aciklamadetay'],
    dikimAyi: List<String>.from(json['dikimAyi']),
    cimlenmeSuresi: json['cimlenmeSuresi'],
    buyumeSuresi: json['buyumeSuresi'],
    sulamaSikligi: json['sulamaSikligi'],
    toprakTuru: json['toprakTuru'],
    iklimTuru: json['iklimTuru'],
    mevsim: List<String>.from(json['mevsim']),
  );
}

  Map<String, dynamic> toJson() {
    return {
      'ad': ad,
      'imagePath': imagePath,
      'aciklama': aciklama,
      'aciklamadetay': aciklamadetay,
      'dikimAyi': dikimAyi,
      'cimlenmeSuresi': cimlenmeSuresi,
      'buyumeSuresi': buyumeSuresi,
      'sulamaSikligi': sulamaSikligi,
      'toprakTuru': toprakTuru,
      'iklimTuru': iklimTuru,
      'mevsim': mevsim,
    };
  }
}

