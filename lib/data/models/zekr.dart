class Zekr {
  int? id;
  String? text;
  int? count;
  String? audio;
  String? filename;

  Zekr({this.id, this.text, this.count, this.audio, this.filename});

  Zekr.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    count = json['count'];
    audio = json['audio'];
    filename = json['filename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['count'] = this.count;
    data['audio'] = this.audio;
    data['filename'] = this.filename;
    return data;
  }
  // Start: Added method
  @override
  String toString() => toJson().toString();
  // End: Added method

}