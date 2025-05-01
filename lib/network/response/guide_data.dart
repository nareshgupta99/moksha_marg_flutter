import 'dart:convert';

GuideData guideDataFromJson(String str) => GuideData.fromJson(json.decode(str));

String guideDataToJson(GuideData data) => json.encode(data.toJson());

class GuideData {
  String? guideId;
  double? price;
  String? imageUrl;
  dynamic createdAt;
  List<Language>? languages;
  String? name;
  String? contactNumber;
  String? shortDiscription;
  String? discription;

  GuideData({
    this.guideId,
    this.price,
    this.imageUrl,
    this.createdAt,
    this.languages,
    this.name,
    this.contactNumber,
  });

  factory GuideData.fromJson(Map<String, dynamic> json) => GuideData(
        guideId: json["guideId"],
        price: json["price"],
        imageUrl: json["imageUrl"],
        createdAt: json["createdAt"],
        languages: json["languages"] == null
            ? []
            : List<Language>.from(
                json["languages"]!.map((x) => Language.fromJson(x))),
        name: json["name"],
        contactNumber: json["contactNumber"],
      );

  Map<String, dynamic> toJson() => {
        "guideId": guideId,
        "price": price,
        "imageUrl": imageUrl,
        "createdAt": createdAt,
        "languages": languages == null
            ? []
            : List<dynamic>.from(languages!.map((x) => x.toJson())),
        "name": name,
        "contactNumber": contactNumber,
      };
}

class Language {
  String? languageId;
  String? languageName;
  dynamic createdAt;

  Language({
    this.languageId,
    this.languageName,
    this.createdAt,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        languageId: json["languageId"],
        languageName: json["languageName"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "languageId": languageId,
        "languageName": languageName,
        "createdAt": createdAt,
      };
}
