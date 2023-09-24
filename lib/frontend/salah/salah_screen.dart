import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:quranapp/constant/constant.dart';

import '../../models/namaz_model.dart';
import 'package:http/http.dart' as http;

class salah_screen extends StatefulWidget {
  const salah_screen({super.key});

  @override
  State<salah_screen> createState() => _salah_screenState();
}

class _salah_screenState extends State<salah_screen> {
  Namaz? namaz;
  bool loading = true;

  String url =
      'http://api.aladhan.com/v1/calendarByCity/2023/5?city=Faisalabad&country=Pakistan&method=4';
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
            'Salah Timings',
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
          FadeInLeft(
            duration: Duration(milliseconds: 1500),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    'Salah Timing:',
                    style: TextStyle(
                      color: kprimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          FadeInRight(
            duration: Duration(milliseconds: 1500),
            child: Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsetsDirectional.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: kprimaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Fajr',
                        style: TextStyle(
                          color: kprimaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        loading ? 'loading' : namaz!.data[0].timings.fajr,
                        style: TextStyle(
                          color: kprimaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FadeInLeft(
            duration: Duration(milliseconds: 1500),
            child: Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsetsDirectional.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: kprimaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dhuhr',
                        style: TextStyle(
                          color: kprimaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        loading ? 'loading' : namaz!.data[0].timings.dhuhr,
                        style: TextStyle(
                          color: kprimaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FadeInRight(
            duration: Duration(milliseconds: 1500),
            child: Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsetsDirectional.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: kprimaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Asr',
                        style: TextStyle(
                          color: kprimaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        loading ? 'loading' : namaz!.data[0].timings.asr,
                        style: TextStyle(
                          color: kprimaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FadeInLeft(
            duration: Duration(milliseconds: 1500),
            child: Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsetsDirectional.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: kprimaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Magrib',
                        style: TextStyle(
                          color: kprimaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        loading ? 'loading' : namaz!.data[0].timings.maghrib,
                        style: TextStyle(
                          color: kprimaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FadeInRight(
            duration: Duration(milliseconds: 1500),
            child: Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsetsDirectional.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: kprimaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Isha',
                        style: TextStyle(
                          color: kprimaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        loading ? 'loading' : namaz!.data[0].timings.isha,
                        style: TextStyle(
                          color: kprimaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    ));
  }
}
