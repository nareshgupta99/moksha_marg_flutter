

import 'dart:convert';

LanguageData languageDataFromJson(String str) => LanguageData.fromJson(json.decode(str));

String languageDataToJson(LanguageData data) => json.encode(data.toJson());

class LanguageData {
    String? languageId;
    String? languageName;

    LanguageData({
        this.languageId,
        this.languageName,
    });

    factory LanguageData.fromJson(Map<String, dynamic> json) => LanguageData(
        languageId: json["languageId"],
        languageName: json["languageName"],
    );

    Map<String, dynamic> toJson() => {
        "languageId": languageId,
        "languageName": languageName,
    };
}
