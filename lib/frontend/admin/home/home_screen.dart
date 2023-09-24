// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quranapp/constant/constant.dart';

class home_screen_admin extends StatefulWidget {
  const home_screen_admin({super.key});

  @override
  State<home_screen_admin> createState() => _home_screen_adminState();
}

class _home_screen_adminState extends State<home_screen_admin>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  TextEditingController search = TextEditingController();
  bool show = false;
  TextEditingController search1 = TextEditingController();
  bool show1 = false;
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Admin',
          style: TextStyle(
            color: kprimaryColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: backgroundColor,
        bottom: TabBar(
            labelColor: kprimaryColor,
            automaticIndicatorColorAdjustment: false,
            controller: controller,
            indicatorColor: kprimaryColor,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                text: 'Qari\'s',
              ),
              Tab(
                text: 'Student\'s',
              )
            ]),
      ),
      body: TabBarView(controller: controller, children: [
        SingleChildScrollView(
          child: Column(
            children: [
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
                            hintText: 'Search Qari Name',
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
                              .collection('qaris')
                              .where('searchIndex', arrayContains: search.text)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height -
                                        470,
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
                                      InkWell(
                                        onTap: () {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return Container(
                                                  height: 300,
                                                  color: Colors.white,
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      CircleAvatar(
                                                        radius: 70,
                                                        backgroundColor:
                                                            Colors.white,
                                                        backgroundImage:
                                                            NetworkImage(snap[
                                                                'photoUrl']),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 43,
                                                        width: double.infinity,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255,
                                                              237,
                                                              237,
                                                              237),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(9),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            'Username: ${snap['username']}',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 43,
                                                        width: double.infinity,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255,
                                                              237,
                                                              237,
                                                              237),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(9),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            'Email: ${snap['email']}',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              });
                                        },
                                        child: Container(
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
                                                CircleAvatar(
                                                  radius: 17,
                                                  backgroundColor:
                                                      Colors.transparent,
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
                                      ),
                                      Container(
                                        height: 1,
                                        color:
                                            Color.fromARGB(86, 217, 217, 217),
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
                              .collection('qaris')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height -
                                        470,
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
                                      InkWell(
                                        onTap: () {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return Container(
                                                  height: 300,
                                                  color: Colors.white,
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      CircleAvatar(
                                                        radius: 70,
                                                        backgroundColor:
                                                            Colors.white,
                                                        backgroundImage:
                                                            NetworkImage(snap[
                                                                'photoUrl']),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 43,
                                                        width: double.infinity,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255,
                                                              237,
                                                              237,
                                                              237),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(9),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            'Username: ${snap['username']}',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 43,
                                                        width: double.infinity,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255,
                                                              237,
                                                              237,
                                                              237),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(9),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            'Email: ${snap['email']}',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              });
                                        },
                                        child: Container(
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

                                                CircleAvatar(
                                                  radius: 17,
                                                  backgroundColor:
                                                      Colors.transparent,
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
                                      ),
                                      Container(
                                        height: 1,
                                        color:
                                            Color.fromARGB(86, 217, 217, 217),
                                      ),
                                    ],
                                  );
                                });
                          }),
                    )
            ],
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
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
                        controller: search1,
                        onChanged: (v) {
                          if (v.isNotEmpty) {
                            setState(() {
                              show1 = true;
                            });
                          } else {
                            setState(() {
                              show1 = false;
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
              show1
                  ? Container(
                      height: MediaQuery.of(context).size.height - 263,
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .where('searchIndex', arrayContains: search1.text)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height -
                                        470,
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
                                      InkWell(
                                        onTap: () {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return Container(
                                                  height: 300,
                                                  color: Colors.white,
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      CircleAvatar(
                                                        radius: 70,
                                                        backgroundColor:
                                                            Colors.white,
                                                        backgroundImage:
                                                            NetworkImage(snap[
                                                                'photoUrl']),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 43,
                                                        width: double.infinity,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255,
                                                              237,
                                                              237,
                                                              237),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(9),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            'Username: ${snap['username']}',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 43,
                                                        width: double.infinity,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255,
                                                              237,
                                                              237,
                                                              237),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(9),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            'Email: ${snap['email']}',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              });
                                        },
                                        child: Container(
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
                                                CircleAvatar(
                                                  radius: 17,
                                                  backgroundColor:
                                                      Colors.transparent,
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
                                      ),
                                      Container(
                                        height: 1,
                                        color:
                                            Color.fromARGB(86, 217, 217, 217),
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
                                    height: MediaQuery.of(context).size.height -
                                        470,
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
                                      InkWell(
                                        onTap: () {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return Container(
                                                  height: 300,
                                                  color: Colors.white,
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      CircleAvatar(
                                                        radius: 70,
                                                        backgroundColor:
                                                            Colors.white,
                                                        backgroundImage:
                                                            NetworkImage(snap[
                                                                'photoUrl']),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 43,
                                                        width: double.infinity,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255,
                                                              237,
                                                              237,
                                                              237),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(9),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            'Username: ${snap['username']}',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 43,
                                                        width: double.infinity,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255,
                                                              237,
                                                              237,
                                                              237),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(9),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            'Email: ${snap['email']}',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              });
                                        },
                                        child: Container(
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

                                                CircleAvatar(
                                                  radius: 17,
                                                  backgroundColor:
                                                      Colors.transparent,
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
                                      ),
                                      Container(
                                        height: 1,
                                        color:
                                            Color.fromARGB(86, 217, 217, 217),
                                      ),
                                    ],
                                  );
                                });
                          }),
                    )
            ],
          ),
        ),
      ]),
    );
  }
}
