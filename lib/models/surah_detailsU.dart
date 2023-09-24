// To parse this JSON data, do
//
//     final surahDetailU = surahDetailUFromJson(jsonString);

import 'dart:convert';

SurahDetailU surahDetailUFromJson(String str) =>
    SurahDetailU.fromJson(json.decode(str));

String surahDetailUToJson(SurahDetailU data) => json.encode(data.toJson());

class SurahDetailU {
  SurahDetailU({
    required this.code,
    required this.data,
    required this.status,
  });

  final int code;
  final Data data;
  final String status;

  factory SurahDetailU.fromJson(Map<String, dynamic> json) => SurahDetailU(
        code: json["code"],
        data: Data.fromJson(json["data"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data.toJson(),
        "status": status,
      };
}

class Data {
  Data({
    required this.ayahs,
    required this.edition,
    required this.englishName,
    required this.englishNameTranslation,
    required this.name,
    required this.number,
    required this.numberOfAyahs,
    required this.revelationType,
  });

  final List<Ayah> ayahs;
  final Edition edition;
  final String englishName;
  final String englishNameTranslation;
  final String name;
  final int number;
  final int numberOfAyahs;
  final String revelationType;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        ayahs: List<Ayah>.from(json["ayahs"].map((x) => Ayah.fromJson(x))),
        edition: Edition.fromJson(json["edition"]),
        englishName: json["englishName"],
        englishNameTranslation: json["englishNameTranslation"],
        name: json["name"],
        number: json["number"],
        numberOfAyahs: json["numberOfAyahs"],
        revelationType: json["revelationType"],
      );

  Map<String, dynamic> toJson() => {
        "ayahs": List<dynamic>.from(ayahs.map((x) => x.toJson())),
        "edition": edition.toJson(),
        "englishName": englishName,
        "englishNameTranslation": englishNameTranslation,
        "name": name,
        "number": number,
        "numberOfAyahs": numberOfAyahs,
        "revelationType": revelationType,
      };
}

class Ayah {
  Ayah({
    required this.hizbQuarter,
    required this.juz,
    required this.manzil,
    required this.number,
    required this.numberInSurah,
    required this.page,
    required this.ruku,
    required this.sajda,
    required this.text,
  });

  final int hizbQuarter;
  final int juz;
  final int manzil;
  final int number;
  final int numberInSurah;
  final int page;
  final int ruku;
  final bool sajda;
  final String text;

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        hizbQuarter: json["hizbQuarter"],
        juz: json["juz"],
        manzil: json["manzil"],
        number: json["number"],
        numberInSurah: json["numberInSurah"],
        page: json["page"],
        ruku: json["ruku"],
        sajda: json["sajda"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "hizbQuarter": hizbQuarter,
        "juz": juz,
        "manzil": manzil,
        "number": number,
        "numberInSurah": numberInSurah,
        "page": page,
        "ruku": ruku,
        "sajda": sajda,
        "text": text,
      };
}

class Edition {
  Edition({
    required this.direction,
    required this.englishName,
    required this.format,
    required this.identifier,
    required this.language,
    required this.name,
    required this.type,
  });

  final String direction;
  final String englishName;
  final String format;
  final String identifier;
  final String language;
  final String name;
  final String type;

  factory Edition.fromJson(Map<String, dynamic> json) => Edition(
        direction: json["direction"],
        englishName: json["englishName"],
        format: json["format"],
        identifier: json["identifier"],
        language: json["language"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "direction": direction,
        "englishName": englishName,
        "format": format,
        "identifier": identifier,
        "language": language,
        "name": name,
        "type": type,
      };
}
