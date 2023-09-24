import 'package:flutter/material.dart';
import 'package:quranapp/constant/constant.dart';

class fasting_screen extends StatefulWidget {
  const fasting_screen({super.key});

  @override
  State<fasting_screen> createState() => _fasting_screenState();
}

class _fasting_screenState extends State<fasting_screen> {
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
            'Roza',
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                alignment: WrapAlignment.start,
                // mainAxisWrapAlignment.endignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SelectableText(
                      'Dua for starting the fast:',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: kprimaryColor,
                        fontSize: 24,
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
                      'وَبِصَوْمِ غَدٍ نَّوَيْتُ مِنْ شَهْرِ رَمَضَانَ',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: kprimaryColor,
                        fontSize: 24,
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
                // mainAxisWrapAlignment.startignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SelectableText(
                      'Translation: "I intstart to keep the fast tomorrow for the month of Ramadan."',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: kprimaryColor,
                        fontSize: 18,
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
                      'میں نیت کرتا/کرتی ہوں رمضان کے روزے کی',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: kprimaryColor,
                        fontSize: 24,
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
                      'Dua for breaking the fast:',
                      style: TextStyle(
                        color: kprimaryColor,
                        fontSize: 24,
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
                      'اللهم إني لك صمت وبك آمنت وعلى رزقك أفطرت',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: kprimaryColor,
                        fontSize: 24,
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
                      'Translation: "O Allah, I fasted for You and I believe in You and I break my fast with Your sustenance."',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: kprimaryColor,
                        fontSize: 18,
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
                      'اے اللّٰہ میں نے تیرے لیے روزہ رکھا، میں تجھ پر ایمان لایا اور تیرے ہی دیے ہوۓ رزق سے افطار کیا',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: kprimaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
