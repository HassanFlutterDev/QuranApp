import 'package:flutter/material.dart';
import 'package:quranapp/constant/constant.dart';

class namaz_e_janaza_screen extends StatefulWidget {
  const namaz_e_janaza_screen({super.key});

  @override
  State<namaz_e_janaza_screen> createState() => _namaz_e_janaza_screenState();
}

class _namaz_e_janaza_screenState extends State<namaz_e_janaza_screen> {
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
            'Namaz-e-Janaza',
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
                      'نماز جنازہ فرض کفایہ ہے، اگر بعض لوگوں نے پڑھ لی تو سب سے فرض ساقط ہو جائے گا لیکن اگر کسی نے بھی نہ پڑھی تو سب گنہگار ہوں گے۔ اس کے ادا کرنے کا طریقہ یہ ہے کہ امام میت کے سینے کے مقابل کھڑا ہو۔ اگر میت بالغ ہو تو اس کی دعائے مغفرت کا ارادہ کرے اور اگر میت نابالغ ہو تو اسے اپنا فرط، اَجر و ذخیر اور شفاعت کرنے والا اور مقبولِ شفاعت بنانے کا ارادہ کرے۔ اس کے بعد نماز جنازہ کا فریضہ ادا کرنے کی نیت اِس طرح کرے : چار تکبیریں نماز جنازہ فرضِ کفایہ، ثنا واسطے اﷲ تعالیٰ کے، درود شریف واسطے حضور نبی اکرم صلی اللہ علیہ وآلہ وسلم کے، دعا واسطے حاضر اس میت کے، منہ طرف کعبہ شریف کے (اور مقتدی یہ بھی کہے:) پیچھے اِس امام کے۔ پھر رفع یدین کے ساتھ تکبیر تحریمہ کرکے زیرِ ناف ہاتھ باندھ لے اور یہ ثنا پڑھے سُبْحَانَکَ اللّٰهُمَّ وَبِحَمْدِکَ، وَتَبَارَکَ اسْمُکَ وَتَعَالٰی جَدُّکَ، وَجَلَّ ثَنَاءُ کَ وَلَا اِلٰهَ غَيْرُکَ.',
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
                      'دوسری تکبیر ہاتھ اٹھائے بغیر کہے اور یہ درود پاک پڑھے',
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
                      'اَللّٰهُمَّ صَلِّ عَلٰی مُحَمَّدٍ وَّعَلٰی آلِ مُحَمَّدٍ، کَمَا صَلَّيْتَ وَسَلَّمْتَ وَبَارَکْتَ وَرَحِمْتَ وَتَرَحَّمْتَ عَلَی إِبْرَاهِيْمَ وَعَلَی آلِ إِبْرَاهِيْمَ، إِنَّکَ حَمِيْدٌ مَّجِيْدٌ.',
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
                      'پھر ہاتھ اٹھائے بغیر تیسری تکبیر کہے اور میت اور تمام مسلمانوں کے لیے دعائے مغفرت کرے۔ بالغ مرد و عورت دونوں کی نمازِ جنازہ کے لیے یہ دعا پڑھے',
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
                      'اَللّٰهُمَّ اغْفِرْ لِحَيِّنَا وَمَيِّتِنَا وَشَاهِدِنَا وَغَائِبِنَا وَصَغِيْرِنَا وَکَبِيْرِنَا وَذَکَرِنَا وَاُنْثَانَا. اَللّٰهُمَّ مَنْ اَحْيَيْتَه مِنَّا فَاَحْيِه عَلَی الْاِسْلَامِ وَمَنْ تَوَفَّيْتَه مِنَّا فَتَوَفَّه عَلَی الإِيْمَانِ.',
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
                      '’’یا اللہ! تو ہمارے زندوں کو بخش اور ہمارے مردوں کو، اور ہمارے حاضر شخصوں کو اور ہمارے غائب لوگوں کو اور ہمارے چھوٹوں کو اور ہمارے بڑوں کو اور ہمارے مردوں کو اور ہماری عورتوں کو۔ یا اللہ! تو ہم میں سے جس کو زندہ رکھے تو اس کو اسلام پر زندہ رکھ اور جس کو ہم میں سے موت دے تو اس کو ایمان پر موت دے۔‘‘اگر نابالغ لڑکے کا جنازہ ہو تو یہ دعا پڑھے',
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
                      'اَللّٰهُمَّ اجْعَلْهُ لَنَا فَرَطاً وَّاجْعَلْهُ لَنَا اَجْرًا وَّذُخْرًا وَاجْعَلْهُ لَنَا شَافِعًا وَّ مُشَفَّعًا.',
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
                      '’’اے اللہ! اس بچہ کو ہمارے لیے منزل پر آگے پہنچانے والا بنا، اسے ہمارے لیے باعثِ اجر اور آخرت کا ذخیرہ بنا، اور اسے ہمارے حق میں شفاعت کرنے والا اور مقبولِ شفاعت بنا۔‘‘',
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
                      'نابالغ لڑکی کا جنازہ ہو تو یہ دعا پڑھے اَللّٰهُمَّ اجْعَلْهَا لَنَا فَرَطاً وَّ اجْعَلْهَا لَنَا اَجْرًا وَّ ذُخْرًا وَّ اجْعَلْهَا لَنَا شَافِعَةً وَّ مُشَفَّعَةً.',
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
                      '’’اے اللہ! اس بچی کو ہمارے لیے منزل پر آگے پہنچانے والا بنا، اسے ہمارے لیے باعثِ اجر اور آخرت کا ذخیرہ بنا، اور اسے ہمارے حق میں شفاعت کرنے والا اور مقبولِ شفاعت بنا۔‘‘اگر کسی کو ان دعاؤں میں سے کوئی دعا یاد نہ ہو تو یہ دعا پڑھ لینی چاہیے',
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
                      'اَللّٰهُمَّ اغْفِرْلَنَا وَلِوَالِدَيْنَا وَ لِلْمُؤْمِنِيْنَ وَالْمُؤْمِنَاتِ. ’’اے اللہ! تو ہمیں ہمارے والدین اور تمام مومن مردوں اور عورتوں کو بخش دے۔‘‘ اگر یہ دعا بھی یاد نہ ہو تو جو دعا یاد ہو وہی پڑھ سکتا ہے۔ پھر چوتھی تکبیر بغیر ہاتھ اٹھائے کہے اور بعد ازاں اَلسَّلَامُ عَلَيْکُمْ وَرَحْمَةُ اﷲِ، اَلسَّلَامُ عَلَيْکُمْ وَرَحْمَةُ اﷲِ کہتے ہوئے دائیں بائیں سلام پھیر دے۔ واللہ و رسولہ اعلم بالصواب۔',
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
