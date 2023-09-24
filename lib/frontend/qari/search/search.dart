// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:quranapp/constant/constant.dart';
import 'package:intl/intl.dart';

class search_screen_qari extends StatefulWidget {
  const search_screen_qari({super.key});

  @override
  State<search_screen_qari> createState() => _search_screen_qariState();
}

class _search_screen_qariState extends State<search_screen_qari> {
  TextEditingController search = TextEditingController();
  bool show = false;
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
    return Scaffold(
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Search Students',
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
              height: 60,
              color: Colors.transparent,
              child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 40,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: TextFormField(
                      controller: search,
                      onChanged: (v) {
                        if (v.isNotEmpty) {
                          setState(() {
                            show = true;
                          });
                        } else {
                          setState(() {
                            show = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search Student Name',
                          prefixIcon: Icon(CupertinoIcons.search)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              color: Color.fromARGB(86, 217, 217, 217),
            ),
            show
                ? Container(
                    height: MediaQuery.of(context).size.height - 263,
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .where('searchIndex', arrayContains: search.text)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height - 470,
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
                                              backgroundImage: NetworkImage(
                                                  snap['photoUrl']),
                                            ),
                                            Text(
                                              snap['username'],
                                              style: TextStyle(
                                                color: kprimaryColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            CircleAvatar(
                                              radius: 17,
                                              backgroundColor:
                                                  Colors.transparent,
                                              // child: Icon(
                                              //   Icons.video_call,
                                              //   color: Colors.white,
                                              // ),
                                            ),
                                            CircleAvatar(
                                              radius: 17,
                                              backgroundColor:
                                                  Colors.transparent,
                                              // child: Icon(
                                              //   Icons.video_call,
                                              //   color: Colors.white,
                                              // ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                var Usersnap =
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection('qaris')
                                                        .doc(FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .uid)
                                                        .get();

                                                var dateTime =
                                                    await showTimePicker(
                                                        context: context,
                                                        initialTime:
                                                            TimeOfDay.now());
                                                log(dateTime!.period
                                                    .toString()
                                                    .split('.')[1]);
                                                String name = await Usersnap
                                                    .data()!['username'];
                                                if (dateTime !=
                                                    TimeOfDay.now()) {
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection('users')
                                                      .doc(snap['uid'])
                                                      .collection('qaris')
                                                      .doc(FirebaseAuth.instance
                                                          .currentUser!.uid)
                                                      .set({
                                                    'classTime':
                                                        '${dateTime.hourOfPeriod.toString()}:${dateTime.minute.toString()} ${dateTime.period.toString().split('.')[1]}',
                                                    'name': name,
                                                    'uid': FirebaseAuth.instance
                                                        .currentUser!.uid,
                                                    'photoUrl': Usersnap
                                                        .data()!['photoUrl'],
                                                    'time': DateTime.now(),
                                                    'classId': '',
                                                  });
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection('qaris')
                                                      .doc(FirebaseAuth.instance
                                                          .currentUser!.uid)
                                                      .collection('students')
                                                      .doc(snap['uid'])
                                                      .set({
                                                    'classTime':
                                                        '${dateTime.hourOfPeriod.toString()}:${dateTime.minute.toString()} ${dateTime.period.toString().split('.')[1]}',
                                                    'name': snap['username'],
                                                    'uid': snap['uid'],
                                                    'photoUrl':
                                                        snap['photoUrl'],
                                                    'time': DateTime.now(),
                                                    'classId': '',
                                                  });
                                                }
                                              },
                                              child: CircleAvatar(
                                                radius: 17,
                                                backgroundColor: kprimaryColor,
                                                child: Icon(
                                                  Icons.calendar_month,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),

                                            // Column(
                                            //   mainAxisAlignment: MainAxisAlignment.center,
                                            //   children: [
                                            //     Text(
                                            //       'Class:',
                                            //       style: TextStyle(
                                            //         fontSize: 12,
                                            //       ),
                                            //     ),
                                            //     Text(
                                            //       '3:30 PM',
                                            //       style: TextStyle(
                                            //         fontSize: 12,
                                            //       ),
                                            //     )
                                            //   ],
                                            // )
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
                  )
                : Container(
                    height: MediaQuery.of(context).size.height - 263,
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height - 470,
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
                                              backgroundImage: NetworkImage(
                                                  snap['photoUrl']),
                                            ),
                                            Text(
                                              snap['username'],
                                              style: TextStyle(
                                                color: kprimaryColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            CircleAvatar(
                                              radius: 17,
                                              backgroundColor:
                                                  Colors.transparent,
                                              // child: Icon(
                                              //   Icons.video_call,
                                              //   color: Colors.white,
                                              // ),
                                            ),
                                            CircleAvatar(
                                              radius: 17,
                                              backgroundColor:
                                                  Colors.transparent,
                                              // child: Icon(
                                              //   Icons.video_call,
                                              //   color: Colors.white,
                                              // ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                var Usersnap =
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection('qaris')
                                                        .doc(FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .uid)
                                                        .get();

                                                var dateTime =
                                                    await showTimePicker(
                                                        context: context,
                                                        initialTime:
                                                            TimeOfDay.now());
                                                log(dateTime!.period
                                                    .toString()
                                                    .split('.')[1]);
                                                String name = await Usersnap
                                                    .data()!['username'];
                                                if (dateTime !=
                                                    TimeOfDay.now()) {
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection('users')
                                                      .doc(snap['uid'])
                                                      .collection('qaris')
                                                      .doc(FirebaseAuth.instance
                                                          .currentUser!.uid)
                                                      .set({
                                                    'classTime':
                                                        '${dateTime.hourOfPeriod.toString()}:${dateTime.minute.toString()} ${dateTime.period.toString().split('.')[1]}',
                                                    'name': name,
                                                    'uid': FirebaseAuth.instance
                                                        .currentUser!.uid,
                                                    'photoUrl': Usersnap
                                                        .data()!['photoUrl'],
                                                    'time': DateTime.now(),
                                                    'classId': '',
                                                  });
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection('qaris')
                                                      .doc(FirebaseAuth.instance
                                                          .currentUser!.uid)
                                                      .collection('students')
                                                      .doc(snap['uid'])
                                                      .set({
                                                    'classTime':
                                                        '${dateTime.hourOfPeriod.toString()}:${dateTime.minute.toString()} ${dateTime.period.toString().split('.')[1]}',
                                                    'name': snap['username'],
                                                    'uid': snap['uid'],
                                                    'photoUrl':
                                                        snap['photoUrl'],
                                                    'time': DateTime.now(),
                                                    'classId': '',
                                                  });
                                                }
                                              },
                                              child: CircleAvatar(
                                                radius: 17,
                                                backgroundColor: kprimaryColor,
                                                child: Icon(
                                                  Icons.calendar_month,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),

                                            // Column(
                                            //   mainAxisAlignment: MainAxisAlignment.center,
                                            //   children: [
                                            //     Text(
                                            //       'Class:',
                                            //       style: TextStyle(
                                            //         fontSize: 12,
                                            //       ),
                                            //     ),
                                            //     Text(
                                            //       '3:30 PM',
                                            //       style: TextStyle(
                                            //         fontSize: 12,
                                            //       ),
                                            //     )
                                            //   ],
                                            // )
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
                  )
          ],
        ),
      ),
    );
  }
}
