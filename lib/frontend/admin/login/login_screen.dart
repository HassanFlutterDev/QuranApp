import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/constant/constant.dart';
import 'package:quranapp/frontend/admin/home/home_screen.dart';

import '../../student/auth/signUp_screen.dart';

class login_screen_admin extends StatefulWidget {
  const login_screen_admin({super.key});

  @override
  State<login_screen_admin> createState() => _login_screen_adminState();
}

class _login_screen_adminState extends State<login_screen_admin> {
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Enter Admin Password',
            style: TextStyle(
              color: kprimaryColor,
              fontSize: 21,
            ),
          ),
          Center(
            child: TextFieldContainer(
                color: kprimaryColor,
                child: TextField(
                  obscureText: true,
                  onSubmitted: (v) async {},
                  controller: pass,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Password',
                    icon: Icon(
                      Icons.lock,
                      color: kprimaryColor,
                    ),
                  ),
                )),
          ),
          customButton(
              text: 'Next',
              onPressed: () async {
                var userData = await FirebaseFirestore.instance
                    .collection('admin')
                    .doc('admin')
                    .get();
                if (userData.data()!['adminPass'] == pass.text) {
                  log('true');
                  Get.to(home_screen_admin());
                }
              }),
        ],
      ),
    );
  }
}
