// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/constant/constant.dart';
import 'package:quranapp/frontend/home/home_screen.dart';
import 'package:quranapp/frontend/qari/bottomNav/bottom_nav_qari.dart';
import 'package:quranapp/frontend/qari/home/home_screen.dart';

import '../../../backend/auth/auth_function.dart';

class login_screen_qari extends StatefulWidget {
  const login_screen_qari({super.key});

  @override
  State<login_screen_qari> createState() => _login_screen_qariState();
}

class _login_screen_qariState extends State<login_screen_qari> {
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
              'Qari Login',
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
        body: Center(
          child: CupertinoButton(
            onPressed: () async {
              bool res = await AuthFunction().signInWithGoogle(context);
              if (res) {
                Get.to(home_screen(
                  isqari: true,
                ));
              }
            },
            child: Container(
              // height: ,
              width: double.infinity,
              // margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(3, 4),
                    spreadRadius: 1,
                    blurRadius: 7,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network(
                      'https://www.pngrepo.com/png/223041/512/google.png',
                      height: 45,
                    ),
                    Text(
                      'Continue With Google SignIn',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
