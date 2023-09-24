// To parse this JSON data, do
//
//     final surah = surahFromJson(jsonString);

import 'dart:convert';

Surah surahFromJson(String str) => Surah.fromJson(json.decode(str));

String surahToJson(Surah data) => json.encode(data.toJson());

class Surah {
  Surah({
    required this.code,
    required this.data,
    required this.status,
  });

  final int code;
  final List<Datum> data;
  final String status;

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
      };
}

class Datum {
  Datum({
    required this.englishName,
    required this.englishNameTranslation,
    required this.name,
    required this.number,
    required this.numberOfAyahs,
    required this.searchIndex,
    required this.revelationType,
  });

  final String englishName;
  final String englishNameTranslation;
  final String name;
  final int number;
  final int numberOfAyahs;
  final List searchIndex;
  final String revelationType;

  factory Datum.fromJson(Map<String, dynamic> json) {
    List<String> splitList = json["englishName"].split(" ");
    List<String> searchIndex = [];
    for (var i = 0; i < splitList.length; i++) {
      for (var y = 0; y < splitList[i].length; y++) {
        searchIndex.add(splitList[i].substring(0, y + 1).toLowerCase());
        searchIndex.add(splitList[i].substring(0, y + 1));
        searchIndex.add(splitList[i].substring(0, y + 1).toUpperCase());
      }
    }
    return Datum(
      englishName: json["englishName"],
      englishNameTranslation: json["englishNameTranslation"],
      name: json["name"],
      searchIndex: searchIndex,
      number: json["number"],
      numberOfAyahs: json["numberOfAyahs"],
      revelationType: json["revelationType"],
    );
  }
  Map<String, dynamic> toJson() => {
        "englishName": englishName,
        "englishNameTranslation": englishNameTranslation,
        "name": name,
        "searchIndex": searchIndex,
        "number": number,
        "numberOfAyahs": numberOfAyahs,
        "revelationType": revelationTypeValues.reverse[revelationType],
      };
}

enum RevelationType { MECCAN, MEDINAN }

final revelationTypeValues = EnumValues(
    {"Meccan": RevelationType.MECCAN, "Medinan": RevelationType.MEDINAN});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
