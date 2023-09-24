import 'package:flutter/material.dart';
import 'package:quranapp/constant/constant.dart';

class hajj_screen extends StatefulWidget {
  const hajj_screen({super.key});

  @override
  State<hajj_screen> createState() => _hajj_screenState();
}

class _hajj_screenState extends State<hajj_screen> {
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
            'Hajj-Ummrah',
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
                alignment: WrapAlignment.end,
                // mainAxisWrapAlignment.endignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SelectableText(
                      ':حج کا مکمل طریقہ',
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
                alignment: WrapAlignment.end,
                // mainAxisWrapAlignment.endignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SelectableText(
                      'اولین کام حج کے مقدس حرم کے لئے سفر کرنا ہے۔',
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
                alignment: WrapAlignment.end,
                // mainAxisWrapAlignment.endignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SelectableText(
                      'وقت پر حج کے احرام پہننا ہے، جو دو سفید چادر کے بارے میں ہوتے ہیں۔',
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
                alignment: WrapAlignment.end,
                // mainAxisWrapAlignment.endignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SelectableText(
                      'حرم شریف کی حلقہ طواف کریں، جو کعبہ شریف کے گرد ہے',
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
                alignment: WrapAlignment.end,
                // mainAxisWrapAlignment.endignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SelectableText(
                      'طواف کے بعد، زمزم کا پانی پیں، جو کعبہ شریف کے قریب کے ایک چھوٹے ساحہ میں دستیاب ہوتا ہے',
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
                alignment: WrapAlignment.end,
                // mainAxisWrapAlignment.endignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SelectableText(
                      'سفا و مروہ پر 7 مرتے ہوئے سعی کریں۔ اس میں آپ کو بھیگنا پڑ سکتا ہے، لہذا آپ کو اپنے احرام کو دھونا ہوگا۔',
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
                alignment: WrapAlignment.end,
                // mainAxisWrapAlignment.endignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SelectableText(
                      'پھر اعتمر کریں، جو عمرہ کا بھی ایک طریقہ ہے',
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
                alignment: WrapAlignment.end,
                // mainAxisWrapAlignment.endignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SelectableText(
                      'ہجرت کے دوران، مزدوریاں اور اعمال کو ادا کریں، جن میں وقفہ عرفہ، رمی، قربانی، حلقہ طواف، اور سعی شامل ہیں۔',
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
                alignment: WrapAlignment.end,
                // mainAxisWrapAlignment.endignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SelectableText(
                      'حج کے آخر میں، طواف الوداع کریں، جو ایک آخری مرتبہ کعبہ شریف کے گرد کے طواف کو کہتے ہیں',
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
                alignment: WrapAlignment.end,
                // mainAxisWrapAlignment.endignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SelectableText(
                      ':عمرہ کا مکمل طریقہ',
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
                alignment: WrapAlignment.end,
                // mainAxisWrapAlignment.endignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SelectableText(
                      ' اولین کام عمرہ کے مقدس حرم کے لئے سفر کرنا ہے۔',
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
                alignment: WrapAlignment.end,
                // mainAxisWrapAlignment.endignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SelectableText(
                      'عمرہ کے احرام پہننا ہے، جو دو سفید چادر کے بارے میں ہوتے ہیں۔',
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
                alignment: WrapAlignment.end,
                // mainAxisWrapAlignment.endignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SelectableText(
                      'توڑی کے طواف کری',
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
