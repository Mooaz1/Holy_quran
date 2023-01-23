import 'package:holy_quran/data/models/ayah.dart';

class Surah{
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  int? numberOfAyahs;
  List<Ayah>? ayah;

  Surah(
      {this.number,
      this.name,
      this.englishName,
      this.englishNameTranslation,
      this.revelationType,
      this.numberOfAyahs,
      this.ayah,
      });

  Surah.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    revelationType = json['revelationType'];
    numberOfAyahs = json['numberOfAyahs'];
    if (json['ayahs'] != null) {
      ayah = <Ayah>[];
      json['ayahs'].forEach((v) {
        ayah!.add(new Ayah.fromJson(v));
      });
    }
    
  }
   
    Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['name'] = this.name;
    data['englishName'] = this.englishName;
    data['englishNameTranslation'] = this.englishNameTranslation;
    data['revelationType'] = this.revelationType;
    data['numberOfAyahs'] = this.numberOfAyahs;
    if (this.ayah != null) {
      data['ayahs'] = this.ayah!.map((v) => v.toJson()).toList();
    }
    
    return data;
  }
 // Start: Added method
  @override
  String toString() => toJson().toString();
  // End: Added method

  
}