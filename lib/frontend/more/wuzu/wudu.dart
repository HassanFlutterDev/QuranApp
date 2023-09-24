import 'package:flutter/material.dart';
import 'package:quranapp/constant/constant.dart';

class wudu_screen extends StatefulWidget {
  const wudu_screen({super.key});

  @override
  State<wudu_screen> createState() => _wudu_screenState();
}

class _wudu_screenState extends State<wudu_screen> {
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
            'Wudu',
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
                      ':وضو  کا مکمل طریقہ',
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
                      'وضوء دو طرح سے ثابت ہے پہلا: واجب كردہ طريقہ ',
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
                      'اول: پورا چہرہ ايك بار دھونا، اس ميں كلى كرنا اور ناك ميں پانى ڈالنا بھى شامل ہے۔  دوم: دونوں بازو كہنيوں تك ايك بار دھونے سوم: سارے سر كا مسح كرنا، اس ميں كانوں كا مسح بھى شامل ہے چہارم: دونوں پاؤں ٹخنوں سميت ايك بار دھونا، ايك بار دھونے سے مراد يہ ہے كہ سارا عضو دھويا جائے پنجم: ترتيب كے ساتھ اعضاء كا دھونا۔ يعنى پہلے چہرہ دھويا جائے، پھر دونوں بازو اور پھر سر كا مسح اور پھر دونوں پاؤں ششم: موالاۃ يعنى: اعضاء كو مسلسل دھونا كہ ايك عضو دھونے كے بعد دوسرا عضو دھونے ميں زيادہ وقت فاصلہ نہ ہو، بلكہ ايك عضو كے بعد دوسرا عضو دھويا جائے۔',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: kprimaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
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
                      'دوسرا طريقہ: يہ مستحب ہے۔',
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
                      'انسان طہارت كرنے اور ناپاكى دور كرنے كى نيت كرے اور يہ نيت زبان سے ادا نہيں ہو گى، كيونكہ نيت كى جگہ دل ہے اور يہ دل سے ہوتى اور اسى طرح باقى سب عبادات ميں بھى نيت دل سے ہوگى.',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: kprimaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
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
                      'پھر بسم اللہ پڑھے۔  تين بار دونوں ہاتھ دھوئے۔  پھر تين بار كلى كرے ( كلى يہ ہے كہ مونہہ ميں پانى ڈال كر گھمائے) اور تين بار ناك ميں پانى ڈال كر بائيں ہاتھ سے ناك جھاڑے۔',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: kprimaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
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
                      'اپنا چہرہ تين بار دھوئے، لمبائى ميں چہرہ كى حد سر كے بالوں سے ليكر تھوڑى كے نيچے تك اور چوڑائى ميں دائيں كان سے بائيں كان تك ہے، مرد كى داڑھى اگر گھنى ہو تو وہ داڑھى كو اوپر سے دھوئے اور اندر كا خلال كرے اور اگر كم ہو تو سارى داڑھى دھوئے۔ پھر اپنے دونوں ہاتھ كہنيوں تك تين بار دھوئے، ہاتھوں كى حد انگليوں كے ناخنوں سے ليكر بازو كے شروع تك ہے، اگر دھونے سے قبل ہاتھ ميں آٹا يا مٹى يا رنگ وغيرہ لگا ہو تو اسے اتارنا ضرورى ہے، تا كہ پانى جلد تك پہنچ جائے۔',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: kprimaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
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
                      ' اس كے بعد نئے پانى كے ساتھ سر اور كانوں كا ايك بار مسح كرے ہاتھوں كے بچے ہوئے پانى سے نہيں، سر كے مسح كا طريقہ يہ ہے كہ اپنے دونوں ہاتھ پيشانى كے شروع ميں ركھے اور انہيں گدى تك پھيرے اور پھر وہاں سے واپس پيشانى تك لائے جہاں سے شروع كيا تھا، پھر دونوں انگشت شہادت كانوں كے سوراخوں ميں ڈال كر اندر كى طرف اور اپنے انگوٹھوں سے كانوں كے باہر كى طرف مسح كرے۔عورت اپنے سر كا مسح اس طرح كرے كہ وہ پشانى سے ليكر گردن تك لٹكے ہوئے بالوں پر مسح كرے، اس كے ليے كمر پر لٹكے ہوئے بالوں پر مسح كرنا ضرورى نہيں۔ پھر اپنے دونوں پاؤں ٹخنوں تك تين بار دھوئے، ٹخنے پنڈلى كے آخر ميں باہر نكلى ہوئى ہڈى كو كہتے ہيں۔',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: kprimaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
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
