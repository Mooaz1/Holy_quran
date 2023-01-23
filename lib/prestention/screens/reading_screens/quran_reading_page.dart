import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran/constants.dart';
import 'package:holy_quran/data/models/surah.dart';
import 'package:holy_quran/logic/cubit/quran_cubit.dart';
import 'package:holy_quran/prestention/widgets/reading_screens/reading_screen_quran_widget.dart';
import 'package:quran/quran.dart' as quran;

class QuranReadingPage extends StatelessWidget {
  final Surah surah;
  final pagestorage;
  QuranReadingPage({required this.surah, required this.pagestorage});
  @override
  Widget build(BuildContext context) {
    int? count = surah.numberOfAyahs;
    int? index = surah.number;
    return BlocConsumer<QuranCubit, QuranState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: AppBar(
              elevation: 0,
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  surah.name!,
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
                child:
                    ListView(key: PageStorageKey<int>(pagestorage), children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: header(context),
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
      },
    );
  }

  Widget header(context) {
    return Text(
      ' ' + quran.basmala + ' ',
      textDirection: TextDirection.rtl,
      style: TextStyle(
          fontFamily: 'NotoNastaliqUrdu',
          fontSize: 30,
          color: QuranCubit.get(context).isDark ? Colors.white : Colors.black),
      textAlign: TextAlign.center,
    );
  }
}
