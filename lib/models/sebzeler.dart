class Sebze {
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

Sebze({
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


factory Sebze.fromJson(Map<String, dynamic> json) {
    return Sebze(
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


/*
class Sebze {
  String? ad;
  String? imagePath;
  String? aciklama;
  String? aciklamadetay;
  List<String>? dikimAyi;
  String? cimlenmeSuresi;
  String? buyumeSuresi;
  String? sulamaSikligi;
  String? toprakTuru;
  String? iklimTuru;
  List<String>? mevsim;

Sebze({
   this.ad,
   this.imagePath,
   this.aciklama,
   this.aciklamadetay,
   this.dikimAyi,
   this.cimlenmeSuresi,
   this.buyumeSuresi,
   this.sulamaSikligi,
   this.toprakTuru,
   this.iklimTuru,
   this.mevsim,
  });

Sebze.fromJson(Map<String, dynamic> json)
      : ad = json['ad'] as String,
        imagePath = json['imagePath'] as String,
        aciklama = json['aciklama'] as String,
        aciklamadetay = json['aciklamadetay'] as String,
        dikimAyi = json['dikimAyi'] as List<String>,
        cimlenmeSuresi = json['cimlenmeSuresi'] as String,
        buyumeSuresi = json['buyumeSuresi'] as String,
        sulamaSikligi = json['sulamaSikligi'] as String,
        toprakTuru = json['toprakTuru'] as String,
        iklimTuru = json['iklimTuru'] as String,
        mevsim = json['mevsim'] as List<String>;
            

}*/