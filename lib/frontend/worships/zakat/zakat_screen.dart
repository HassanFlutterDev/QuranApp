import 'package:flutter/material.dart';
import 'package:quranapp/constant/constant.dart';

class zakat_Screen extends StatefulWidget {
  const zakat_Screen({super.key});

  @override
  State<zakat_Screen> createState() => _zakat_ScreenState();
}

class _zakat_ScreenState extends State<zakat_Screen> {
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
            'Zakat',
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
                      'زکوٰۃ',
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
                      'دینی اصطلاح میں زکواۃ ایسی مالی عبادت ہے جو ہر صاحب نصاب مسلمان پر اپنے مال کا چالیسواں حصہ یعنی ڈھائی پرسینٹ نکالنا فرض ہے۔ اور اسے نادار، غریب، یتیم اور مستحقین کو ادا کیا جائے۔',
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
                      'مصارفِ زکواۃ',
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
                      'زکواۃ تو بس محتاجوں، مسکینوں، عاملین صدقات اور تالیفِ قلوب کے سزا واروں کے لیے ہے اور اس لیے کہ یہ گردنوں کے چھڑانے، تاوان زدوں کے سنبھالنے، اللہ کی راہ اور مسافروں کی امداد میں خرچ کی جائے۔ یہ اللہ کا مقرر کردہ فریضہ ہے اور اللہ علم والا اور حکمت والا ہے۔(9۔60)',
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
                      'سُبْحٰنَكَ اللّٰهُمَّ وَبِـحَمْدِكَ وَتَـبَارَكَ اسْمُكَ وَتَـعَالٰي جَدُّكَ وَلَآ اِلٰهَ غَيْـرُكَ. اے اللہ! میں تیری حمد کے ساتھ تیری پاکیزگی بیان کرتا ہوں اور تیرا نام بہت بابرکت ہے اور تیری شان بلند ہے اور تیرے سوا کوئی معبود',
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
                      'زکواۃ کی فرضیت',
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
                      'زکواۃ فرض ہونے کے لیے چند شرطیں ہیں',
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
                      'مسلمان ہونا، کافر پر زکواۃ واجب نہیں۔ بالغ ہونا، نابالغ پر زکواۃ فرض نہیں۔ عاقل ہونا، بوہرے(مجنون) پر زکواۃ فرض نہیں جبکہ اسی حال میں سال گزر جائے اور کبھی کبھی اسے افاقہ ہو جاتا ہے تو فرض ہے۔ آزاد ہونا، غلام پر زکواۃ نہیں اگرچہ اس کے مالک نے تجارت کی اجازت دے دی ہو۔ مال بقدرِ نصاب اس کی ملکیت میں ہونا، اگر نصاب سے کم ہے تو زکواۃ نہیں۔ پورے طور پر اس کا مالک ہونا، یعنی اس پر قبضہ بھی ہو۔ نصاب کا دین (قرض) سے فارغ (بچا ہوا) ہونا۔ نصاب کا حاجتِ اصلیہ سے فارغ ہونا۔ مال کا نامی ہونا یعنی بڑھنے والا، خواہ حقیقتاً ہو یا حکماً۔ نصاب پر ایک سال کا مل کا گزر جانا۔(عامۂ کتب)',
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
                      'زکات کے نصاب کی تفصیل یہ ہے',
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
                      'گر کسی کے پاس صرف سونا ہو تو ساڑھے سات تولہ سونا، اور صرف چاندی ہو تو  ساڑھے باون تولہ چاندی،  یا دونوں میں سے کسی ایک کی مالیت کے برابر نقدی  یا سامانِ تجارت ہو ،  یا یہ سب ملا کر یا ان میں سے بعض ملا کر مجموعی مالیت چاندی کے نصاب کے برابر بنتی ہو تو ایسے  شخص پر  سال پورا ہونے پر قابلِ زکات مال کی ڈھائی فیصد زکات ادا کرنا لازم ہے۔',
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
                      'واضح ہوکہ زکات کا مدارصرف ساڑھے سات تولہ سونے پراس وقت ہے کہ جب کسی اور جنس میں سے کچھ پاس نہ ہو، لیکن اگر سونے کے ساتھ ساتھ کچھ اور مالیت بھی ہےتوپھرزکات کی فرضیت کا مدار ساڑھے باون تولہ چاندی پرہوگا۔فقط واللہ اعلم',
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
