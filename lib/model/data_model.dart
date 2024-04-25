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
  int? time;
  String? image_url;

  FireData(
      {this.desc, this.is_done, this.lat, this.lon, this.time, this.image_url});

  FireData.fromJson(Map<dynamic, dynamic> json) {
    desc = json["desc"];
    is_done = json["is_done"];
    lat = json["lat"];
    lon = json["lon"];
    time = json["time"];
    image_url = json["image_url"];
  }
}
