import 'package:flutter/material.dart';
import 'package:quranapp/constant/constant.dart';

class namaz_screen extends StatefulWidget {
  const namaz_screen({super.key});

  @override
  State<namaz_screen> createState() => _namaz_screenState();
}

class _namaz_screenState extends State<namaz_screen> {
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
            'Namaz',
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
                      ':نماز کا مکمل طریقہ',
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
                      'تکبیرِ تحریمہ',
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
                      'مازی قبلہ رُخ سیدھا کھڑا ہوکر ہاتھوں کو کندھوں یا کانوں تک اٹھاتے ہوئے تکبیرِ تحریمہ کہے اَللّٰہُ اَكْبَرُ اللہ سب سے بڑا ہے۔',
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
                      'تکبیر تہریر کریں۔ دونوں ہاتھوں کو کانوں تک اٹھائیں، اور بلند آواز سے اللہ اکبر کہیں۔',
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
                      'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ (شروع) اللہ کے نام سے جو نہایت رحم کرنے والا، بڑا مہربان ہے۔',
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
                      'اَلْـحَمْدُ لِلّٰهِ رَبِّ الْعٰلَمِيْنَ - ۙالرَّحْمٰنِ الرَّحِيْمِ-  مٰلِكِ يَوْمِ الدِّيْنِ- اِيَّاكَ نَعْبُدُ وَاِيَّاكَ نَسْتَعِيْنُ-  اِھْدِنَا الصِّرَاطَ الْمُسْتَـقِيْمَ- صِرَاطَ الَّذِيْنَ اَنْعَمْتَ عَلَيْهِمْ- غَيْرِ الْمَغْضُوْبِ عَلَيْهِمْ وَلَا الضَّاۗلِّيْنََ تمام تعریفیں اللہ ہی کے لیے ہیں جو پالنے والا ہے تمام جہانوں کا۔ نہایت رحم کرنے والا، بڑا مہربان ہے۔ مالک ہے یومِ جزا کا۔ تیری ہی ہم عبادت کرتے ہیں اور تجھ ہی سے ہم مدد چاہتے ہیں۔ دِکھا ہمیں سیدھا رستہ، ان لوگوں کا رستہ جن پر تو نے انعام کیا، ان کی نہیں جن پر غضب کیا گیا اور نہ گمراہوں کی ۔ قُلْ هُوَ اللّٰهُ اَحَدٌ    -ۚ اَللّٰهُ الصَّمَدُ   -ۚلَمْ يَلِدْ  وَلَمْ يُوْلَدْ  -ۙ وَلَمْ يَكُنْ لَّهٗ كُفُوًا اَحَدٌ  (آپ) کہہ دیجے: وہ اللہ ایک ہے، اللہ بے نیاز ہے، اس کی کوئی اولاد نہیں اور نہ وہ کسی کی اولاد ہے اور نہ اس کا کوئی ہم پلہ ہے۔',
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
                      'رکوع کی دعائیں',
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
                      'رکوع میں جاتے وقت اَللّٰہُ اَکْبَرُ کہیں۔ اَللّٰہُ اَكْبَرُاللہ سب سے بڑا ہے۔سُبْحَانَ رَبِّيَ الْعَظِيْمِپاک ہے میرا رب عظمت والا۔',
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
                      'رکوع سے اٹھنے کی دعائیں',
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
                      'رکوع سے اٹھتے وقت  سمع اللّٰه لمن حمده کہیں۔سَمِعَ اللّٰهُ لِمَنْ حَمِدَهٗ اللہ نے سن لی جس نے اس کیرَبَّنَا وَلَكَ الْحَمْدُ حَمْدًا كَثِيْرًا طَيِّبًا مُّبَارَكًا فِيْهِاے ہمارے رب! تیرے ہی لیے ہر قسم کی تعریف ہے۔ تعریف بہت زیادہ، پاکیزہ جس میں برکت کی گئی ہے۔',
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
                      'سجدے کی دعائیں',
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
                      'سجدے میں جاتے ہوئے اَللّٰہُ اَکْبَرُ کہیں۔سُبْحَانَ رَبِّيَ الْاَعْلٰىپاک ہے میرا رب جو سب سے بلند ہے۔',
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
                      'تشہد اور درود وسلام',
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
                      'لتَّحِيَّاتُ لِلّٰهِ وَالصَّلَوٰتُ وَالطَّـيِّـبَاتُ اَلسَّلَامُ عَلَيْكَ اَيُّـهَا الـنَّبِىُّ وَرَحْمَةُ اللّٰهِ وَبَـرَكَاتُهٗ اَلسَّلَامُ عَـلَـيْـنَا وَعَلٰى عِبَادِ اللّٰهِ الصّٰلِحِيْنَ اَشْهَدُ اَنْ  لَّآ اِلٰهَ اِلَّا اللّٰهُ  وَاَشْهَدُ اَنَّ مُـحَمَّدًا عَـبْدُهٗ وَرَسُوْلُهٗ.(میری) تمام قولی، فعلی اور مالی عبادتیں اللہ ہی کے لیے ہیں، اے نبی! آپ پر سلام ہو اور اللہ کی رحمت اور اس کی برکات ہوں، ہم پر اور اللہ کے (دیگر) نیک بندوں پر بھی سلام ہو، میں گواہی دیتا ہوں کہ اللہ کے سوا کوئی معبود نہیں اور میں گواہی دیتا ہوں کہ محمد صلی اللہ علیہ وآلہ وسلم اس کے بندے اور اس کے رسول ہیں۔ اَللّٰهُمَّ صَلِّ عَلىٰ  مُـحَمَّدٍ وَّ عَليٰٓ  اٰلِ مُـحَمَّدٍ كَمَا صَلَّــيْتَ عَليٰٓ  اِبْـرَاهِيْمَ وَ عَليٰٓ  اٰلِ اِبْـرَاهِيْمَ اِنَّكَ حَمِيْدٌ مَّـجِيْدٌ اَللّٰهُمَّ بَارِكْ عَلىٰ مُـحَمَّدٍ وَّ عَليٰٓ  اٰلِ مُـحَمَّدٍ كَمَا بَارَكْتَ عَليٰٓ  اِبْـرَاهِيْمَ وَ عَليٰٓ اٰلِ  اِبْـرَاهِيْمَ اِنَّكَ حَمِيْدٌ مَّـجِيْدٌ. اے اللہ! رحمت نازل فرما محمد (صلی اللہ علیہ وآلہ وسلم) پر اور آلِ محمد (صلی اللہ علیہ وآلہ وسلم) پر جیسے تونے رحمت نازل فرمائی ابراہیم پر اور آلِ ابراہیم پر، یقیناً تو قابلِ تعریف، بڑی شان والا ہے۔  اے اللہ! برکت نازل فرما محمد (صلی اللہ علیہ وآلہ وسلم) پر اور آلِ محمد (صلی اللہ علیہ وآلہ وسلم) پر جیسے تونے برکت نازل فرمائی ابراہیم پر اور آلِ ابراہیم پر، یقیناً تو قابلِ تعریف، بڑی شان والا ہے۔',
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
                      'رَبِّ ٱجْعَلْنِى',
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
                      'رَبِّ ٱجْعَلْنِى مُقِيمَ ٱلصَّلَوٰةِ وَمِن ذُرِّيَّتِى ۚ رَبَّنَا وَتَقَبَّلْ دُعَآءِ رَبَّنَا ٱغْفِرْ لِى وَلِوَٰلِدَىَّ وَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ ٱلْحِسَابُ',
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
                      'ے میرے رب! مجھے نماز قائم کرنے والا بنا اور میری اولاد کو بھی، اے ہمارے رب! میری دعا قبول فرما اے ہمارے رب! مجھے اور میرے والدین کو اور دیگر مومنوں کو معاف کر دینا جس دن حساب ہونے لگے۔',
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
                      'سلام، تشہد، درود اور دعاؤں سے فارغ ہوکر سلام پھیر دیا جائے۔ پہلے دائیں جانب اور پھر بائیں جانب۔ سلام کے الفاظ یہ ہیں',
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
                      'اَلسَّلَامُ عَلَيْکُمْ وَرَحْمَةُ اللّٰهِسلام ہو تم پر اور رحمت اللہ کی',
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
