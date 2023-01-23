import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran/data/repositry/surah_repo.dart';
import 'package:holy_quran/data/web_services/web_services.dart';
import 'package:holy_quran/logic/bloc_observer/observer.dart';
import 'package:holy_quran/logic/cubit/quran_cubit.dart';
import 'package:holy_quran/prestention/screens/quran_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  late SurahRepositry surahRepositry;
  late QuranCubit quranCubit;
  surahRepositry = SurahRepositry(DioHelper());
  quranCubit = QuranCubit(surahRepositry);

  runApp(
    BlocProvider(
      create: (context) => quranCubit
        ..allSurah()
        ..getAllAyah()
        ..getAllAzkar(),
      child: BlocConsumer<QuranCubit, QuranState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                    backgroundColor: const Color.fromARGB(255, 242, 235, 243),
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Aldhabi',
                      fontStyle: FontStyle.italic,
                      fontSize: 36,
                    ),
                    iconTheme: IconThemeData(
                      //Color.fromARGB(255, 242, 235, 243),
                      color: Colors.purple,
                    )),
                    scaffoldBackgroundColor:  const Color.fromARGB(255, 242, 235, 243),
                    
                    
                    
                    ),
            darkTheme: ThemeData(
                appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.black,
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Aldhabi',
                      fontStyle: FontStyle.italic,
                      fontSize: 36,
                    ),
                    iconTheme: IconThemeData(
                      //Color.fromARGB(255, 242, 235, 243),
                      color: Colors.purple,
                    )),
                    scaffoldBackgroundColor: Colors.black
                    ),
            themeMode: QuranCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            home: QuranScreen(),
          );
        },
      ),
    ),
  );
}
