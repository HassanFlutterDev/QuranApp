// ignore_for_file: sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/frontend/more/wuzu/wudu.dart';
import 'package:quranapp/frontend/qibla/qibla_screen.dart';
import 'package:quranapp/frontend/worships/hijricalender/hijri_calender.dart';
import 'package:quranapp/frontend/worships/namaz-e-janaza/namaz_e_screen.dart';
import 'package:quranapp/frontend/worships/namesofAllah/allah_names.dart';

import '../../constant/constant.dart';
import '../worships/tasbih/tasbih_screen.dart';
import 'kalma/kalma_Screen.dart';

class more_screen extends StatefulWidget {
  const more_screen({super.key});

  @override
  State<more_screen> createState() => _more_screenState();
}

class _more_screenState extends State<more_screen> {
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
            'More',
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
                Get.to(allah_names(), transition: Transition.downToUp);
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
                            'Names of Allah',
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
                            'images/allah.png',
                            height: 45,
                          ),
                        )
                      ])),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(qibla_screen(), transition: Transition.downToUp);
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
                            'Qibla',
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
                            'images/qibla.png',
                            height: 45,
                          ),
                        )
                      ])),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(hijri_calender(), transition: Transition.downToUp);
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
                            'Hijri Calender',
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
                            'images/calendar.png',
                            height: 45,
                          ),
                        )
                      ])),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(tasbih_screen(), transition: Transition.downToUp);
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
                            'Tasbeeh',
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
                            'images/tasbih.png',
                            height: 45,
                          ),
                        )
                      ])),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(wudu_screen(), transition: Transition.downToUp);
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
                            'Wudu',
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
                            'images/wudu.png',
                            height: 45,
                          ),
                        )
                      ])),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(namaz_e_janaza_screen(),
                    transition: Transition.downToUp);
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
                            'Namaz-e-Janaza',
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
                            'images/salat.png',
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
