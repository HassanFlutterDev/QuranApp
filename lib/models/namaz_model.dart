// To parse this JSON data, do
//
//     final namaz = namazFromJson(jsonString);

import 'dart:convert';

Namaz namazFromJson(String str) => Namaz.fromJson(json.decode(str));

String namazToJson(Namaz data) => json.encode(data.toJson());

class Namaz {
  final int code;
  final List<Datum> data;
  final String status;

  Namaz({
    required this.code,
    required this.data,
    required this.status,
  });

  factory Namaz.fromJson(Map<String, dynamic> json) => Namaz(
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
  final Date date;
  final Meta meta;
  final Timings timings;

  Datum({
    required this.date,
    required this.meta,
    required this.timings,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        date: Date.fromJson(json["date"]),
        meta: Meta.fromJson(json["meta"]),
        timings: Timings.fromJson(json["timings"]),
      );

  Map<String, dynamic> toJson() => {
        "date": date.toJson(),
        "meta": meta.toJson(),
        "timings": timings.toJson(),
      };
}

class Date {
  final Gregorian gregorian;
  final Hijri hijri;
  final String readable;
  final String timestamp;

  Date({
    required this.gregorian,
    required this.hijri,
    required this.readable,
    required this.timestamp,
  });

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        gregorian: Gregorian.fromJson(json["gregorian"]),
        hijri: Hijri.fromJson(json["hijri"]),
        readable: json["readable"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "gregorian": gregorian.toJson(),
        "hijri": hijri.toJson(),
        "readable": readable,
        "timestamp": timestamp,
      };
}

class Gregorian {
  final String date;
  final String day;
  final Designation designation;
  final Format format;
  final GregorianMonth month;
  final GregorianWeekday weekday;
  final String year;

  Gregorian({
    required this.date,
    required this.day,
    required this.designation,
    required this.format,
    required this.month,
    required this.weekday,
    required this.year,
  });

  factory Gregorian.fromJson(Map<String, dynamic> json) => Gregorian(
        date: json["date"],
        day: json["day"],
        designation: Designation.fromJson(json["designation"]),
        format: formatValues.map[json["format"]]!,
        month: GregorianMonth.fromJson(json["month"]),
        weekday: GregorianWeekday.fromJson(json["weekday"]),
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "day": day,
        "designation": designation.toJson(),
        "format": formatValues.reverse[format],
        "month": month.toJson(),
        "weekday": weekday.toJson(),
        "year": year,
      };
}

class Designation {
  final Abbreviated abbreviated;
  final Expanded expanded;

  Designation({
    required this.abbreviated,
    required this.expanded,
  });

  factory Designation.fromJson(Map<String, dynamic> json) => Designation(
        abbreviated: abbreviatedValues.map[json["abbreviated"]]!,
        expanded: expandedValues.map[json["expanded"]]!,
      );

  Map<String, dynamic> toJson() => {
        "abbreviated": abbreviatedValues.reverse[abbreviated],
        "expanded": expandedValues.reverse[expanded],
      };
}

enum Abbreviated { AD, AH }

final abbreviatedValues =
    EnumValues({"AD": Abbreviated.AD, "AH": Abbreviated.AH});

enum Expanded { ANNO_DOMINI, ANNO_HEGIRAE }

final expandedValues = EnumValues({
  "Anno Domini": Expanded.ANNO_DOMINI,
  "Anno Hegirae": Expanded.ANNO_HEGIRAE
});

enum Format { DD_MM_YYYY }

final formatValues = EnumValues({"DD-MM-YYYY": Format.DD_MM_YYYY});

class GregorianMonth {
  final String en;
  final int number;

  GregorianMonth({
    required this.en,
    required this.number,
  });

  factory GregorianMonth.fromJson(Map<String, dynamic> json) => GregorianMonth(
        en: json["en"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "en": purpleEnValues.reverse[en],
        "number": number,
      };
}

enum PurpleEn { MAY }

final purpleEnValues = EnumValues({"May": PurpleEn.MAY});

class GregorianWeekday {
  final String en;

  GregorianWeekday({
    required this.en,
  });

  factory GregorianWeekday.fromJson(Map<String, dynamic> json) =>
      GregorianWeekday(
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
      };
}

class Hijri {
  final String date;
  final String day;
  final Designation designation;
  final Format format;
  final List<dynamic> holidays;
  final HijriMonth month;
  final HijriWeekday weekday;
  final String year;

  Hijri({
    required this.date,
    required this.day,
    required this.designation,
    required this.format,
    required this.holidays,
    required this.month,
    required this.weekday,
    required this.year,
  });

  factory Hijri.fromJson(Map<String, dynamic> json) => Hijri(
        date: json["date"],
        day: json["day"],
        designation: Designation.fromJson(json["designation"]),
        format: formatValues.map[json["format"]]!,
        holidays: List<dynamic>.from(json["holidays"].map((x) => x)),
        month: HijriMonth.fromJson(json["month"]),
        weekday: HijriWeekday.fromJson(json["weekday"]),
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "day": day,
        "designation": designation.toJson(),
        "format": formatValues.reverse[format],
        "holidays": List<dynamic>.from(holidays.map((x) => x)),
        "month": month.toJson(),
        "weekday": weekday.toJson(),
        "year": year,
      };
}

class HijriMonth {
  final String ar;
  final String en;
  final int number;

  HijriMonth({
    required this.ar,
    required this.en,
    required this.number,
  });

  factory HijriMonth.fromJson(Map<String, dynamic> json) => HijriMonth(
        ar: json["ar"],
        en: json["en"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "ar": arValues.reverse[ar],
        "en": fluffyEnValues.reverse[en],
        "number": number,
      };
}

enum Ar { EMPTY, AR }

final arValues = EnumValues({"ذوالقعدة": Ar.AR, "شَوّال": Ar.EMPTY});

enum FluffyEn { SHAWWL, DH_AL_QA_DAH }

final fluffyEnValues = EnumValues(
    {"Dhū al-Qaʿdah": FluffyEn.DH_AL_QA_DAH, "Shawwāl": FluffyEn.SHAWWL});

class HijriWeekday {
  final String ar;
  final String en;

  HijriWeekday({
    required this.ar,
    required this.en,
  });

  factory HijriWeekday.fromJson(Map<String, dynamic> json) => HijriWeekday(
        ar: json["ar"],
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "ar": ar,
        "en": en,
      };
}

class Meta {
  final double latitude;
  final LatitudeAdjustmentMethod latitudeAdjustmentMethod;
  final double longitude;
  final Method method;
  final MidnightMode midnightMode;
  final Map<String, int> offset;
  final MidnightMode school;
  final Timezone timezone;

  Meta({
    required this.latitude,
    required this.latitudeAdjustmentMethod,
    required this.longitude,
    required this.method,
    required this.midnightMode,
    required this.offset,
    required this.school,
    required this.timezone,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        latitude: json["latitude"]?.toDouble(),
        latitudeAdjustmentMethod: latitudeAdjustmentMethodValues
            .map[json["latitudeAdjustmentMethod"]]!,
        longitude: json["longitude"]?.toDouble(),
        method: Method.fromJson(json["method"]),
        midnightMode: midnightModeValues.map[json["midnightMode"]]!,
        offset:
            Map.from(json["offset"]).map((k, v) => MapEntry<String, int>(k, v)),
        school: midnightModeValues.map[json["school"]]!,
        timezone: timezoneValues.map[json["timezone"]]!,
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "latitudeAdjustmentMethod":
            latitudeAdjustmentMethodValues.reverse[latitudeAdjustmentMethod],
        "longitude": longitude,
        "method": method.toJson(),
        "midnightMode": midnightModeValues.reverse[midnightMode],
        "offset":
            Map.from(offset).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "school": midnightModeValues.reverse[school],
        "timezone": timezoneValues.reverse[timezone],
      };
}

enum LatitudeAdjustmentMethod { ANGLE_BASED }

final latitudeAdjustmentMethodValues =
    EnumValues({"ANGLE_BASED": LatitudeAdjustmentMethod.ANGLE_BASED});

class Method {
  final int id;
  final Location location;
  final String name;
  final Params params;

  Method({
    required this.id,
    required this.location,
    required this.name,
    required this.params,
  });

  factory Method.fromJson(Map<String, dynamic> json) => Method(
        id: json["id"],
        location: Location.fromJson(json["location"]),
        name: json["name"],
        params: Params.fromJson(json["params"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "location": location.toJson(),
        "name": nameValues.reverse[name],
        "params": params.toJson(),
      };
}

class Location {
  final double latitude;
  final double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

enum Name { UMM_AL_QURA_UNIVERSITY_MAKKAH }

final nameValues = EnumValues(
    {"Umm Al-Qura University, Makkah": Name.UMM_AL_QURA_UNIVERSITY_MAKKAH});

class Params {
  final double fajr;
  final Isha isha;

  Params({
    required this.fajr,
    required this.isha,
  });

  factory Params.fromJson(Map<String, dynamic> json) => Params(
        fajr: json["Fajr"]?.toDouble(),
        isha: ishaValues.map[json["Isha"]]!,
      );

  Map<String, dynamic> toJson() => {
        "Fajr": fajr,
        "Isha": ishaValues.reverse[isha],
      };
}

enum Isha { THE_90_MIN }

final ishaValues = EnumValues({"90 min": Isha.THE_90_MIN});

enum MidnightMode { STANDARD }

final midnightModeValues = EnumValues({"STANDARD": MidnightMode.STANDARD});

enum Timezone { ASIA_KARACHI }

final timezoneValues = EnumValues({"Asia/Karachi": Timezone.ASIA_KARACHI});

class Timings {
  final String asr;
  final String dhuhr;
  final String fajr;
  final String firstthird;
  final String imsak;
  final String isha;
  final String lastthird;
  final String maghrib;
  final String midnight;
  final String sunrise;
  final String sunset;

  Timings({
    required this.asr,
    required this.dhuhr,
    required this.fajr,
    required this.firstthird,
    required this.imsak,
    required this.isha,
    required this.lastthird,
    required this.maghrib,
    required this.midnight,
    required this.sunrise,
    required this.sunset,
  });

  factory Timings.fromJson(Map<String, dynamic> json) => Timings(
        asr: json["Asr"],
        dhuhr: json["Dhuhr"],
        fajr: json["Fajr"],
        firstthird: json["Firstthird"],
        imsak: json["Imsak"],
        isha: json["Isha"],
        lastthird: json["Lastthird"],
        maghrib: json["Maghrib"],
        midnight: json["Midnight"],
        sunrise: json["Sunrise"],
        sunset: json["Sunset"],
      );

  Map<String, dynamic> toJson() => {
        "Asr": asrValues.reverse[asr],
        "Dhuhr": dhuhrValues.reverse[dhuhr],
        "Fajr": fajr,
        "Firstthird": firstthird,
        "Imsak": imsak,
        "Isha": isha,
        "Lastthird": lastthird,
        "Maghrib": maghrib,
        "Midnight": midnightValues.reverse[midnight],
        "Sunrise": sunrise,
        "Sunset": sunset,
      };
}

enum Asr { THE_1544_PKT, THE_1543_PKT }

final asrValues = EnumValues(
    {"15:43 (PKT)": Asr.THE_1543_PKT, "15:44 (PKT)": Asr.THE_1544_PKT});

enum Dhuhr { THE_1205_PKT, THE_1204_PKT }

final dhuhrValues = EnumValues(
    {"12:04 (PKT)": Dhuhr.THE_1204_PKT, "12:05 (PKT)": Dhuhr.THE_1205_PKT});

enum Midnight { THE_0005_PKT, THE_0004_PKT }

final midnightValues = EnumValues({
  "00:04 (PKT)": Midnight.THE_0004_PKT,
  "00:05 (PKT)": Midnight.THE_0005_PKT
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
