import 'package:holy_quran/data/models/zekr.dart';

class Azkar {
  int? id;
  String? category;
  String? audio;
  String? filename;
  List<Zekr>? zekr;

  Azkar({this.id, this.category, this.audio, this.filename, this.zekr});

  Azkar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    audio = json['audio'];
    filename = json['filename'];
    if (json['array'] != null) {
      zekr = <Zekr>[];
      json['array'].forEach((v) {
        zekr!.add(new Zekr.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['audio'] = this.audio;
    data['filename'] = this.filename;
    if (this.zekr != null) {
      data['array'] = this.zekr!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  // Start: Added method
  @override
  String toString() => toJson().toString();
  // End: Added method

}