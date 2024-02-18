import 'package:flutter/material.dart';

class WarningCard extends StatefulWidget {
  const WarningCard({super.key});

  @override
  State<WarningCard> createState() => _WarningCardState();
}

class _WarningCardState extends State<WarningCard> {
  @override
  Widget build(BuildContext context) {
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
            Row(
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
            SizedBox(
              height: 12.0,
            ),
            Text(
              "Terjadi kebakaran pada 13:00 WITA, 12 Januari 2024. Buka peta untuk mengetahui lokasi!",
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            ),
            SizedBox(
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
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "Tinggi",
                          style: TextStyle(
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
                          onPressed: () => {},
                          child: Text(
                            "Selesai",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green[700]),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2),
                              )))),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    SizedBox(
                      width: 90.0,
                      height: 35.0,
                      child: ElevatedButton(
                          onPressed: () => {},
                          child: Text(
                            "Lokasi",
                            style: TextStyle(
                                color: Color.fromRGBO(173, 6, 6, 1),
                                fontSize: 12),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          )))),
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
