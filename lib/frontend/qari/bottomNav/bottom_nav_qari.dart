// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:quranapp/constant/constant.dart';
import 'package:quranapp/frontend/home/home_screen.dart';
import 'package:quranapp/frontend/qari/home/home_screen.dart';
import 'package:quranapp/frontend/qari/search/search.dart';

class bottom_nav_qari extends StatefulWidget {
  const bottom_nav_qari({super.key});

  @override
  State<bottom_nav_qari> createState() => _bottom_nav_qariState();
}

class _bottom_nav_qariState extends State<bottom_nav_qari> {
  int indx = 0;

  @override
  Widget build(BuildContext context) {
    List pages = [
      home_screen_qari(),
      search_screen_qari(),
    ];
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: kprimaryColor,
          currentIndex: indx,
          onTap: (value) {
            setState(() {
              indx = value;
            });
          },
          backgroundColor: backgroundColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined), label: 'Your Students'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_search_outlined),
                label: 'Search Students'),
          ]),
      body: pages[indx],
    ));
  }
}
