import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quranapp/constant/constant.dart';
import 'package:quranapp/frontend/home/home_screen.dart';
import 'package:quranapp/frontend/qari/login/login_screen.dart';
import 'package:quranapp/frontend/student/auth/login_screen.dart';

class selection_screen extends StatefulWidget {
  const selection_screen({super.key});

  @override
  State<selection_screen> createState() => _selection_screenState();
}

class _selection_screenState extends State<selection_screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: kprimaryColor,
          ),
          title: Center(
            child: Text(
              'Select Login',
              style: TextStyle(
                color: kprimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          // actions: [
          //   Container(
          //     height: 10,
          //     width: 60,
          //   ),
          // ],
        ),
        body: WillPopScope(
          onWillPop: () {
            SystemNavigator.pop();
            return Future.value();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CupertinoButton(
                  onPressed: () async {
                    Get.to(login_screen_qari(),
                        transition: Transition.downToUp);
                  },
                  child: Container(
                    // height: ,
                    width: double.infinity,
                    // margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(3, 4),
                          spreadRadius: 1,
                          blurRadius: 7,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.network(
                            'https://cdn4.iconfinder.com/data/icons/professions-2-2/151/82-512.png',
                            height: 45,
                          ),
                          Text(
                            'Login As A Qari',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: CupertinoButton(
                  onPressed: () async {
                    Get.to(login_Screen_stu(), transition: Transition.downToUp);
                  },
                  child: Container(
                    // height: ,
                    width: double.infinity,
                    // margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(3, 4),
                          spreadRadius: 1,
                          blurRadius: 7,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.network(
                            'https://th.bing.com/th/id/R.c5d910b46811bf2505f23b3cf9db4d21?rik=0hp7N8jSdCgoUg&riu=http%3a%2f%2ficons.iconarchive.com%2ficons%2fwebalys%2fkameleon.pics%2f512%2fStudent-3-icon.png&ehk=jIFeN7ppZaXSI7rBF5ofycjeLD3UFSLa1umkdiBvnwY%3d&risl=&pid=ImgRaw&r=0',
                            height: 45,
                          ),
                          Text(
                            'Login As A Student',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: CupertinoButton(
                  onPressed: () async {
                    Get.to(
                        home_screen(
                          isqari: false,
                          isguest: true,
                        ),
                        transition: Transition.downToUp);
                  },
                  child: Container(
                    // height: ,
                    width: double.infinity,
                    // margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(3, 4),
                          spreadRadius: 1,
                          blurRadius: 7,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.network(
                            'https://cdn1.iconfinder.com/data/icons/big-rocket/80/BigRocket-1-01-512.png',
                            height: 45,
                          ),
                          Text(
                            'Login As A Guest',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
