
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran/constants.dart';
import 'package:holy_quran/data/models/zekr.dart';
import 'package:holy_quran/logic/cubit/quran_cubit.dart';
import 'package:holy_quran/prestention/widgets/home_widgets/defult_last_read_widget.dart';

class AzkarReadingpage extends StatefulWidget {
  AzkarReadingpage({super.key, required this.index, required this.zekr,});
  int index;
  List<Zekr>? zekr;

  @override
  State<AzkarReadingpage> createState() => _AzkarReadingpageState();
}

class _AzkarReadingpageState extends State<AzkarReadingpage> {
  List<int?> list=[];
  int zekrcount=0;
  @override
  Widget build(BuildContext context) {
    final heigt = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocConsumer<QuranCubit, QuranState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
        appBar: PreferredSize(
          preferredSize:Size.fromHeight(100),
          child: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
              QuranCubit.get(context).azkar[widget.index].category.toString(),
              
          ),
            ),
          ),
        ),
            body: Column(
                    children: [
            DefultLastRead(heigt: heigt,
                     width: width,
                     number:QuranCubit.get(context).azkarnumber ,
                     image: "assets/images/azkar.jpeg",
                     title: "",
                  
                     optionaltext:QuranCubit.get(context).azkar[QuranCubit.get(context).azkarnumber-1].category.toString(),
                     intap: () {
                       
                     },
                     ),
            SizedBox(
              height: heigt * .1,
            ),
            Expanded(
                child: ListView.separated(
                 
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                           list.add(widget.zekr![index].id);
                          
                          });
                           print(list);
                        },
                        child: Container(
                         
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      widget.zekr![index].text.toString(),
                                      style: TextStyle(
                                        fontFamily: 'Kitab',
                                        fontSize: 20,
                                        color: QuranCubit.get(context).isDark?Colors.white:Colors.black,
                                      ),
                                    ),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.purple,
                                    child: Text(widget.zekr![index].id.toString()),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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
                    itemCount: widget.zekr!.length))
                    ],
                  ));
      },
    );
  }
}
