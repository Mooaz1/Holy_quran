





import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:holy_quran/logic/cubit/quran_cubit.dart';

class SetteingsScreen extends StatefulWidget {
  SetteingsScreen({super.key});

  @override
  State<SetteingsScreen> createState() => _SetteingsScreenState();
}

class _SetteingsScreenState extends State<SetteingsScreen> {
  bool isprssed = true;
  bool share_app_press= false;

  @override
  Widget build(BuildContext context) {
     
    
    return BlocConsumer<QuranCubit, QuranState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("settings"),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsetsDirectional.only(
              top: 100,
              start: 30,
              end: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                Center(child: Text("Change Theme Mode",style: TextStyle(color: QuranCubit.get(context).isDark?Colors.white:Colors.black,
                fontSize: 25),)),
                SizedBox(height: 40,),
                Row(
                  children: [
                    Text(QuranCubit.get(context).isDark?"App in dark mode now":"App in light mode now "
                    ,style: TextStyle(
                      color: QuranCubit.get(context).isDark?Colors.white:Colors.black,
                      fontSize: 20
                    ),),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isprssed = !isprssed;
                          QuranCubit.get(context).changeAppTheme();
                          
                        });
                       
                      },
                      child: nuphButton(context,isprssed),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                  Center(child: Text("Change font size",
                  style: TextStyle(
                    color: QuranCubit.get(context).isDark?Colors.white:Colors.black,
                    fontSize: QuranCubit.get(context).fontSize
                  ),)),
                  SizedBox(height: 10,),
                  Slider(value: QuranCubit.get(context).fontSize, 
                  min: 15,
                  max: 40,
                  divisions: 5,
                  activeColor: Colors.purple,
                  inactiveColor: Colors.purple[200],
                  onChanged: ((value) {
                    QuranCubit.get(context).changeFontSize(value);
                  })
                  
                  
                  
                  ),
             
              
              ],
            ),
          ),
        );
      },
    );
  }

  AnimatedContainer nuphButton(BuildContext context,bool isnet) {
    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: isnet ? 10 : 30,
                                offset: isnet ? Offset(-10, -10) : Offset(-28, -28),
                                color:
                                   Colors.black,
                                inset: isnet),
                            BoxShadow(
                                blurRadius: isnet ? 10 : 30,
                                offset: isnet ? Offset(10, 10) : Offset(28, 28),
                                color: Color(0xFFA7A9AF),
                                inset: isnet)
                          ]),
                    );
  }
}
