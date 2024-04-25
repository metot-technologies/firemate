class Fire {
  String? key;
  FireData? fireData;

  Fire({this.fireData, this.key});
}

class FireData {
  String? desc;
  bool? is_done;
  String? lat;
  String? lon;
  String? time;
  String? image_url;
  String? filler;

  FireData(
      {this.desc,
      this.is_done,
      this.lat,
      this.lon,
      this.time,
      this.image_url,
      this.filler});

  FireData.fromJson(Map<dynamic, dynamic> json) {
    desc = json["desc"];
    is_done = json["is_done"];
    lat = json["lat"];
    lon = json["lon"];
    time = json["time"];
    image_url = json["image_url"];
    filler = json["filler"] ?? 0;
  }
}
