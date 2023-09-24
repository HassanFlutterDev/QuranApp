// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quranapp/constant/constant.dart';
import 'package:quranapp/models/juz_detailsU.dart';

import '../../../models/juz_detailsE.dart';
import '../../../models/juz_model.dart';
import 'package:http/http.dart' as http;

class juz_screen extends StatefulWidget {
  String name;
  String url;
  String url1;
  String url2;
  int number;
  juz_screen({
    super.key,
    required this.name,
    required this.url2,
    required this.url,
    required this.url1,
    required this.number,
  });

  @override
  State<juz_screen> createState() => _juz_screenState();
}

class _juz_screenState extends State<juz_screen> {
  Juzz? juz;
  JuzzDetailE? juzE;
  JuzDetailU? juzU;
  @override
  void initState() {
    super.initState();
    getJuz();
  }

  // String url = 'http://api.alquran.cloud//ar.alafasy';
  bool loading = true;
  TextEditingController search = TextEditingController();
  getJuz() async {
    setState(() {
      loading = true;
    });
    log(widget.url);
    var res = await http.get(Uri.parse(widget.url));
    final data = jsonDecode(res.body);
    juz = Juzz.fromJson(data);
    var res1 = await http.get(Uri.parse(widget.url1));
    final data1 = jsonDecode(res1.body);
    juzU = JuzDetailU.fromJson(data1);
    var res2 = await http.get(Uri.parse(widget.url2));
    final data2 = jsonDecode(res2.body);
    juzE = JuzzDetailE.fromJson(data2);
    // log(surah!.data[0].searchIndex.toString());
    setState(() {
      loading = false;
    });
    return juz;
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
              widget.name,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              ZoomIn(
                duration: Duration(milliseconds: 1500),
                child: Container(
                  height: 140,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 24,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'images/clipArt.png',
                                  height: 40,
                                  color: Colors.white,
                                ),
                                Text(
                                  widget.number.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Center(
                                  child: Text(
                                    widget.name,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
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
                                    '${loading ? '0' : juz!.data.ayahs.length} verse',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ])),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height - 290,
                child: loading
                    ? Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.37,
                          ),
                          Center(
                            child: CircularProgressIndicator(
                              color: kprimaryColor,
                            ),
                          )
                        ],
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: juz!.data.ayahs.length,
                        itemBuilder: (context, index) {
                          var snap = juz!.data.ayahs[index];

                          return FadeInRight(
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
                                            padding:
                                                const EdgeInsets.only(left: 8),
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
                                                snap.numberInSurah.toString(),
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
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  snap.surah.englishName,
                                                  style: TextStyle(
                                                    color: kprimaryColor,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Clipboard.setData(
                                                              ClipboardData(
                                                                  text: snap
                                                                      .text))
                                                          .then((result) {
                                                        // show toast or snackbar after successfully save
                                                        Fluttertoast.showToast(
                                                            msg: "copied");
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
                                            snap.text,
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
                                            juzE!.data.ayahs[index].text,
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
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Wrap(
                                      alignment: WrapAlignment.end,
                                      // mainAxisWrapAlignment.endignment.end,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: SelectableText(
                                            juzU!.data.ayahs[index].text,
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
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
