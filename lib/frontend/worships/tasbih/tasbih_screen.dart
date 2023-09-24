// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quranapp/constant/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

class tasbih_screen extends StatefulWidget {
  const tasbih_screen({super.key});

  @override
  State<tasbih_screen> createState() => _tasbih_screenState();
}

class _tasbih_screenState extends State<tasbih_screen> {
  int counter = 0;
  bool vibrate = false;
  @override
  void initState() {
    super.initState();
    getCount();
  }

  getCount() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getInt('counter') != null) {
      setState(() {
        counter = pref.getInt('counter')!;
      });
    }
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
              'Tasbeeh',
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: ZoomIn(
                duration: Duration(milliseconds: 1500),
                child: Text(
                  '$counter',
                  style: TextStyle(
                    color: kprimaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: ZoomIn(
                duration: Duration(milliseconds: 1500),
                child: CupertinoButton(
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.green,
                      child: Text(
                        'Tap',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      if (vibrate == false) {
                        Vibration.vibrate();
                      }
                      setState(() {
                        counter++;
                        pref.setInt('counter', counter);
                        log(pref.getInt('counter').toString());
                      });
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.remove('counter');
                      setState(() {
                        counter = 0;
                      });
                    },
                    child: ZoomIn(
                      duration: Duration(milliseconds: 1500),
                      child: CircleAvatar(
                        radius: 23,
                        backgroundColor: kprimaryColor,
                        child: Icon(
                          Icons.restore,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (vibrate == false) {
                        setState(() {
                          vibrate = true;
                        });
                      } else {
                        setState(() {
                          vibrate = false;
                        });
                      }
                    },
                    child: ZoomIn(
                      duration: Duration(milliseconds: 1500),
                      child: CircleAvatar(
                        radius: 23,
                        backgroundColor: kprimaryColor,
                        child: Icon(
                          vibrate ? Icons.volume_mute : Icons.vibration,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
