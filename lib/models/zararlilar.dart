class Zararli {
  String zararliadi;
  String zararliaciklama;
  List<String> zararbitki;
  String cozumonerisi;
  String belirtiler;
  String imagepathzararli;
  List<String> belirtiresim;

  Zararli({
    required this.zararliadi,
    required this.zararliaciklama,
    required this.zararbitki,
    required this.cozumonerisi,
    required this.belirtiler,
    required this.imagepathzararli,
    required this.belirtiresim,
  });
factory Zararli.fromJson(Map<String, dynamic> json, String directoryPath) {
  return Zararli(
    zararliadi: json['zararliadi'],
    zararliaciklama: json['zararliaciklama'],
    zararbitki: List<String>.from(json['zararbitki']),
    cozumonerisi: json['cozumonerisi'],
    belirtiler: json['belirtiler'],
    imagepathzararli: json['imagepathzararli'],
    belirtiresim: List<String>.from(json['belirtiresim']),
  );
}


  Map<String, dynamic> toJson() {
    return {
      'zararliadi': zararliadi,
      'zararliaciklama': zararliaciklama,
      'zararbitki': zararbitki,
      'cozumonerisi': cozumonerisi,
      'belirtiler': belirtiler,
      'imagepathzararli': imagepathzararli,
      'belirtiresim': belirtiresim,
    };
  }
}
