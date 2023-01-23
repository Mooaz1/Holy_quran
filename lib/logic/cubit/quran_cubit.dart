import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran/data/models/ayah.dart';
import 'package:holy_quran/data/models/azkar.dart';
import 'package:holy_quran/data/models/surah.dart';
import 'package:holy_quran/data/repositry/surah_repo.dart';
import 'package:holy_quran/data/web_services/web_services.dart';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:shared_preferences/shared_preferences.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit(this.surahRepositry) : super(QuranInitial());
  static QuranCubit get(context) => BlocProvider.of(context);
  List<Surah> surahlist = [];
  List<Ayah> ayahlist = [];
  final SurahRepositry surahRepositry;
  int surahnumber = 1;
  void changeSurahNumber(value) {
    surahnumber = value + 1;
    getAllAyah();
    emit(ChangeSurahNumber());
  }
  int azkarnumber=1;
   void changeAzkarNumber(value) {
    azkarnumber = value + 1;
    getAllAyah();
    emit(ChangeAzkarNumber());
  }

  Future<List<Surah>> allSurah() async {
    await surahRepositry.getAllSurah().then((surah) {
      // print(surah[0]);
      surahlist = surah;
      emit(LoadedQuranState(surah: surah));
    });
    return surahlist;
  }

  Future<List<Ayah>> getAllAyah() async {
    await surahRepositry.getAllAyah(number: surahnumber).then((ayah) {
      ayahlist = ayah;
      print(ayahlist);
      emit(LoadedAyahState(ayah: ayah));
    });
    return ayahlist;
  }

  List<Azkar> azkar = [];
  Future<List<Azkar>> getAllAzkar() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/json/azkar.json');
    final list = json.decode(jsondata) as List<dynamic>;
    azkar = list.map((e) => Azkar.fromJson(e)).toList();
    print(azkar[0].zekr![0].text);
    emit(AzkarLoadedState());
    return azkar;
  }

}
