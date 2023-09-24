// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:quranapp/backend/notifications/notifications.dart';
import 'package:quranapp/constant/constant.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:vibration/vibration.dart';

import '../call/call_screen.dart';

class chat_screen extends StatefulWidget {
  String uid;
  String name;
  String? myName;
  bool? isStudent;
  chat_screen(
      {super.key,
      required this.name,
      required this.uid,
      this.myName,
      this.isStudent = false});

  @override
  State<chat_screen> createState() => _chat_screenState();
}

class _chat_screenState extends State<chat_screen> {
  TextEditingController text = TextEditingController();
  bool isloading = true;
  ScrollController _controller = ScrollController();
  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        isloading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 234, 234, 234),
        appBar: AppBar(
          backgroundColor: kprimaryColor,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            widget.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            widget.isStudent!
                ? Container()
                : IconButton(
                    onPressed: () async {
                      String id = Random().nextInt(9999).toString();
                      if (kDebugMode) {
                        print('id check $id');
                      }
                      var userData1 = await FirebaseFirestore.instance
                          .collection('users')
                          .doc(widget.uid)
                          .get();
                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(widget.uid)
                          .collection('qaris')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .update({
                        'time': DateTime.now(),
                        'callId': id,
                      });
                      LocalNotificationService.sendPush(
                        'Your Class with ${widget.myName} Starts Now.',
                        'Class Started',
                        [userData1.data()!['token']],
                      );
                      Get.to(CallPage(
                          uid: widget.uid,
                          uid1: FirebaseAuth.instance.currentUser!.uid,
                          callID: id,
                          name: widget.myName!));
                    },
                    icon: Icon(
                      Icons.video_call,
                      color: Colors.white,
                    )),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Column(children: [
            Expanded(
                child: CupertinoScrollbar(
              controller: _controller,
              child: GestureDetector(
                // onTap: () {
                //   // setState(() {
                //   //   show = false;
                //   //   focusNode.unfocus();
                //   // });
                // },
                child: StreamBuilder(
                    stream: widget.isStudent!
                        ? FirebaseFirestore.instance
                            .collection('users')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .collection('qaris')
                            .doc(widget.uid)
                            .collection('messages')
                            .orderBy(
                              'time',
                            )
                            .snapshots()
                        : FirebaseFirestore.instance
                            .collection('qaris')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .collection('students')
                            .doc(widget.uid)
                            .collection('messages')
                            .orderBy(
                              'time',
                            )
                            .snapshots(),
                    builder: (context, snapshot) {
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        _controller.animateTo(
                            _controller.position.maxScrollExtent,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.bounceInOut);
                      });
                      if (isloading) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: kprimaryColor,
                          ),
                        );
                      }
                      return ListView.builder(
                          controller: _controller,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            var snap = snapshot.data!.docs[index].data();
                            return snap['uid'] ==
                                    FirebaseAuth.instance.currentUser!.uid
                                ? messageCard(
                                    message: snap['msg'],
                                    read: false,
                                    time: snap['time'])
                                : messageCard1(
                                    message: snap['msg'],
                                    read: false,
                                    time: snap['time']);
                          });
                    }),
              ),
            )),
            Container(
              height: 70,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AnimatedContainer(
                      duration: Duration(
                        milliseconds: 500,
                      ),
                      width: MediaQuery.of(context).size.width - 97,
                      decoration: BoxDecoration(
                          color: kprimaryColor.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextFormField(
                          controller: text,
                          maxLines: 2,
                          minLines: 1,
                          // autofocus: true,
                          autocorrect: true,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Type a Message...',
                          ),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      child: InkWell(
                        onTap: () async {
                          String text1 = text.text;
                          setState(() {
                            text.clear();
                          });
                          if (text1.isNotEmpty) {
                            String id = Uuid().v1();
                            Vibration.vibrate(duration: 30, amplitude: 2);
                            await FirebaseFirestore.instance
                                .collection('qaris')
                                .doc(widget.isStudent!
                                    ? widget.uid
                                    : FirebaseAuth.instance.currentUser!.uid)
                                .collection('students')
                                .doc(widget.isStudent!
                                    ? FirebaseAuth.instance.currentUser!.uid
                                    : widget.uid)
                                .collection('messages')
                                .doc(id)
                                .set({
                              'msg': text1,
                              'time': DateTime.now(),
                              'uid': FirebaseAuth.instance.currentUser!.uid,
                              'id': id,
                            });
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(widget.isStudent!
                                    ? FirebaseAuth.instance.currentUser!.uid
                                    : widget.uid)
                                .collection('qaris')
                                .doc(widget.isStudent!
                                    ? widget.uid
                                    : FirebaseAuth.instance.currentUser!.uid)
                                .collection('messages')
                                .doc(id)
                                .set({
                              'msg': text1,
                              'time': DateTime.now(),
                              'uid': FirebaseAuth.instance.currentUser!.uid,
                              'id': id,
                            });

                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(widget.isStudent!
                                    ? FirebaseAuth.instance.currentUser!.uid
                                    : widget.uid)
                                .collection('qaris')
                                .doc(widget.isStudent!
                                    ? widget.uid
                                    : FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              'time': DateTime.now(),
                            });
                            await FirebaseFirestore.instance
                                .collection('qaris')
                                .doc(widget.isStudent!
                                    ? widget.uid
                                    : FirebaseAuth.instance.currentUser!.uid)
                                .collection('students')
                                .doc(widget.isStudent!
                                    ? FirebaseAuth.instance.currentUser!.uid
                                    : widget.uid)
                                .update({
                              'time': DateTime.now(),
                            });
                          }
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: kprimaryColor,
                            child: Center(
                              child: Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
        ));
  }
}

class messageCard extends StatelessWidget {
  String message;
  bool read;
  final time;
  messageCard(
      {Key? key, required this.message, required this.read, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kprimaryColor.withOpacity(1),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 11, vertical: 3),
                  child: Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 3, left: 15, right: 20, bottom: 5),
                      child:
                          Text(message, style: TextStyle(color: Colors.white)),
                    ),
                    // Positioned(
                    //   bottom: 4,
                    //   right: 10,\\\\
                    //   child:
                    // )
                  ]),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          DateFormat.jm().format(time.toDate()),
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          DateFormat.yMd().format(time.toDate()),
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class messageCard1 extends StatelessWidget {
  String message;
  bool read;
  final time;
  messageCard1(
      {Key? key, required this.message, required this.read, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kprimaryColor.withOpacity(0.6),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 11, vertical: 3),
                  child: Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 3, left: 15, right: 20, bottom: 5),
                      child:
                          Text(message, style: TextStyle(color: Colors.black)),
                    ),
                    // Positioned(
                    //   bottom: 4,
                    //   right: 10,\\\\
                    //   child:
                    // )
                  ]),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat.jm().format(time.toDate()),
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          DateFormat.yMd().format(time.toDate()),
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
