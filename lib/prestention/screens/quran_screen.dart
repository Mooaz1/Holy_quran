import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran/logic/cubit/quran_cubit.dart';
import 'package:holy_quran/prestention/screens/azkar_screen.dart';
import 'package:holy_quran/prestention/screens/reading_screens/quran_reading_page.dart';
import 'package:holy_quran/prestention/widgets/home_widgets/defult_last_read_widget.dart';
import 'package:holy_quran/prestention/widgets/home_widgets/defult_quran_list_tile_widget.dart';

class QuranScreen extends StatefulWidget {
  QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final heigt = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocConsumer<QuranCubit, QuranState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return (QuranCubit.get(context).surahlist.length > 0)
            ? Scaffold(
                appBar: AppBar(
                  backgroundColor: const Color.fromARGB(255, 242, 235, 243),
                  elevation: 0,
                  title: const Text(
                    "Holy Quran",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Aldhabi',
                      fontStyle: FontStyle.italic,
                      fontSize: 36,
                    ),
                  ),
                  centerTitle: true,
                  actions: [
                    IconButton(onPressed: (){}, icon:const Icon(Icons.dark_mode_outlined)),
                    IconButton(onPressed: (){}, icon:const Icon(Icons.font_download_sharp))
                  ],
                ),
                backgroundColor: const Color.fromARGB(255, 242, 235, 243),
                body: Column(
                  children: [
                    DefultLastRead(
                      heigt: heigt,
                      width: width,
                      number: QuranCubit.get(context).surahnumber,
                      image: "assets/images/quran_image.jpg",
                      title: QuranCubit.get(context)
                          .surahlist[QuranCubit.get(context).surahnumber - 1]
                          .name
                          .toString(),
                      optionaltext: "اخر سوره تمت قرأتها",
                      intap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => QuranReadingPage(
                                      surah: QuranCubit.get(context).surahlist[
                                          QuranCubit.get(context).surahnumber -
                                              1],
                                      pagestorage: QuranCubit.get(context)
                                          .surahlist[QuranCubit.get(context)
                                                  .surahnumber -
                                              1]
                                          .number,
                                    ))));
                      },
                    ),
                    SizedBox(
                      height: heigt * .05,
                    ),
                    Expanded(
                      child: Container(
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: ((context, index) {
                              return DefultQuranListTile(
                                index: index,
                                name: QuranCubit.get(context)
                                    .surahlist[index]
                                    .name
                                    .toString(),
                                number: QuranCubit.get(context)
                                    .surahlist[index]
                                    .number,
                                numberOfAyahs: QuranCubit.get(context)
                                    .surahlist[index]
                                    .numberOfAyahs,
                                englishName: QuranCubit.get(context)
                                    .surahlist[index]
                                    .englishName
                                    .toString(),
                              );
                            }),
                            separatorBuilder: ((context, index) {
                              return const Padding(
                                padding: EdgeInsetsDirectional.only(start: 10),
                                child: Divider(
                                  color: Colors.black,
                                ),
                              );
                            }),
                            itemCount:
                                QuranCubit.get(context).surahlist.length),
                      ),
                    )
                  ],
                ),
                floatingActionButton: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => AzkarScreen())));
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage("assets/images/azkar.jpeg"),
                            fit: BoxFit.cover),
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ))
            : const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
      },
    );
  }
}
