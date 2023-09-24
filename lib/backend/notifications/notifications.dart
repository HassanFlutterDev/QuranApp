// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

// after this create a method initialize to initialize  localnotification

  static void initialize() {
    // initializationSettings  for Android
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    );

    _notificationsPlugin.initialize(
      initializationSettings,

      // onDidReceiveNotificationResponse: (String? id) async {
      //   print("onSelectNotification");
      //   if (id!.isNotEmpty) {
      //     print("Router Value1234 $id");

      //     // Navigator.of(context).push(
      //     //   MaterialPageRoute(
      //     //     builder: (context) => DemoScreen(
      //     //       id: id,
      //     //     ),
      //     //   ),
      //     // );

      //   }
      // },
    );
    _notificationsPlugin.getNotificationAppLaunchDetails();
  }

  static sendPush(String body, String title, List token) async {
    try {
      print('sending');
      final response =
          await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
              headers: {
                'Content-Type': 'application/json',
                'Authorization':
                    'key= AAAAEos0OtA:APA91bE1WAZ7JFTyONCyi3oyEyDbyBd-L2gPbTrghCAwhjHoD_ex6fYrBvqGt5TQmhyjadtiEIlsgwsmsVccvYi3_Ovz212GblljZ1-dp2KnOeeHk2BTQPDX9cLTEifWMKl3hpdxLmcm',
              },
              body: json.encode({
                "pirority": "High",
                // "auto_cancel": false,
                'icon': 'default',
                "registration_ids": token,
                "notification": {
                  "body": body,
                  "title": title,
                  "android_channel_id": "normal_chennel",
                  // "sound": 'alert',
                },
                // "android": {
                //   // "notification": {"sound": "alert"}
                // },
              }));
      print('sent ${response.statusCode}and ${response.request}');
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> createanddisplayLownotification(
      RemoteMessage message) async {
    try {
      // var filepath;

      // // var styleInformation = BigPictureStyleInformation(
      // var directory = await getApplicationDocumentsDirectory();
      // filepath = '${directory.path}/image';
      // // );
      // var response = await http.get(Uri.parse(message.data['image']));
      // var file = File(filepath);
      // log(response.statusCode.toString());
      // file.writeAsBytes(response.bodyBytes);

      NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "normal_chennel",
          "normal",
          // styleInformation:StyleInformation(

          // ),
          // usesChronometer: true,
          // autoCancel: false,

          importance: Importance.max,
          priority: Priority.high,
          // tag: 'Hassan',/
          // ongoing: true,
          // fullScreenIntent: true,
          // styleInformation: styleInformation,
          // sound: RawResourceAndroidNotificationSound('alert'),
          // autoCancel: false,
          // color: Colors.blue,

          // largeIcon: FilePathAndroidBitmap(filepath),
          // largeIcon:AndroidBitmap()
          //     'https://th.bing.com/th/id/OIP.hxRValICG6OlXI56NUfSjAHaF1?w=223&h=180&c=7&r=0&o=5&dpr=1.6&pid=1.7',
          // audioAttributesUsage:
          //     AudioAttributesUsage.voiceCommunicationSignalling,
          enableLights: true,

          color: Colors.blue,
        ),
      );

      await _notificationsPlugin.show(
        123,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: '',
      );
      log('generate');
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
