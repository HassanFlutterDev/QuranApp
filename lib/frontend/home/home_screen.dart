// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, prefer_final_fields, camel_case_types, sized_box_for_whitespace, unused_local_variable

import 'dart:convert';
import 'dart:developer';

import 'package:adhan_dart/adhan_dart.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:quranapp/backend/auth/auth_function.dart';
import 'package:quranapp/backend/notifications/notifications.dart';
import 'package:quranapp/constant/constant.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:quranapp/frontend/admin/login/login_screen.dart';
import 'package:quranapp/frontend/hadith/hadith_screen.dart';
import 'package:quranapp/frontend/qari/bottomNav/bottom_nav_qari.dart';
import 'package:quranapp/frontend/qari/login/login_screen.dart';
import 'package:quranapp/frontend/qibla/qibla_screen.dart';
import 'package:quranapp/frontend/quran/quran_screen.dart';
import 'package:quranapp/frontend/salah/salah_screen.dart';
import 'package:quranapp/frontend/selection/selection_screen.dart';
import 'package:quranapp/frontend/student/auth/login_screen.dart';
import 'package:quranapp/frontend/student/home/home_screen.dart';
import 'package:quranapp/frontend/worships/worships_Screen.dart';
import 'package:quranapp/models/namaz_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../more/more_Screen.dart';
import '../selection/selection_screen.dart';

class home_screen extends StatefulWidget {
  bool isqari;
  bool? isguest;
  home_screen({super.key, required this.isqari, this.isguest = false});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  String isha = '19:08 (pkr)';
  String current = '';
  bool loading = false;
  int duration = 0;
  int minute = 0;
  @override
  void initState() {
    LocalNotificationService.initialize();
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) async {
        print("FirebaseMessaging.instance.getInitialMessage");
        // incom

        // LocalNotificationService.createanddisplaynotification(message!)
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) async {
        log(message.notification!.title.toString());
        LocalNotificationService.createanddisplayLownotification(message);
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) async {
        // }
      },
    );
    super.initState();
    getLoc();
  }

  Namaz? namaz;
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
    int time = int.parse(DateFormat.H().format(DateTime.now()));
    int timeM = int.parse(DateFormat.jm()
        .format(DateTime.now())
        .split(':')[1]
        .replaceAll('PM', '')
        .replaceAll('AM', ''));
    namaz = Namaz.fromJson(data);
    int fajr = int.parse(namaz!.data[0].timings.fajr
        .replaceRange(2, namaz!.data[0].timings.fajr.length, ''));
    int duhar = int.parse(namaz!.data[0].timings.dhuhr
        .replaceRange(2, namaz!.data[0].timings.dhuhr.length, ''));
    int asar = int.parse(namaz!.data[0].timings.asr
        .replaceRange(2, namaz!.data[0].timings.asr.length, ''));
    int magrib = int.parse(namaz!.data[0].timings.maghrib
        .replaceRange(2, namaz!.data[0].timings.maghrib.length, ''));
    int isha = int.parse(namaz!.data[0].timings.isha
        .replaceRange(2, namaz!.data[0].timings.isha.length, ''));

    ///
    ///
    ///
    ///
    ///
    ///
    ///
    ///
    ///
    int fajrM = int.parse(
        namaz!.data[0].timings.fajr.split(':')[1].replaceAll('(PKT)', ''));
    int duharM = int.parse(
        namaz!.data[0].timings.dhuhr.split(':')[1].replaceAll('(PKT)', ''));
    int asarM = int.parse(
        namaz!.data[0].timings.asr.split(':')[1].replaceAll('(PKT)', ''));
    int magribM = int.parse(
        namaz!.data[0].timings.maghrib.split(':')[1].replaceAll('(PKT)', ''));
    int ishaM = int.parse(
        namaz!.data[0].timings.isha.split(':')[1].replaceAll('(PKT)', ''));
    ////
    ///
    ///
    ///
    ///

    log(fajr.toString());
    log(duhar.toString());
    log(asar.toString());
    log(magrib.toString());
    log(isha.toString());
    log(time.toString());
    if (time > fajr && time < duhar || time == fajr) {
      setState(() {
        current = 'Fajr';
      });
    } else if (time > duhar && time < asar || time == duhar) {
      setState(() {
        current = 'Dhuhar';
      });
    } else if (time > asar && time < magrib || time == asar) {
      setState(() {
        current = 'Asr';
      });
    } else if (time > magrib && time < isha || time == magrib) {
      setState(() {
        current = 'Magrib';
      });
    } else {
      setState(() {
        current = 'Isha';
      });
    }
    log('Isha ${DateFormat.jm().format(DateTime.now()).split(':')[1].replaceAll('PM', '').replaceAll('AM', '')}');
    log(DateFormat.jm().format(DateTime.now()).toString());
    if (current == 'Fajr') {
      setState(() {
        duration = duhar - time;
        if (duharM > timeM) {
          minute = duharM - timeM;
        } else {
          minute = timeM - duharM;
        }
      });
    } else if (current == 'Dhuhar') {
      setState(() {
        duration = asar - time;
        if (asarM > timeM) {
          minute = asarM - timeM;
        } else {
          minute = timeM - asarM;
        }
      });
    } else if (current == 'Asr') {
      setState(() {
        duration = magrib - time;
        if (magribM > timeM) {
          minute = magribM - timeM;
        } else {
          minute = timeM - magribM;
        }
      });
    } else if (current == 'Magrib') {
      setState(() {
        duration = isha - time;
        if (ishaM > timeM) {
          minute = ishaM - timeM;
        } else {
          minute = timeM - ishaM;
        }
      });
    } else if (current == 'Isha') {
      if (time < 24 && time > 17) {
        setState(() {
          time = 24 - time;
          duration = time + fajr;
          if (fajrM > timeM) {
            minute = fajrM - timeM;
          } else {
            minute = timeM - fajrM;
          }
          log(duration.toString());
        });
      } else {
        setState(() {
          duration = fajr - time;
          if (fajrM > timeM) {
            minute = fajrM - timeM;
          } else {
            minute = timeM - fajrM;
          }
          log('isha $duration');
        });
      }
    }

    setState(() {
      // isha = namaz!.data[0].timings.isha;
      loading = false;
    });
  }

  var _hijri = HijriCalendar.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      drawer: Drawer(
        backgroundColor: backgroundColor,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              // color: Colors.red,
              child: Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage('images/quran3.png'),
                          fit: BoxFit.fill)),
                ),
              ),
            ),
            ListTile(
              onTap: () async {
                widget.isguest == true
                    ? Get.to(selection_screen())
                    : widget.isqari
                        ? Get.to(bottom_nav_qari())
                        : Get.to(home_screen_stu());
              },
              leading: Icon(
                widget.isguest == true
                    ? Icons.login
                    : widget.isqari
                        ? Icons.meeting_room_outlined
                        : Icons.video_call,
                color: kprimaryColor,
              ),
              title: Text(
                widget.isguest == true
                    ? 'Login'
                    : widget.isqari
                        ? 'Start Class'
                        : 'Join Class',
                style: TextStyle(
                  color: kprimaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: kprimaryColor,
        ),
        title: Center(
          child: Text(
            'Quran App',
            style: TextStyle(
              color: kprimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                if (widget.isguest != true) {
                  await AuthFunction().logout().then((value) {
                    Get.to(selection_screen());
                  });
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  widget.isqari == false
                      ? pref.remove('Email')
                      : pref.remove('google');
                }
              },
              icon: Icon(
                Icons.logout,
                color: widget.isguest! ? Colors.transparent : kprimaryColor,
              )),
        ],
      ),
      body: WillPopScope(
        onWillPop: () {
          SystemNavigator.pop();
          return Future.value();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              ZoomIn(
                duration: Duration(milliseconds: 1500),
                child: Center(
                  child: Image.asset(
                    'images/quran3.png',
                    height: 100,
                  ),
                ),
              ),
              FadeInLeft(
                duration: Duration(milliseconds: 1500),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 24,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 245,
                            color: Colors.transparent,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 13,
                                ),
                                Row(
                                  children: [
                                    Center(
                                      child: Text(
                                        _hijri.hDay.toString(),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Center(
                                      child: Text(
                                        '${_hijri.longMonthName},${_hijri.hYear}',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${DateFormat.yMEd().format(DateTime.now())}',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(salah_screen(),
                                  transition: Transition.downToUp);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width - 248,
                              color: Colors.transparent,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 13,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Center(
                                        child: Text(
                                          'Now',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Center(
                                        child: Text(
                                          current,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Next Salah:',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      loading
                                          ? Container()
                                          : SlideCountdown(
                                              onDone: () {
                                                getLoc();
                                              },
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius: BorderRadius.zero,
                                              ),
                                              padding: EdgeInsets.zero,
                                              duration: Duration(
                                                  hours: duration,
                                                  minutes: minute),
                                              textStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 9,
                                              ),
                                            )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(quran_screen(), transition: Transition.downToUp);
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
                              'Quran',
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
                              'images/quran1.png',
                              height: 45,
                            ),
                          )
                        ])),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(hadith_screen(), transition: Transition.downToUp);
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
                              'Hadith',
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
                              'images/status.png',
                              height: 45,
                            ),
                          )
                        ])),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(worship_screen(), transition: Transition.downToUp);
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
                              'Pillar\'s of Islam',
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
                              'images/mosque.png',
                              height: 45,
                            ),
                          )
                        ])),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(more_screen(), transition: Transition.downToUp);
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
                              'More',
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
                              'images/more.png',
                              height: 45,
                            ),
                          )
                        ])),
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Column(
              //       children: [
              //         InkWell(
              //           onTap: () {
              //             Get.to(SafeArea(child: quran_screen()),
              //                 transition: Transition.downToUp);
              //           },
              //           child: FadeInLeft(
              //             duration: Duration(milliseconds: 1500),
              //             child: Container(
              //               height: 200,
              //               width: MediaQuery.of(context).size.width - 215,
              //               margin: EdgeInsets.symmetric(
              //                 horizontal: 17,
              //                 vertical: 0,
              //               ),
              //               decoration: BoxDecoration(
              //                   gradient: LinearGradient(colors: [
              //                     Color.fromARGB(255, 44, 50, 80),
              //                     Color.fromARGB(255, 86, 104, 134),
              //                   ]),
              //                   borderRadius: BorderRadius.circular(20),
              //                   boxShadow: [
              //                     BoxShadow(
              //                       color: Color.fromARGB(255, 44, 50, 80),
              //                       blurRadius: 10,
              //                       spreadRadius: 1,
              //                       offset: Offset(3, 4),
              //                     )
              //                   ]),
              //               child: Center(
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Padding(
              //                       padding: const EdgeInsets.only(
              //                           top: 16, left: 16, right: 16),
              //                       child: Image.asset(
              //                         'images/quran1.png',
              //                         height: 80,
              //                       ),
              //                     ),
              //                     Padding(
              //                       padding: const EdgeInsets.all(16.0),
              //                       child: Container(
              //                         height: 60,
              //                         width:
              //                             MediaQuery.of(context).size.width - 270,
              //                         color: Colors.transparent,
              //                         child: Column(
              //                           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                           children: [
              //                             Row(
              //                               children: [
              //                                 Center(
              //                                   child: Text(
              //                                     'Quran',
              //                                     textAlign: TextAlign.start,
              //                                     style: TextStyle(
              //                                       color: Colors.white,
              //                                       fontSize: 20,
              //                                       fontWeight: FontWeight.bold,
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                             Row(
              //                               children: [
              //                                 Text(
              //                                   'Learn Whole Quran',
              //                                   textAlign: TextAlign.start,
              //                                   style: TextStyle(
              //                                     color: Color.fromARGB(
              //                                         169, 255, 255, 255),
              //                                     fontSize: 10,
              //                                     fontWeight: FontWeight.w400,
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                             Row(
              //                               children: [
              //                                 Text(
              //                                   'GoTo >>',
              //                                   textAlign: TextAlign.start,
              //                                   style: TextStyle(
              //                                     color: Color.fromARGB(
              //                                         220, 255, 255, 255),
              //                                     fontSize: 10,
              //                                     fontWeight: FontWeight.w400,
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //         InkWell(
              //           onTap: () {
              //             Get.to(SafeArea(child: worship_screen()),
              //                 transition: Transition.downToUp);
              //           },
              //           child: FadeInLeft(
              //             duration: Duration(milliseconds: 1500),
              //             child: Container(
              //               height: 240,
              //               width: MediaQuery.of(context).size.width - 215,
              //               margin: EdgeInsets.symmetric(
              //                 horizontal: 17,
              //                 vertical: 16,
              //               ),
              //               decoration: BoxDecoration(
              //                   gradient: LinearGradient(colors: [
              //                     Color.fromARGB(255, 44, 50, 80),
              //                     Color.fromARGB(255, 86, 104, 134),
              //                   ]),
              //                   borderRadius: BorderRadius.circular(20),
              //                   boxShadow: [
              //                     BoxShadow(
              //                       color: Color.fromARGB(255, 44, 50, 80),
              //                       blurRadius: 10,
              //                       spreadRadius: 1,
              //                       offset: Offset(3, 4),
              //                     )
              //                   ]),
              //               child: Center(
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Padding(
              //                       padding: const EdgeInsets.only(
              //                           top: 16, left: 16, right: 16),
              //                       child: Image.asset(
              //                         'images/mosque.png',
              //                         height: 80,
              //                       ),
              //                     ),
              //                     Padding(
              //                       padding: const EdgeInsets.all(16.0),
              //                       child: Container(
              //                         height: 60,
              //                         width:
              //                             MediaQuery.of(context).size.width - 270,
              //                         color: Colors.transparent,
              //                         child: Column(
              //                           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                           children: [
              //                             Row(
              //                               children: [
              //                                 Center(
              //                                   child: Text(
              //                                     'Worships',
              //                                     textAlign: TextAlign.start,
              //                                     style: TextStyle(
              //                                       color: Colors.white,
              //                                       fontSize: 20,
              //                                       fontWeight: FontWeight.bold,
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                             Row(
              //                               children: [
              //                                 Text(
              //                                   'Namaz,Hajj...',
              //                                   textAlign: TextAlign.start,
              //                                   style: TextStyle(
              //                                     color: Color.fromARGB(
              //                                         169, 255, 255, 255),
              //                                     fontSize: 10,
              //                                     fontWeight: FontWeight.w400,
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                             Row(
              //                               children: [
              //                                 Text(
              //                                   'GoTo >>',
              //                                   textAlign: TextAlign.start,
              //                                   style: TextStyle(
              //                                     color: Color.fromARGB(
              //                                         220, 255, 255, 255),
              //                                     fontSize: 10,
              //                                     fontWeight: FontWeight.w400,
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //     Column(
              //       children: [
              //         InkWell(
              //           onTap: () {
              //             Get.to(hadith_screen(),
              //                 transition: Transition.downToUp);
              //           },
              //           child: FadeInRight(
              //             duration: Duration(milliseconds: 1500),
              //             child: Container(
              //               height: 240,
              //               width: MediaQuery.of(context).size.width - 215,
              //               margin: EdgeInsets.symmetric(
              //                 horizontal: 17,
              //                 vertical: 0,
              //               ),
              //               decoration: BoxDecoration(
              //                   gradient: LinearGradient(colors: [
              //                     Color.fromARGB(255, 44, 50, 80),
              //                     Color.fromARGB(255, 86, 104, 134),
              //                   ]),
              //                   borderRadius: BorderRadius.circular(20),
              //                   boxShadow: [
              //                     BoxShadow(
              //                       color: Color.fromARGB(255, 44, 50, 80),
              //                       blurRadius: 10,
              //                       spreadRadius: 1,
              //                       offset: Offset(3, 4),
              //                     )
              //                   ]),
              //               child: Center(
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Padding(
              //                       padding: const EdgeInsets.only(
              //                           top: 16, left: 16, right: 16),
              //                       child: Image.asset(
              //                         'images/status.png',
              //                         height: 80,
              //                       ),
              //                     ),
              //                     Padding(
              //                       padding: const EdgeInsets.all(16.0),
              //                       child: Container(
              //                         height: 60,
              //                         width:
              //                             MediaQuery.of(context).size.width - 270,
              //                         color: Colors.transparent,
              //                         child: Column(
              //                           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                           children: [
              //                             Row(
              //                               children: [
              //                                 Center(
              //                                   child: Text(
              //                                     'Hadith',
              //                                     textAlign: TextAlign.start,
              //                                     style: TextStyle(
              //                                       color: Colors.white,
              //                                       fontSize: 20,
              //                                       fontWeight: FontWeight.bold,
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                             Row(
              //                               children: [
              //                                 Text(
              //                                   'Learn Hadith',
              //                                   textAlign: TextAlign.start,
              //                                   style: TextStyle(
              //                                     color: Color.fromARGB(
              //                                         169, 255, 255, 255),
              //                                     fontSize: 10,
              //                                     fontWeight: FontWeight.w400,
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                             Row(
              //                               children: [
              //                                 Text(
              //                                   'GoTo >>',
              //                                   textAlign: TextAlign.start,
              //                                   style: TextStyle(
              //                                     color: Color.fromARGB(
              //                                         220, 255, 255, 255),
              //                                     fontSize: 10,
              //                                     fontWeight: FontWeight.w400,
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //         InkWell(
              //           onTap: () {
              //             Get.to(SafeArea(child: more_screen()),
              //                 transition: Transition.downToUp);
              //           },
              //           child: FadeInRight(
              //             duration: Duration(milliseconds: 1500),
              //             child: Container(
              //               height: 200,
              //               width: MediaQuery.of(context).size.width - 215,
              //               margin: EdgeInsets.symmetric(
              //                 horizontal: 17,
              //                 vertical: 16,
              //               ),
              //               decoration: BoxDecoration(
              //                   gradient: LinearGradient(colors: [
              //                     Color.fromARGB(255, 44, 50, 80),
              //                     Color.fromARGB(255, 86, 104, 134),
              //                   ]),
              //                   borderRadius: BorderRadius.circular(20),
              //                   boxShadow: [
              //                     BoxShadow(
              //                       color: Color.fromARGB(255, 44, 50, 80),
              //                       blurRadius: 10,
              //                       spreadRadius: 1,
              //                       offset: Offset(3, 4),
              //                     )
              //                   ]),
              //               child: Center(
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Padding(
              //                       padding: const EdgeInsets.only(
              //                           top: 16, left: 16, right: 16),
              //                       child: Image.asset(
              //                         'images/more.png',
              //                         height: 80,
              //                       ),
              //                     ),
              //                     Padding(
              //                       padding: const EdgeInsets.all(16.0),
              //                       child: Container(
              //                         height: 60,
              //                         width:
              //                             MediaQuery.of(context).size.width - 270,
              //                         color: Colors.transparent,
              //                         child: Column(
              //                           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                           children: [
              //                             Row(
              //                               children: [
              //                                 Center(
              //                                   child: Text(
              //                                     'More',
              //                                     textAlign: TextAlign.start,
              //                                     style: TextStyle(
              //                                       color: Colors.white,
              //                                       fontSize: 20,
              //                                       fontWeight: FontWeight.bold,
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                             Row(
              //                               children: [
              //                                 Text(
              //                                   'Check out qibla...',
              //                                   textAlign: TextAlign.start,
              //                                   style: TextStyle(
              //                                     color: Color.fromARGB(
              //                                         169, 255, 255, 255),
              //                                     fontSize: 10,
              //                                     fontWeight: FontWeight.w400,
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                             Row(
              //                               children: [
              //                                 Text(
              //                                   'GoTo >>',
              //                                   textAlign: TextAlign.start,
              //                                   style: TextStyle(
              //                                     color: Color.fromARGB(
              //                                         220, 255, 255, 255),
              //                                     fontSize: 10,
              //                                     fontWeight: FontWeight.w400,
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
