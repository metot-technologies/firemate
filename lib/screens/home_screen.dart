import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firemate/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../controllers/notification_controller.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseReference dbref = FirebaseDatabase.instance.ref();

  List<Fire> fireList = [];

  @override
  void initState() {
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod);
    super.initState();

    retrieveFireData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
          padding: const EdgeInsets.only(top: 30.0),
          height: MediaQuery.sizeOf(context).height - 290,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(242, 244, 255, 1),
              borderRadius: BorderRadius.circular(16)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 0; i < fireList.length; i++)
                  WarningCard(fireList[i])
              ],
            ),
          )),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 224,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/home_bg.png"), fit: BoxFit.cover)),
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
                "Beranda",
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
      if (fireData.is_done == false) {
        Fire fire = Fire(key: data.snapshot.key, fireData: fireData);
        fireList.add(fire);
      }
      setState(() {
        AwesomeNotifications().createNotification(
            content: NotificationContent(
                id: 1,
                channelKey: "basic_channel",
                title: "Firemate",
                body: "TERJADI KEBAKARAN!"));
      });
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

  Widget WarningCard(Fire fireData) {
    return Card(
      child: Container(
        width: MediaQuery.sizeOf(context).width - 24,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: const DecorationImage(
                image: AssetImage('assets/card_bg.png'), fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Image(image: AssetImage('assets/bell.png')),
                    SizedBox(width: 16.0),
                    Text("Kebakaran!",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0))
                  ],
                ),
                Icon(
                  Icons.more_vert_rounded,
                  color: Colors.white,
                )
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            Text(
              "Terjadi kebakaran pada ${DateFormat('HH:mm WITA, d MMMM y', 'id_ID').format(DateTime.fromMillisecondsSinceEpoch(fireData.fireData!.time! * 1000).toUtc())}. Buka peta untuk mengetahui lokasi!",
              style: const TextStyle(color: Colors.white, fontSize: 12.0),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.local_fire_department_sharp,
                          color: fireData.fireData!.desc! == "Tinggi"
                              ? Colors.red[700]
                              : Colors.amber,
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          fireData.fireData!.desc!,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 90.0,
                      height: 35.0,
                      child: ElevatedButton(
                          onPressed: () => {
                                dbref
                                    .child("datas")
                                    .child(fireData.key!)
                                    .update({"is_done": true}).then((value) {
                                  int index = fireList.indexWhere(
                                      (element) => element.key == fireData.key);
                                  fireList.removeAt(index);
                                  setState(() {});
                                })
                              },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green[700]),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2),
                              ))),
                          child: const Text(
                            "Selesai",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    SizedBox(
                      width: 90.0,
                      height: 35.0,
                      child: ElevatedButton(
                          onPressed: () => {
                                navigateTo(
                                    double.parse("${fireData.fireData!.lat}"),
                                    double.parse("${fireData.fireData!.lon}"))
                              },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ))),
                          child: const Text(
                            "Lokasi",
                            style: TextStyle(
                                color: Color.fromRGBO(173, 6, 6, 1),
                                fontSize: 12),
                          )),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
