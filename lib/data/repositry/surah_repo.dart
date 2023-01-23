import 'package:holy_quran/data/models/ayah.dart';
import 'package:holy_quran/data/models/surah.dart';
import 'package:holy_quran/data/web_services/web_services.dart';

class SurahRepositry{
 final DioHelper dioHelper;

  SurahRepositry(this.dioHelper);
  //  static  List<Surah> surahlist=[];

 
  Future<List<Surah>> getAllSurah()async{
    final surahs = await dioHelper.getAllSurah();
  
    return surahs.map((e) => Surah.fromJson(e)).toList();

  }
  Future<List<Ayah>> getAllAyah({required int number})async{
    final surahs = await dioHelper.getAllAyah(number: number);
  
    return surahs.map((e) => Ayah.fromJson(e)).toList();

  }
}