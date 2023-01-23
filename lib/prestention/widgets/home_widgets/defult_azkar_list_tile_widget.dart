import 'package:flutter/material.dart';
import 'package:holy_quran/logic/cubit/quran_cubit.dart';
import 'package:holy_quran/prestention/screens/reading_screens/azkar_reading_page.dart';
import 'package:holy_quran/prestention/screens/reading_screens/quran_reading_page.dart';

class DefultAzkarListTile extends StatelessWidget {
  DefultAzkarListTile({
    required this.index,
    required this.name,
    required this.number,
    required this.englishName,
    required this.numberOfAyahs,
    Key? key,
  }) : super(key: key);
  int index;
  int? number;
  String? name;
  String? englishName;
  int? numberOfAyahs;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        QuranCubit.get(context).changeAzkarNumber(index);
        Navigator.push(context, MaterialPageRoute(
          builder: ((context) => 
          AzkarReadingpage(zekr:  QuranCubit.get(context).azkar[index].zekr,
          index:index ,
          ))));
      },
      leading: CircleAvatar(
        backgroundColor: Colors.purple,
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      trailing: numberOfAyahs != null
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("عدد الايات"),
                CircleAvatar(
                  backgroundColor: Colors.purple,
                  radius: 16,
                  child: Text(
                    numberOfAyahs.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          : null,
      title: Center(child: Text(name.toString())),
      subtitle: englishName != null ? Text(englishName.toString()) : null,
    );
  }
}
