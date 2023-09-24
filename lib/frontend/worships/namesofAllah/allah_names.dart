// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, sized_box_for_whitespace

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constant/constant.dart';

class allah_names extends StatefulWidget {
  const allah_names({super.key});

  @override
  State<allah_names> createState() => _allah_namesState();
}

class _allah_namesState extends State<allah_names> {
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
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    91,
    92,
    93,
    94,
    95,
    96,
    97,
    98,
    99,
  ];
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
              'Allah Names',
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
                                  '99',
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
                                    'Names of Allah',
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
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: numb.length,
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
                                        allah_name[index],
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
                                        allah_name_mean[index],
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
        ),
      ),
    );
  }
}
