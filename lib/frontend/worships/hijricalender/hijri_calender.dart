// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:hijri_picker/hijri_picker.dart';
import 'package:quranapp/models/namaz_model.dart';
import 'package:http/http.dart' as http;
import '../../../constant/constant.dart';

class hijri_calender extends StatefulWidget {
  const hijri_calender({super.key});

  @override
  State<hijri_calender> createState() => _hijri_calenderState();
}

class _hijri_calenderState extends State<hijri_calender> {
  var date = HijriCalendar.now();
  Namaz? namaz;
  bool loading = true;

  String url =
      'http://api.aladhan.com/v1/calendarByCity/2023/4?city=Faisalabad&country=Pakistan&method=2';
  getLoc() async {
    setState(() {
      loading = true;
    });
    var res = await http.get(
      Uri.parse(url),
    );
    final data = jsonDecode(res.body);
    namaz = Namaz.fromJson(data);
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getLoc();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: kprimaryColor,
        ),
        title: Center(
          child: Text(
            'Hijri Calender',
            style: TextStyle(
              color: kprimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
        actions: [
          Container(
            height: 10,
            width: 60,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ZoomIn(
              duration: Duration(milliseconds: 1500),
              child: HijriMonthPicker(
                lastDate: HijriCalendar()
                  ..hYear = 1448
                  ..hMonth = 9
                  ..hDay = 25,
                firstDate: HijriCalendar()
                  ..hYear = 1438
                  ..hMonth = 12
                  ..hDay = 25,
                onChanged: (HijriCalendar value) {
                  // log(value.dayWeName);
                  setState(() {
                    date = value;
                  });
                },
                selectedDate: date,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
