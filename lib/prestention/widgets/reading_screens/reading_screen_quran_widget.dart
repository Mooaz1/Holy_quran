import 'package:flutter/material.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:holy_quran/logic/cubit/quran_cubit.dart';
import 'package:quran/quran.dart' as quran;


class QuranWidget extends StatelessWidget {
  const QuranWidget({
    Key? key,
    required this.count,
    required this.index,
  }) : super(key: key);

  final int? count;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Directionality(
       textDirection: TextDirection.rtl,
      child: RichText(
        textDirection:TextDirection.rtl ,
        textAlign: count! <= 20 ? TextAlign.center : TextAlign.justify,
        text: TextSpan(
          
          children: [
            for (var i = 1; i <= count!; i++) ...{
              TextSpan(
                text: ' ' +
                    quran.getVerse(index!, i, verseEndSymbol: false) +
                    ' ', 
                    
                    
                    
                style: TextStyle(
    
                  
                 // fontFamily: ArabicFonts.cairoTextTheme().t,
                 fontFamily: 'NotoNastaliqUrdu',
                  fontSize: QuranCubit.get(context).fontSize,
                  color: QuranCubit.get(context).isDark?Colors.white:Colors.black,
                ),
              ),
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Text(
                      '$i',style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      textScaleFactor: i.toString().length <= 2 ? 1 : .8,
                    ),
                    radius: 14,
                  ))
            }
          ],
        ),
      ),
    );
  }
}
