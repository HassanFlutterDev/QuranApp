// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/constant/constant.dart';
import 'package:quranapp/frontend/quran/juz/juz_screen.dart';
import 'package:quranapp/frontend/quran/surah/surah_screen.dart';
import 'package:quranapp/models/surah_model.dart';
import 'package:http/http.dart' as http;

class quran_screen extends StatefulWidget {
  const quran_screen({super.key});

  @override
  State<quran_screen> createState() => _quran_screenState();
}

class _quran_screenState extends State<quran_screen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  List paraName = [
    'Alif-laam-meem',
    'Sayaqūlu ',
    'Tilka ’r-Rusulu ',
    'Lan Tana Loo ',
    'Wal Mohsanat',
    'Yuhibbullah ',
    'Wa Iza Samiu',
    'Wa Lau Annana',
    'Qalal Malao',
    'Wa A\'lamu',
    'Yatazeroon ',
    'Wa Mamin Da\'abat ',
    'Wa Ma Ubrioo ',
    'Subhanallazi ',
    'Rubama ',
    'Qal Alam ',
    'Aqtarabo ',
    'Qadd Aflaha ',
    'Wa Qalallazina ',
    'A\'man Khalaq ',
    'Utlu Ma Oohi ',
    'Wa Manyaqnut ',
    'Wa Mali ',
    'Faman Azlam ',
    'Elahe Yuruddo ',
    'Ha\'a Meem (حم)',
    'Qala Fama Khatbukum ',
    'Qadd Sami Allah ',
    'Tabarakallazi ',
    'Amma Yatasa\'aloon ',
    // 'An-Naba - An-Nas',
  ];
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
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
  ];
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    // TODO: implement initState
    getSurah();
    super.initState();
  }

  bool loading = true;
  Surah? surah;
  String url = 'http://api.alquran.cloud/v1/surah';
  bool show = false;
  TextEditingController search = TextEditingController();
  getSurah() async {
    setState(() {
      loading = true;
    });
    var res = await http.get(Uri.parse(url));
    final data = jsonDecode(res.body);
    surah = Surah.fromJson(data);
    // log(surah!.data[0].searchIndex.toString());
    setState(() {
      loading = false;
    });
    return surah;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: kprimaryColor,
        ),
        title: Center(
          child: Text(
            'Quran',
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
                text: 'Surah',
              ),
              Tab(
                text: 'Para',
              )
            ]),
      ),
      body: TabBarView(controller: controller, children: [
        surahW(),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 140,
                child: ListView.builder(
                    itemCount: numb.length,
                    itemBuilder: (context, index) {
                      return ZoomIn(
                        duration: Duration(milliseconds: 300),
                        child: InkWell(
                          onTap: () {
                            Get.to(
                              juz_screen(
                                  name: paraName[index],
                                  url:
                                      'http://api.alquran.cloud/v1/juz/${numb[index]}/quran-uthmani',
                                  url2:
                                      'http://api.alquran.cloud/v1/juz/${numb[index]}/en.asad',
                                  url1:
                                      'http://api.alquran.cloud/v1/juz/${numb[index]}/ur.ahmedali',
                                  number: numb[index]),
                              transition: Transition.downToUp,
                            );
                          },
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.asset(
                                            'images/clipArt.png',
                                            height: 40,
                                            color: kprimaryColor,
                                          ),
                                          Text(
                                            numb[index].toString(),
                                            style: TextStyle(
                                              color: kprimaryColor,
                                              fontSize: 12,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              81,
                                          color: Colors.transparent,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Center(
                                                    child: Text(
                                                      paraName[index],
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget surahW() {
    return SingleChildScrollView(
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
                        hintText: 'Search Surah',
                        prefixIcon: Icon(CupertinoIcons.search)),
                  ),
                ),
              ],
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height - 196,
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
                  : show == true
                      ? ListView.builder(
                          itemCount: surah!.data.length,
                          itemBuilder: (context, index) {
                            var snap = surah!.data[index];
                            return snap.searchIndex.contains(search.text)
                                ? InkWell(
                                    onTap: () {
                                      Get.to(
                                          surah_scrren(
                                            url2:
                                                'http://api.alquran.cloud//v1/surah/${snap.number}/en.asad',
                                            url1:
                                                'http://api.alquran.cloud//v1/surah/${snap.number}/ur.ahmedali',
                                            url:
                                                'http://api.alquran.cloud//v1/surah/${snap.number}/ar.alafasy',
                                            mean: snap.englishNameTranslation,
                                            name: snap.englishName,
                                            type: snap.revelationType,
                                            verse:
                                                snap.numberOfAyahs.toString(),
                                            number: snap.number,
                                          ),
                                          transition: Transition.downToUp);
                                    },
                                    child: ZoomIn(
                                      duration: Duration(milliseconds: 300),
                                      child: Container(
                                        height: 60,
                                        width: double.infinity,
                                        color: Colors.transparent,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Image.asset(
                                                        'images/clipArt.png',
                                                        height: 40,
                                                        color: kprimaryColor,
                                                      ),
                                                      Text(
                                                        snap.number.toString(),
                                                        style: TextStyle(
                                                          color: kprimaryColor,
                                                          fontSize: 14,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width -
                                                              210,
                                                      color: Colors.transparent,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Center(
                                                                child: Text(
                                                                  snap.englishName,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Center(
                                                                child: Text(
                                                                  '${snap.englishNameTranslation.length > 18 ? snap.englishNameTranslation.replaceRange(16, snap.englishNameTranslation.length, '...') : snap.englishNameTranslation}-${snap.numberOfAyahs} verse',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Center(
                                                child: Text(
                                                  snap.name,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: kprimaryColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container();
                          })
                      : ListView.builder(
                          itemCount: surah!.data.length,
                          itemBuilder: (context, index) {
                            var snap = surah!.data[index];
                            return InkWell(
                              onTap: () {
                                Get.to(
                                    surah_scrren(
                                      url1:
                                          'http://api.alquran.cloud//v1/surah/${snap.number}/ur.ahmedali',
                                      url2:
                                          'http://api.alquran.cloud//v1/surah/${snap.number}/en.asad',
                                      mean: snap.englishNameTranslation,
                                      url:
                                          'http://api.alquran.cloud//v1/surah/${snap.number}/ar.alafasy',
                                      name: snap.englishName,
                                      type: snap.revelationType,
                                      verse: snap.numberOfAyahs.toString(),
                                      number: snap.number,
                                    ),
                                    transition: Transition.downToUp);
                              },
                              child: ZoomIn(
                                duration: Duration(milliseconds: 300),
                                child: Container(
                                  height: 60,
                                  width: double.infinity,
                                  color: Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Image.asset(
                                                  'images/clipArt.png',
                                                  height: 40,
                                                  color: kprimaryColor,
                                                ),
                                                Text(
                                                  snap.number.toString(),
                                                  style: TextStyle(
                                                    color: kprimaryColor,
                                                    fontSize: 14,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    210,
                                                color: Colors.transparent,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Center(
                                                          child: Text(
                                                            snap.englishName,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Center(
                                                          child: Text(
                                                            '${snap.englishNameTranslation.length > 18 ? snap.englishNameTranslation.replaceRange(16, snap.englishNameTranslation.length, '...') : snap.englishNameTranslation}-${snap.numberOfAyahs} verse',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Center(
                                          child: Text(
                                            snap.name,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: kprimaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })
              // }),
              ),
        ],
      ),
    );
  }
}
