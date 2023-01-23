import 'package:flutter/material.dart';
import 'package:holy_quran/constants.dart';
import 'package:holy_quran/data/models/surah.dart';
import 'package:holy_quran/prestention/widgets/reading_screens/reading_screen_quran_widget.dart';
import 'package:quran/quran.dart' as quran;

class QuranReadingPage extends StatelessWidget {
  final Surah surah;
  final pagestorage;
  QuranReadingPage({required this.surah, required this.pagestorage});
  @override
  Widget build(BuildContext context) {
    int ?count = surah.numberOfAyahs;
    int ?index = surah.number;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 235, 243),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 242, 235, 243),
          elevation: 0,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
            surah.name!,
            style:const TextStyle(
              fontFamily: 'Aldhabi',
              fontSize: 36,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
        ),
          ),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: PageStorage(
          bucket: surahglobalBuket,
          child: SafeArea(
            minimum: const EdgeInsets.all(15),
            child: ListView(
              key: PageStorageKey<int>(pagestorage),
              children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: header(),
              ),
              const SizedBox(
                height: 5,
              ),
              QuranWidget(count: count, index: index),
            ]),
          ),
        ),
      ),
    );
  }

  Widget header() {
    return  const Text(
      ' ' + quran.basmala + ' ',
      textDirection: TextDirection.rtl,
      style: TextStyle(
        fontFamily: 'NotoNastaliqUrdu',
        fontSize: 30,
      ),
      textAlign: TextAlign.center,
    );
  }
}

