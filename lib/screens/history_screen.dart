import 'package:firebase_database/firebase_database.dart';
import 'package:firemate/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  DatabaseReference dbref = FirebaseDatabase.instance.ref();

  List<Fire> historyList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    retrieveFireData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
          padding: EdgeInsets.only(top: 30.0),
          height: MediaQuery.sizeOf(context).height - 290,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(242, 244, 255, 1),
              borderRadius: BorderRadius.circular(16)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 0; i < historyList.length; i++)
                  HistoryCard(historyList[i])
              ],
            ),
          )),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 224,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/history_bg.png"), fit: BoxFit.cover)),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 224,
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.45)),
            ),
            const Center(
              child: Text(
                "History",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'SF pro Display',
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  void retrieveFireData() {
    dbref.child("datas").onChildAdded.listen((data) {
      FireData fireData = FireData.fromJson(data.snapshot.value as Map);
      if (fireData.is_done == true) {
        Fire fire = Fire(key: data.snapshot.key, fireData: fireData);
        historyList.add(fire);
      }
      setState(() {});
    });
  }

  static void navigateTo(double lat, double lon) async {
    var uri = Uri.parse(
        'https://www.google.com/maps/dir/?api=1&destination=$lat,$lon&travelmode=driving');
    if (await canLaunchUrlString(uri.toString())) {
      await launchUrlString(uri.toString());
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }

  Widget HistoryCard(Fire historyData) {
    return Card(
      surfaceTintColor: Colors.white,
      child: Container(
        width: MediaQuery.sizeOf(context).width - 24,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.local_fire_department_sharp,
                  color: historyData.fireData!.desc! == "Tinggi"
                      ? Colors.red[700]
                      : Colors.amber,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  "Kebakaran " + "${historyData.fireData!.desc!}",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "tes",
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                SizedBox(
                  width: 90.0,
                  height: 35.0,
                  child: ElevatedButton(
                      onPressed: () => {
                            navigateTo(
                                double.parse("${historyData.fireData!.lat}"),
                                double.parse("${historyData.fireData!.lon}"))
                          },
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2),
                                      side: const BorderSide(
                                          color: Color.fromRGBO(100, 12, 27, 1),
                                          width: 1.0)))),
                      child: const Text(
                        "Lokasi",
                        style: TextStyle(
                            color: Color.fromRGBO(100, 12, 27, 1),
                            fontSize: 12),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
