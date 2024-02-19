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

  FireData({this.desc, this.is_done, this.lat, this.lon, this.time});

  FireData.fromJson(Map<dynamic, dynamic> json) {
    desc = json["desc"];
    is_done = json["is_done"];
    lat = json["lat"];
    lon = json["lon"];
    time = json["time"];
  }
}
