// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last

import 'dart:convert';
import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quranapp/backend/audio/audio.dart';
import 'package:quranapp/constant/constant.dart';
import 'package:quranapp/models/surah_Details.dart';
import 'package:http/http.dart' as http;
import 'package:quranapp/models/surah_DetailsE.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../models/surah_detailsU.dart';

class surah_scrren extends StatefulWidget {
  String name;
  String type;
  String verse;
  String mean;
  String url;
  String url1;
  String url2;
  int number;
  surah_scrren(
      {super.key,
      required this.name,
      required this.url,
      required this.url1,
      required this.number,
      required this.url2,
      required this.type,
      required this.mean,
      required this.verse});

  @override
  State<surah_scrren> createState() => _surah_scrrenState();
}

class _surah_scrrenState extends State<surah_scrren> {
  final audioplayer = AudioPlayer();
  List audios = [];
  bool isplaying = false;
  var playing = '';
  bool play = false;
  ScrollController controller = ScrollController();
  bool loading = false;
  final ItemScrollController itemScrollController = ItemScrollController();
  @override
  void initState() {
    getSurah();
    audioplayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isplaying = state == PlayerState.playing;
      });
    });
    audioplayer.onPlayerComplete.listen((event) async {
      isplaying = false;
      playing = '';

      setState(() {});
    });
    super.initState();
  }

  SurahDetail? surah;
  SurahDetailE? surahE;
  SurahDetailU? surahU;
  // String url = 'http://api.alquran.cloud//ar.alafasy';
  bool show = false;
  TextEditingController search = TextEditingController();
  getSurah() async {
    setState(() {
      loading = true;
    });
    // log(widget.url);
    var res = await http.get(Uri.parse(widget.url));
    final data = jsonDecode(res.body);
    surah = SurahDetail.fromJson(data);
    var res1 = await http.get(Uri.parse(widget.url2));
    final data1 = jsonDecode(res1.body);
    surahE = SurahDetailE.fromJson(data1);
    var res2 = await http.get(Uri.parse(widget.url1));
    final data2 = jsonDecode(res2.body);
    surahU = SurahDetailU.fromJson(data2);
    for (var i = 0; i < surah!.data.ayahs.length; i++) {
      setState(() {
        audios.add(surah!.data.ayahs[i].audio);
      });
    }
    // log(surah!.data[0].searchIndex.toString());
    setState(() {
      loading = false;
    });
    return surah;
  }

  @override
  void dispose() {
    audioplayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (isplaying) {
              setState(() {
                playing = '';
                play = true;
              });
              await audioplayer.pause();
            } else {
              setState(() {
                play = false;
              });
              for (var i = 0; i < audios.length; i++) {
                if (play == false) {
                  itemScrollController.scrollTo(
                      index: i,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.bounceInOut);
                  // Duration duration = await audio_functions().audio(audios[i]);
                  // log('scroll ${double.parse(i.toString()).toString()}');
                  await audioplayer.play(UrlSource(audios[i]));
                  // }
                  playing = surah!.data.ayahs[i].numberInSurah.toString();
                  Duration? duration = await audioplayer.getDuration();
                  await Future.delayed(duration!);

                  // controller.jumpTo(double.parse(i.toString()));
                  log('dur ${duration.toString()}');
                }
              }
            }

            setState(() {});
          },
          child: Icon(
            isplaying ? Icons.pause : Icons.play_arrow_outlined,
            color: Colors.white,
          ),
          backgroundColor: kprimaryColor,
        ),
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
                          children: [
                            SizedBox(
                              height: 8,
                            ),
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
                                      fontSize: 20,
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
                                    '${widget.mean}-${widget.verse} verse',
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
                            SizedBox(
                              height: 18,
                            ),
                            Row(
                              children: [
                                Center(
                                  child: Text(
                                    widget.type,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Color.fromARGB(183, 255, 255, 255),
                                      fontSize: 13,
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
                    : ScrollablePositionedList.builder(
                        itemScrollController: itemScrollController,
                        shrinkWrap: true,
                        itemCount: surah!.data.ayahs.length,
                        itemBuilder: (context, index) {
                          var snap = surah!.data.ayahs[index];
                          // log(index.toString());
                          return FadeInRight(
                            duration: Duration(milliseconds: 1500),
                            child: Container(
                              color: playing == snap.numberInSurah.toString()
                                  ? kprimaryColor.withOpacity(0.3)
                                  : Colors.transparent,
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
                                            width: 100,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    if (isplaying) {
                                                      setState(() {
                                                        playing = '';
                                                      });
                                                      await audioplayer.pause();
                                                    } else {
                                                      setState(() {
                                                        playing = snap
                                                            .numberInSurah
                                                            .toString();
                                                      });
                                                      await audioplayer.play(
                                                          UrlSource(surah!
                                                              .data
                                                              .ayahs[index]
                                                              .audio));
                                                      await Future.delayed(
                                                          Duration(seconds: 2));
                                                    }

                                                    setState(() {});
                                                  },
                                                  child: Icon(
                                                    playing ==
                                                            snap.numberInSurah
                                                                .toString()
                                                        ? Icons.pause_outlined
                                                        : Icons
                                                            .play_arrow_outlined,
                                                    color: kprimaryColor,
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
                                                    child: Icon(Icons.copy,
                                                        color: kprimaryColor),
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
                                            surahE!.data.ayahs[index].text,
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
                                            surahU!.data.ayahs[index].text,
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
