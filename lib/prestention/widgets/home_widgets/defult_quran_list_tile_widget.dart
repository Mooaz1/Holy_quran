import 'package:flutter/material.dart';
import 'package:holy_quran/logic/cubit/quran_cubit.dart';
import 'package:holy_quran/prestention/screens/reading_screens/quran_reading_page.dart';

class DefultQuranListTile extends StatelessWidget {
   DefultQuranListTile({
    required this.index,
    required this.name,
    required this.number,
    required this.englishName,
    required this.numberOfAyahs,
    Key? key,
  }) : super(key: key);
  int index;
   int ?number;
  String ?name;
  String ? englishName;
  int ? numberOfAyahs;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        QuranCubit.get(context).changeSurahNumber(index);
        Navigator.push(context, MaterialPageRoute(
          builder: ((context) => 
          QuranReadingPage(surah:  QuranCubit.get(context).surahlist[index],
          pagestorage: QuranCubit.get(context).surahlist[index].number,))));
      },
      leading: CircleAvatar(
        backgroundColor: Colors.purple,
        child: Center(
          child:
              Text( number.toString(),style: TextStyle(color: Colors.white),),
        ),
      ),
      trailing: numberOfAyahs!=null? Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("عدد الايات"),
          CircleAvatar(
            backgroundColor: Colors.purple,
            radius: 16,
            child: Text(numberOfAyahs
                .toString(),style: TextStyle(color: Colors.white),),
          ),
        ],
      ):null,
      title: Center(child: Text( name.toString(),style:const TextStyle(
                fontFamily: 'Aldhabi',
                fontSize: 30,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),)),
      subtitle:
       englishName!=null?   Center(child: Text( englishName.toString(),style:const TextStyle(
                fontFamily: 'Aldhabi',
                fontSize: 20,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),)):null,
    );
  }
}
