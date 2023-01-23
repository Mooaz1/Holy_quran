// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quran_cubit.dart';

@immutable
abstract class QuranState {}

class QuranInitial extends QuranState {}
class LoadedQuranState extends QuranState {
  List<Surah> surah;
  LoadedQuranState({
    required this.surah,
  });

}
class LoadedAyahState extends QuranState {
  List<Ayah> ayah;
  LoadedAyahState({
    required this.ayah,
  });
  
}

class ChangeSurahNumber extends QuranState{}
class ChangeAzkarNumber extends QuranState{}

class AzkarLoadedState extends QuranState{}
class SharedPreferencesState extends QuranState{}

