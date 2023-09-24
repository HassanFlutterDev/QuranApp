// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/backend/auth/auth_function.dart';
import 'package:quranapp/constant/constant.dart';
import 'package:quranapp/frontend/call/call_screen.dart';
import 'package:quranapp/frontend/chat/chat_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home_screen_stu extends StatefulWidget {
  const home_screen_stu({super.key});

  @override
  State<home_screen_stu> createState() => _home_screen_stuState();
}

class _home_screen_stuState extends State<home_screen_stu> {
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
          .collection('users')
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
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: true,
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
                  'Qari\'s',
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
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('qaris')
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
                  if (snapshot.data!.docs.length == 0) {
                    return Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height - 470,
                        ),
                        Center(
                          child: Text('There is no qari available for you.'),
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
                              color: snap['callId'] != ''
                                  ? kprimaryColor.withOpacity(0.4)
                                  : Colors.transparent,
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
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 17,
                                      backgroundColor: Colors.transparent,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(
                                            chat_screen(
                                              isStudent: true,
                                              uid: snap['uid'],
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
                                    snap['callId'] != ''
                                        ? Padding(
                                            padding:
                                                const EdgeInsets.only(left: 3),
                                            child: ElevatedButton(
                                                onPressed: () async {
                                                  Get.to(CallPage(
                                                      uid1: snap['uid'],
                                                      uid: FirebaseAuth.instance
                                                          .currentUser!.uid,
                                                      callID: snap['callId'],
                                                      name: 'Hassan'));
                                                },
                                                child: Text(
                                                  'Join Class',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: kprimaryColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )),
                                          )
                                        : Column(
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
    ));
  }
}
