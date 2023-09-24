// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/backend/auth/auth_function.dart';
import 'package:quranapp/constant/constant.dart';
import 'package:quranapp/frontend/home/home_screen.dart';
import 'package:quranapp/frontend/student/home/home_screen.dart';

class signUp_screen extends StatefulWidget {
  const signUp_screen({super.key});

  @override
  State<signUp_screen> createState() => _signUp_screenState();
}

class _signUp_screenState extends State<signUp_screen> {
  TextEditingController emailc = TextEditingController();
  TextEditingController userc = TextEditingController();
  TextEditingController passwordc = TextEditingController();
  bool obsecure = true;
  bool isloading = false;

  // Future login() async {
  //   setState(() {
  //     isloading = true;
  //   });
  //   AuthFunctions.instance.loginUser(emailc.text, passwordc.text);
  // }

  @override
  void dispose() {
    emailc.dispose();
    passwordc.dispose();

    super.dispose();
  }

  void _togglepassword() {
    if (obsecure == true) {
      setState(() {
        obsecure = false;
      });
    } else {
      setState(() {
        obsecure = true;
      });
    }
  }

  String error = '';
  String Eerror = '';
  String Perror = '';
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
              'Student SignUp',
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
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              Center(
                child: Text(
                  'SignUp',
                  style: TextStyle(
                    fontSize: 70,
                    color: kprimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              // SvgPicture.asset('images/login.svg', height: size.height * 0.3),
              // SizedBox(
              //   height: size.height * 0.03,
              // ),
              Center(
                child: TextFieldContainer(
                    color: error.isNotEmpty ? Colors.red : kprimaryColor,
                    child: TextField(
                      onSubmitted: (v) async {},
                      controller: userc,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Username',
                        icon: Icon(
                          Icons.person_outline,
                          color: kprimaryColor,
                        ),
                      ),
                    )),
              ),
              error.isEmpty
                  ? Container()
                  : Text(error,
                      style: TextStyle(
                        color: Colors.red,
                      )),
              Center(
                child: TextFieldContainer(
                    color: Eerror.isNotEmpty ? Colors.red : kprimaryColor,
                    child: TextField(
                      onSubmitted: (v) async {},
                      controller: emailc,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                        icon: Icon(
                          Icons.alternate_email_outlined,
                          color: kprimaryColor,
                        ),
                      ),
                    )),
              ),
              Eerror.isEmpty
                  ? Container()
                  : Text(Eerror,
                      style: TextStyle(
                        color: Colors.red,
                      )),
              Center(
                child: TextFieldContainer(
                    color: Perror.isNotEmpty ? Colors.red : kprimaryColor,
                    child: TextField(
                      onSubmitted: (value) async {},
                      controller: passwordc,
                      obscureText: obsecure,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          icon: Icon(
                            Icons.lock,
                            color: kprimaryColor,
                          ),
                          suffixIcon: GestureDetector(
                              onTap: _togglepassword,
                              child: obsecure
                                  ? Icon(
                                      Icons.visibility,
                                      color: kprimaryColor,
                                    )
                                  : Icon(
                                      Icons.visibility_off,
                                      color: kprimaryColor,
                                    ))),
                    )),
              ),
              Perror.isEmpty
                  ? Container()
                  : Text(Perror,
                      style: TextStyle(
                        color: Colors.red,
                      )),
              // SizedBox(
              //   height: 10,
              // ),
              Center(
                  child: isloading
                      ? CircularProgressIndicator(
                          color: kprimaryColor,
                        )
                      : customButton(
                          text: 'SignUp',
                          onPressed: () async {
                            setState(() {
                              isloading = true;
                            });
                            if (userc.text.length <= 5) {
                              setState(() {
                                isloading = false;
                                error =
                                    'Username Should be at least 6 Characters!';
                              });
                            } else {
                              String result = await AuthFunction().Signup(
                                  emailc.text,
                                  passwordc.text,
                                  userc.text,
                                  // _image!
                                  context);
                              // String result = '';
                              print(result);
                              if (result == 'password-error') {
                                setState(() {
                                  isloading = false;
                                  error = '';
                                  Eerror = '';
                                  Perror =
                                      "Password Should be at least 6 Characters!";
                                });
                              }
                              if (result == 'email-error') {
                                setState(() {
                                  isloading = false;
                                  error = '';
                                  Perror = '';
                                  Eerror =
                                      "Email is Already in Used By Another Account!";
                                });
                              }
                              if (result == 'fields-error') {
                                setState(() {
                                  isloading = false;
                                  // error = "Username is Empty";
                                  Eerror = "Email is Empty";
                                  Perror = "Password is Empty";
                                });
                              }
                              if (result == 'invalid-email') {
                                setState(() {
                                  isloading = false;
                                  error = '';
                                  Perror = '';
                                  Eerror = "Your Email Is Badly Formatted!";
                                });
                              }
                              if (userc.text.length <= 5) {
                                setState(() {
                                  isloading = false;
                                  error = 'Username Should be 6 Characters!';
                                });
                              }
                              if (result == '' && userc.text.length >= 5) {
                                setState(() {
                                  isloading = true;
                                });
                                Get.to(home_screen(
                                  isqari: false,
                                ));
                              }
                            }
                          })),

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Have an Account?',
                        style: TextStyle(fontSize: 20),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 20, color: kprimaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  Color color;
  TextFieldContainer({Key? key, required this.child, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.9,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.5),
        borderRadius: BorderRadius.circular(6),
      ),
      child: child,
    );
  }
}

class customButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const customButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: CupertinoButton(
        onPressed: onPressed,
        child: Container(
          width: double.infinity,
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 17, color: Colors.white),
            ),
          ),
        ),
        minSize: kMinInteractiveDimensionCupertino,
        borderRadius: BorderRadius.circular(5),
        color: kprimaryColor,
      ),
    );
  }
}
