import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quranapp/frontend/home/home_screen.dart';
import 'package:quranapp/frontend/selection/selection_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

String login = '';
Future<void> _firebaseMessagingBackgroundHandler(
  RemoteMessage message,
) async {}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  if (pref.getBool('Email') != null) {
    login = 'student';
  } else if (pref.getBool('google') != null) {
    login = 'qari';
  } else if (pref.getBool('google') == null && pref.getBool('Email') == null) {
    login = 'select';
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Learn Quran',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        useMaterial3: true,
        primarySwatch: Colors.lightGreen,
      ),
      home: SafeArea(
          child: login == 'student'
              ? home_screen(isqari: false)
              : login == 'qari'
                  ? home_screen(isqari: true)
                  : WillPopScope(
                      onWillPop: () {
                        SystemNavigator.pop();
                        return Future.value();
                      },
                      child: selection_screen())),
    );
  }
}
