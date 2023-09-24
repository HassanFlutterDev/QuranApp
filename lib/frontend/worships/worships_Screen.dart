// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/constant/constant.dart';
import 'package:quranapp/frontend/more/kalma/kalma_Screen.dart';
import 'package:quranapp/frontend/worships/fasting/fasting.dart';
import 'package:quranapp/frontend/worships/hajj_screen.dart';
import 'package:quranapp/frontend/worships/hijricalender/hijri_calender.dart';
import 'package:quranapp/frontend/worships/namaz/namaz_Screen.dart';
import 'package:quranapp/frontend/worships/namesofAllah/allah_names.dart';
import 'package:quranapp/frontend/worships/tasbih/tasbih_screen.dart';
import 'package:quranapp/frontend/worships/zakat/zakat_screen.dart';

import 'namaz-e-janaza/namaz_e_screen.dart';
import 'namaz/namaz.dart';

class worship_screen extends StatefulWidget {
  const worship_screen({super.key});

  @override
  State<worship_screen> createState() => _worship_screenState();
}

class _worship_screenState extends State<worship_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: kprimaryColor,
        ),
        title: Center(
          child: Text(
            'Pillar\'s of Islam',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Get.to(kalma_Screen(), transition: Transition.downToUp);
              },
              child: FadeInRight(
                duration: Duration(milliseconds: 1500),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 44, 50, 80),
                        Color.fromARGB(255, 86, 104, 134),
                      ]),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 44, 50, 80),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: Offset(3, 4),
                        )
                      ]),
                  child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Kalma',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'images/Kalma.png',
                            height: 45,
                          ),
                        )
                      ])),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(namaz_screen(), transition: Transition.downToUp);
              },
              child: FadeInLeft(
                duration: Duration(milliseconds: 1500),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 44, 50, 80),
                        Color.fromARGB(255, 86, 104, 134),
                      ]),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 44, 50, 80),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: Offset(3, 4),
                        )
                      ]),
                  child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Namaz',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'images/salah.png',
                            height: 45,
                          ),
                        )
                      ])),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(fasting_screen(), transition: Transition.downToUp);
              },
              child: FadeInRight(
                duration: Duration(milliseconds: 1500),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 44, 50, 80),
                        Color.fromARGB(255, 86, 104, 134),
                      ]),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 44, 50, 80),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: Offset(3, 4),
                        )
                      ]),
                  child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Roza',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'images/iftar.png',
                            height: 45,
                          ),
                        )
                      ])),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(hajj_screen(), transition: Transition.downToUp);
              },
              child: FadeInLeft(
                duration: Duration(milliseconds: 1500),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 44, 50, 80),
                        Color.fromARGB(255, 86, 104, 134),
                      ]),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 44, 50, 80),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: Offset(3, 4),
                        )
                      ]),
                  child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Hajj-Ummrah',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'images/kaaba.png',
                            height: 45,
                          ),
                        )
                      ])),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(zakat_Screen(), transition: Transition.downToUp);
              },
              child: FadeInRight(
                duration: Duration(milliseconds: 1500),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 44, 50, 80),
                        Color.fromARGB(255, 86, 104, 134),
                      ]),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 44, 50, 80),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: Offset(3, 4),
                        )
                      ]),
                  child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Zakat',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'images/zakat.png',
                            height: 45,
                          ),
                        )
                      ])),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
