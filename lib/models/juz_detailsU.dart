// To parse this JSON data, do
//
//     final juzDetailU = juzDetailUFromJson(jsonString);

import 'dart:convert';

JuzDetailU juzDetailUFromJson(String str) =>
    JuzDetailU.fromJson(json.decode(str));

String juzDetailUToJson(JuzDetailU data) => json.encode(data.toJson());

class JuzDetailU {
  JuzDetailU({
    required this.code,
    required this.data,
    required this.status,
  });

  final int code;
  final Data data;
  final String status;

  factory JuzDetailU.fromJson(Map<String, dynamic> json) => JuzDetailU(
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
    required this.number,
    required this.surahs,
  });

  final List<Ayah> ayahs;
  final Edition edition;
  final int number;
  final Map<String, Surah> surahs;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        ayahs: List<Ayah>.from(json["ayahs"].map((x) => Ayah.fromJson(x))),
        edition: Edition.fromJson(json["edition"]),
        number: json["number"],
        surahs: Map.from(json["surahs"])
            .map((k, v) => MapEntry<String, Surah>(k, Surah.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "ayahs": List<dynamic>.from(ayahs.map((x) => x.toJson())),
        "edition": edition.toJson(),
        "number": number,
        "surahs": Map.from(surahs)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
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
    required this.surah,
    required this.text,
  });

  final int hizbQuarter;
  final int juz;
  final int manzil;
  final int number;
  final int numberInSurah;
  final int page;
  final int ruku;
  final dynamic sajda;
  final Surah surah;
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
        surah: Surah.fromJson(json["surah"]),
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
        "surah": surah.toJson(),
        "text": text,
      };
}

class SajdaClass {
  SajdaClass({
    required this.id,
    required this.obligatory,
    required this.recommended,
  });

  final int id;
  final bool obligatory;
  final bool recommended;

  factory SajdaClass.fromJson(Map<String, dynamic> json) => SajdaClass(
        id: json["id"],
        obligatory: json["obligatory"],
        recommended: json["recommended"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "obligatory": obligatory,
        "recommended": recommended,
      };
}

class Surah {
  Surah({
    required this.englishName,
    required this.englishNameTranslation,
    required this.name,
    required this.number,
    required this.numberOfAyahs,
    required this.revelationType,
  });

  final String englishName;
  final String englishNameTranslation;
  final String name;
  final int number;
  final int numberOfAyahs;
  final RevelationType revelationType;

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        englishName: json["englishName"],
        englishNameTranslation: json["englishNameTranslation"],
        name: json["name"],
        number: json["number"],
        numberOfAyahs: json["numberOfAyahs"],
        revelationType: revelationTypeValues.map[json["revelationType"]]!,
      );

  Map<String, dynamic> toJson() => {
        "englishName": englishName,
        "englishNameTranslation": englishNameTranslation,
        "name": name,
        "number": number,
        "numberOfAyahs": numberOfAyahs,
        "revelationType": revelationTypeValues.reverse[revelationType],
      };
}

enum RevelationType { MECCAN, MEDINAN }

final revelationTypeValues = EnumValues(
    {"Meccan": RevelationType.MECCAN, "Medinan": RevelationType.MEDINAN});

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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
