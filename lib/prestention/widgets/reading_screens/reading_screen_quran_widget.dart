import 'package:flutter/material.dart';
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
    return RichText(
      textAlign: count! <= 20 ? TextAlign.center : TextAlign.justify,
      text: TextSpan(
        
        children: [
          for (var i = 1; i <= count!; i++) ...{
            TextSpan(
              text: ' ' +
                  quran.getVerse(index!, i, verseEndSymbol: false) +
                  ' ', 
              style:const TextStyle(
                
                fontFamily: 'Kitab',
                fontSize: 25,
                color: Colors.black87,
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
    );
  }
}
