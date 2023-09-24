// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quranapp/constant/constant.dart';

class hadith_screen extends StatefulWidget {
  const hadith_screen({super.key});

  @override
  State<hadith_screen> createState() => _hadith_screenState();
}

class _hadith_screenState extends State<hadith_screen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  List numb = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, vsync: this);
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
              'Hadith',
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
          bottom: TabBar(
              labelColor: kprimaryColor,
              automaticIndicatorColorAdjustment: false,
              controller: controller,
              indicatorColor: kprimaryColor,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  text: 'Sahih-Bhukari',
                ),
                Tab(
                  text: 'Sahih-Muslim',
                )
              ]),
        ),
        body: TabBarView(controller: controller, children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height - 146,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: hadith_bhukari.length,
                    itemBuilder: (context, index) {
                      return FadeInRight(
                        duration: Duration(milliseconds: 1500),
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                height: 40,
                                width: double.infinity,
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: kprimaryColor,
                                            boxShadow: [
                                              BoxShadow(
                                                color: kprimaryColor,
                                                blurRadius: 10,
                                                spreadRadius: 1,
                                                offset: Offset(3, 4),
                                              )
                                            ],
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                              child: Text(
                                            numb[index].toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )),
                                        ),
                                      ),
                                      Container(
                                        // width: 100,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                onTap: () {
                                                  Clipboard.setData(
                                                          ClipboardData(
                                                              text: allah_name[
                                                                  index]))
                                                      .then((result) {
                                                    // show toast or snackbar after successfully save
                                                    Fluttertoast.showToast(
                                                        msg: 'Copied');
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.copy,
                                                  color: kprimaryColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  alignment: WrapAlignment.end,
                                  // mainAxisWrapAlignment.endignment.end,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: SelectableText(
                                        hadith_bhukari[index],
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: kprimaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  alignment: WrapAlignment.start,
                                  // mainAxisWrapAlignment.endignment.end,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: SelectableText(
                                        hadithE_bhukari[index],
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: kprimaryColor,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height - 146,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: hadith_muslim.length,
                    itemBuilder: (context, index) {
                      return FadeInRight(
                        duration: Duration(milliseconds: 1500),
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                height: 40,
                                width: double.infinity,
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: kprimaryColor,
                                            boxShadow: [
                                              BoxShadow(
                                                color: kprimaryColor,
                                                blurRadius: 10,
                                                spreadRadius: 1,
                                                offset: Offset(3, 4),
                                              )
                                            ],
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                              child: Text(
                                            numb[index].toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )),
                                        ),
                                      ),
                                      Container(
                                        // width: 100,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                onTap: () {
                                                  Clipboard.setData(
                                                          ClipboardData(
                                                              text: allah_name[
                                                                  index]))
                                                      .then((result) {
                                                    // show toast or snackbar after successfully save
                                                    Fluttertoast.showToast(
                                                        msg: 'Copied');
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.copy,
                                                  color: kprimaryColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  alignment: WrapAlignment.end,
                                  // mainAxisWrapAlignment.endignment.end,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: SelectableText(
                                        hadith_muslim[index],
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: kprimaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  alignment: WrapAlignment.start,
                                  // mainAxisWrapAlignment.endignment.end,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: SelectableText(
                                        hadithE_muslim[index],
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: kprimaryColor,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
