// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/backend/auth/auth_function.dart';
import 'package:quranapp/backend/notifications/notifications.dart';
import 'package:quranapp/constant/constant.dart';
import 'package:quranapp/frontend/call/call_screen.dart';
import 'package:quranapp/frontend/chat/chat_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home_screen_qari extends StatefulWidget {
  const home_screen_qari({super.key});

  @override
  State<home_screen_qari> createState() => _home_screen_qariState();
}

class _home_screen_qariState extends State<home_screen_qari> {
  var userData = {};
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var Usersnap = await FirebaseFirestore.instance
          .collection('qaris')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      setState(() {
        userData = Usersnap.data()!;
      });
    } catch (e) {}
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: backgroundColor,
          title: Row(
            children: [
              CircleAvatar(
                radius: 19,
                backgroundImage: NetworkImage(isLoading
                    ? 'https://th.bing.com/th/id/R.9acfe78b8e1cfbf4c1b1d1f31745b96b?rik=Uo5g%2b2HI6iHJig&pid=ImgRaw&r=0'
                    : userData['photoUrl']),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'Hi,${isLoading ? 'loading' : userData['username']}',
                style: TextStyle(
                  color: kprimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.transparent,
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Student\'s',
                    style: TextStyle(
                      color: kprimaryColor,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              color: Color.fromARGB(86, 217, 217, 217),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 204,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('qaris')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection('students')
                      .orderBy('time', descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height - 470,
                          ),
                          Center(
                            child: CircularProgressIndicator(),
                          ),
                        ],
                      );
                    }
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var snap = snapshot.data!.docs[index].data();
                          return Column(
                            children: [
                              Container(
                                height: 60,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CircleAvatar(
                                        radius: 23,
                                        backgroundImage:
                                            NetworkImage(snap['photoUrl']),
                                      ),
                                      Text(
                                        snap['name'],
                                        style: TextStyle(
                                          color: kprimaryColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          String id =
                                              Random().nextInt(9999).toString();
                                          if (kDebugMode) {
                                            print('id check $id');
                                          }
                                          var userData1 =
                                              await FirebaseFirestore.instance
                                                  .collection('users')
                                                  .doc(snap['uid'])
                                                  .get();
                                          await FirebaseFirestore.instance
                                              .collection('users')
                                              .doc(snap['uid'])
                                              .collection('qaris')
                                              .doc(FirebaseAuth
                                                  .instance.currentUser!.uid)
                                              .update({
                                            'time': DateTime.now(),
                                            'callId': id,
                                          });
                                          LocalNotificationService.sendPush(
                                            'Your Class with ${userData['username']} Starts Now.',
                                            'Class Started',
                                            [userData1.data()!['token']],
                                          );
                                          Get.to(CallPage(
                                              uid: snap['uid'],
                                              uid1: FirebaseAuth
                                                  .instance.currentUser!.uid,
                                              callID: id,
                                              name: userData['username']));
                                        },
                                        child: CircleAvatar(
                                          radius: 17,
                                          backgroundColor: kprimaryColor,
                                          child: Icon(
                                            Icons.video_call,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(
                                              chat_screen(
                                                uid: snap['uid'],
                                                myName: userData['username'],
                                                name: snap['name'],
                                              ),
                                              transition: Transition.downToUp);
                                        },
                                        child: CircleAvatar(
                                          radius: 17,
                                          backgroundColor: kprimaryColor,
                                          child: Icon(
                                            Icons.chat,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Class:',
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            snap['classTime']
                                                .toString()
                                                .toUpperCase(),
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 1,
                                color: Color.fromARGB(86, 217, 217, 217),
                              ),
                            ],
                          );
                        });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
