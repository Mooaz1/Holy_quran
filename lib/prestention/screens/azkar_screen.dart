import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran/logic/cubit/quran_cubit.dart';
import 'package:holy_quran/prestention/widgets/home_widgets/defult_azkar_list_tile_widget.dart';
import 'package:holy_quran/prestention/widgets/home_widgets/defult_last_read_widget.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final heigt = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocConsumer<QuranCubit, QuranState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return QuranCubit.get(context).azkar.length>0? Scaffold(
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
                ),
              backgroundColor: const Color.fromARGB(255, 242, 235, 243),
                body: Column(
                  children: [
                    DefultLastRead(heigt: heigt,
                     width: width,
                     number:QuranCubit.get(context).azkarnumber ,
                     image: "assets/images/azkar.jpeg",
                     title: null,
                   
                     optionaltext:QuranCubit.get(context).azkar[QuranCubit.get(context).azkarnumber-1].category.toString(),
                     intap: () {
                       
                     },
                     ),
                    SizedBox(
                      height: heigt * .05,
                    ),
                    Expanded(
                    
                      child: 
                 
                      Container(
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                            itemBuilder: ((context, index) {
                              return DefultAzkarListTile(
                                index: index,
                                name: QuranCubit.get(context).azkar[index].category.toString(),
                                number: QuranCubit.get(context).azkar[index].id,
                                numberOfAyahs:null,
                                englishName: null,
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
                            itemCount:  QuranCubit.get(context).azkar.length),
                      ),
                    )
                  ],
                ),
              ):Center(child: CircularProgressIndicator(),);
      },
    );
  }
}
