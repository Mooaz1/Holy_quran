import 'package:flutter/material.dart';
import 'package:holy_quran/logic/cubit/quran_cubit.dart';
import 'package:holy_quran/prestention/screens/reading_screens/quran_reading_page.dart';

class DefultLastRead extends StatelessWidget {
   DefultLastRead({
    required this.number,
    Key? key,
    required this.heigt,
    required this.width,
    required this.image,
    required this.title,
    required this.optionaltext,
    required this.intap
  }) : super(key: key);

  final double heigt;
  final double width;
  int number;
  String image;
  String ?title;
  String optionaltext;
  void Function()? intap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: intap,
     
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Column(
            children: [
              Container(
          height: heigt * .25,
          width: width,
       decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
          image: DecorationImage(  
            image: AssetImage("$image"),
            fit: BoxFit.cover
          )
       ),),
             Row(
              mainAxisAlignment: title!=null? MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
              
              children: [
              
             
             Text("$optionaltext",
              style: TextStyle(color: Colors.black,fontSize:
              title!=null? 
               25:35,
               ),),
              
               Text(title==null?"":   "$title",
              style: TextStyle(color: Colors.black,fontSize: 25),)
              ],
             )
            ],
          ),
        ),
      
    );
  }
}