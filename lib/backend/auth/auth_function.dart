// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quranapp/constant/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/snackBar.dart';

class AuthFunction extends GetxController {
  static AuthFunction instance = Get.find();

  Future<String> Signup(String email, String password, String username,
      BuildContext context) async {
    String err = '';
    try {
      UserCredential cred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      Get.snackbar('Creating Account', 'Success',
          overlayColor: kprimaryColor,
          backgroundColor: kprimaryColor.withOpacity(1),
          colorText: Colors.white);
      String? token = await FirebaseMessaging.instance.getToken();
      String? descc;
      List<String> splitList = username.split(" ");
      // List<String> splitList1 = username.split("");
      List<String> searchIndex = [];
      searchIndex.add(username.toLowerCase());
      searchIndex.add(username.toUpperCase());
      searchIndex.add(username.replaceAll(" ", ''));
      searchIndex.add(username.split(" ").removeLast());

      for (var i = 0; i < splitList.length; i++) {
        for (var y = 0; y < splitList[i].length; y++) {
          searchIndex.add(splitList[i].substring(0, y + 1).toLowerCase());
          searchIndex.add(splitList[i].substring(0, y + 1));
          searchIndex.add(splitList[i].substring(0, y + 1).toUpperCase());
        }
      }
      // model.User user = model.User(
      //   callId: '',
      //   token: token!,
      //   bio: 'Hey there Iam using Connect Me',
      //   verify: 'None',
      //   searchIndex: searchIndex,
      //   email: email,
      //   username: username,
      //   friends: [],
      //   requests: [],
      //   uid: cred.user!.uid,
      //   statusT: DateTime.now(),
      //   call: false,
      //   typing: '',
      //   callAccept: false,
      //   callUid: '',
      //   status: 'unavailable',
      //   photoUrl:
      //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhW0hzwECDKq0wfUqFADEJaNGESHQ8GRCJIg&usqp=CAU',
      // );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(cred.user!.uid)
          .set({
        'username': username,
        'token': token,
        'email': email,
        'searchIndex': searchIndex,
        'uid': cred.user!.uid,
        'photoUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhW0hzwECDKq0wfUqFADEJaNGESHQ8GRCJIg&usqp=CAU',
      });
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool('Email', true);
      // Get.to(homePgae(), transition: Transition.rightToLeft);
      if (password.isEmpty && username.isEmpty && email.isEmpty) {
        err = 'fields-error';
        Showsnackbar(context, 'Please fill all fields');
      }
    } on FirebaseAuthException catch (e) {
      Showsnackbar(context, e.message!);
      print(e.code);
      if (e.code == 'weak-password') {
        err = "password-error";

        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        err = "email-error";
      } else if (e.code == 'invalid-email') {
        err = "invalid-email";
      } else if (e.code == 'unknown') {
        err = "fields-error";
      } else if (e.code == 'network-request-failed') {
        err = "network-error";
      }
    } catch (e) {
      Showsnackbar(context, e.toString());
      // Get.snackbar('Error in Creating Account', e.toString(),
      //     overlayColor: Colors.purple,
      //     backgroundColor: Colors.purple.shade200,
      //     colorText: Colors.white);
    }
    return err;
  }

  Future<String> loginUser(
      String email, String password, BuildContext context) async {
    String err2 = '';
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      String? token = await FirebaseMessaging.instance.getToken();
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        "token": token,
      });
      print("Login done");
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool('Email', true);
      // Get.to(homePgae(), transition: Transition.rightToLeft);

      // Get.snackbar('Error', 'Please Fill All Fields',
      //     overlayColor: Colors.purple,
      //     backgroundColor: Colors.purple.shade200,
      //     colorText: Colors.white);
    } on FirebaseAuthException catch (e) {
      Showsnackbar(context, e.message!);
      print(e.code);
      if (e.code == 'user-not-found') {
        err2 = 'error-user';
      } else if (e.code == 'wrong-password') {
        err2 = 'error-pass';
      } else if (e.code == 'invalid-email') {
        err2 = "invalid-email";
      } else if (e.code == 'unknown') {
        err2 = "fields-error";
      } else if (e.code == 'network-request-failed') {
        err2 = "network-error";
      } else if (e.code == 'too-many-requests') {
        err2 = "network-error";
      }
    } catch (e) {
      Showsnackbar(context, e.toString());
    }
    return err2;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  Future<bool> signInWithGoogle(BuildContext context) async {
    bool res = false;
    try {
      final GoogleSignInAccount? googleUser = await this.googleSignIn.signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      User? user = userCredential.user;

      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          String? token = await FirebaseMessaging.instance.getToken();
          List<String> splitList = user.displayName.toString().split(" ");
          List<String> searchIndex = [];
          searchIndex.add(user.displayName.toString().toLowerCase());
          searchIndex.add(user.displayName.toString().toUpperCase());
          searchIndex.add(user.displayName.toString().replaceAll(" ", ''));
          searchIndex.add(user.displayName.toString().split(" ").removeLast());
          for (var i = 0; i < splitList.length; i++) {
            for (var y = 0; y < splitList[i].length; y++) {
              searchIndex.add(splitList[i].substring(0, y + 1).toLowerCase());
              searchIndex.add(splitList[i].substring(0, y + 1));
              searchIndex.add(splitList[i].substring(0, y + 1).toUpperCase());
            }
          }

          await FirebaseFirestore.instance
              .collection('qaris')
              .doc(user.uid)
              .set({
            'username': user.displayName,
            'email': user.email,
            'token': token,
            'uid': user.uid,
            'searchIndex': searchIndex,
            'photoUrl':
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhW0hzwECDKq0wfUqFADEJaNGESHQ8GRCJIg&usqp=CAU',
          });
        }
        String? token = await FirebaseMessaging.instance.getToken();
        await FirebaseFirestore.instance
            .collection("qaris")
            .doc(_auth.currentUser!.uid)
            .update({
          "token": token,
        });
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setBool('google', true);
        res = true;
      }
    } on FirebaseAuthException catch (e) {
      Showsnackbar(context, e.message!);
      res = false;
    } catch (e) {
      Showsnackbar(context, e.toString());
      res = false;
    }
    return res;
  }

  Future<bool> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      await googleSignIn.disconnect();
      await googleSignIn.signOut();
      return true;
    } catch (e) {}
    return false;
  }
}
