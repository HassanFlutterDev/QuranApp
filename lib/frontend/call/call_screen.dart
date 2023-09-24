// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  CallPage(
      {Key? key, required this.callID, required this.name, this.uid, this.uid1})
      : super(key: key);
  final String callID;
  final String? uid;
  final String? uid1;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
        appID:
            503152013, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign:
            '41d41ebe8bd176c4e5c90fc14d99f85f2cc65e99a9b3aba1c0d33fec96fcb19e', // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: FirebaseAuth.instance.currentUser!.uid,
        userName: name,
        callID: callID,
        // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
          ..onHangUp = () async {
            await FirebaseFirestore.instance
                .collection('users')
                .doc(uid)
                .collection('qaris')
                .doc(uid1)
                .update({
              'callId': '',
            });
            Navigator.pop(context);
          });
  }
}
