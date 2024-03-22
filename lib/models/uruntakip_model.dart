class Sebzetakip {
  String adtakip;
    String imagePathtakip;

  List<String> dikimAyitakip;
  String cimlenmeSuresitakip;
  String buyumeSuresitakip;
  String sulamaSikligitakip;
  List<String> mevsimtakip;
  DateTime tarihtakip;
Sebzetakip({
  required this.adtakip,
  required this.imagePathtakip,

  required this.dikimAyitakip,
  required this.cimlenmeSuresitakip,
  required this.buyumeSuresitakip,
  required this.sulamaSikligitakip,
  required this.mevsimtakip,
  required this.tarihtakip,

  });
  Map<String, dynamic> toJson() {
    return {
      'adtakip': adtakip,
      'dikimAyitakip': dikimAyitakip,
      'imagePathtakip': imagePathtakip,
      'cimlenmeSuresitakip': cimlenmeSuresitakip,
      'buyumeSuresitakip': buyumeSuresitakip,
      'sulamaSikligitakip': sulamaSikligitakip,
      'mevsimtakip': mevsimtakip,
      'tarihtakip': tarihtakip.toIso8601String(),
    };
  }

  factory Sebzetakip.fromJson(Map<String, dynamic> json) {
    return Sebzetakip(
      adtakip: json['adtakip'],
      imagePathtakip: json['imagePathtakip'],

      dikimAyitakip: List<String>.from(json['dikimAyitakip']),
      cimlenmeSuresitakip: json['cimlenmeSuresitakip'],
      buyumeSuresitakip: json['buyumeSuresitakip'],
      sulamaSikligitakip: json['sulamaSikligitakip'],
      mevsimtakip: List<String>.from(json['mevsimtakip']),
      tarihtakip: DateTime.parse(json['tarihtakip']),
    );
  }
}
  