import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
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
    dbref.child("datas/").onChildAdded.listen((data) {
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
    final int timestamp = int.parse(fireData.fireData!.time!);
    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    final formattedDateTime = DateFormat.yMMMMd('id_ID').format(dateTime);
    final formattedHour = DateFormat.Hm().format(dateTime);

    return Card(
      child: Column(
        children: [
          TextButton(
            style: TextButton.styleFrom(
                padding: EdgeInsets.zero, backgroundColor: Colors.white),
            onPressed: () => showDialog(
              barrierColor: Color.fromARGB(206, 0, 0, 0),
              context: context,
              builder: (BuildContext context) => AlertDialog(
                contentPadding: EdgeInsets.all(0),
                surfaceTintColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 180.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                fireData.fireData!.image_url!,
                              ),
                              fit: BoxFit.cover)),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          decoration: BoxDecoration(color: Colors.white),
                          child: Center(
                            child: Text(
                              "tutup",
                              style: TextStyle(
                                  color: const Color.fromARGB(174, 0, 0, 0),
                                  fontSize: 12.0),
                            ),
                          )),
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                    ),
                  ],
                ),
              ),
            ),
            child: Container(
                width: MediaQuery.sizeOf(context).width - 24,
                height: 100.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8)),
                    image: DecorationImage(
                        image: NetworkImage(
                          fireData.fireData!.image_url!,
                        ),
                        fit: BoxFit.cover)),
                child: Container(
                  width: MediaQuery.sizeOf(context).width - 24,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(104, 0, 0, 0),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8)),
                  ),
                  child: Center(
                      child: Text(
                    "klik untuk melihat gambar lebih jelas",
                    style: TextStyle(
                        color: const Color.fromARGB(148, 255, 255, 255),
                        fontSize: 12.0),
                  )),
                )),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width - 24,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8)),
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
                  "Terjadi kebakaran pada $formattedHour WITA, $formattedDateTime. Buka peta untuk mengetahui lokasi!",
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
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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
                              onPressed: () async {
                                if (await confirm(
                                  context,
                                  title: const Text('Konfirmasi Status'),
                                  content: const Text(
                                      'tekan selesai untuk menyelesaikan kasus'),
                                  textOK: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 20.0),
                                    decoration: BoxDecoration(
                                        color: Colors.green[700],
                                        borderRadius:
                                            BorderRadius.circular(2.0)),
                                    child: Text(
                                      'selesai',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  textCancel: Text(
                                    'batal',
                                    style: TextStyle(color: Colors.red[900]),
                                  ),
                                )) {
                                  dbref
                                      .child("datas")
                                      .child(fireData.key!)
                                      .update({"is_done": true}).then((value) {
                                    int index = fireList.indexWhere((element) =>
                                        element.key == fireData.key);
                                    fireList.removeAt(index);
                                    setState(() {});
                                  });
                                }
                                return;
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.green[700]),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2),
                                  ))),
                              child: const Text(
                                "Selesai",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
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
                                        double.parse(
                                            "${fireData.fireData!.lat}"),
                                        double.parse(
                                            "${fireData.fireData!.lon}"))
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
        ],
      ),
    );
  }
}
