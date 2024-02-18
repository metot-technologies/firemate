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
        height: 152.0,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                        Container(
                          width: 10.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(29, 29, 29, 1),
                              border:
                                  Border.all(color: Colors.white, width: 1.5)),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text("Tertunda", style: TextStyle(color: Colors.white))
                      ],
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 10.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(223, 170, 33, 1),
                              border:
                                  Border.all(color: Colors.white, width: 1.5)),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "Sedang",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 120.0,
                  height: 35.0,
                  child: ElevatedButton(
                      onPressed: () => {},
                      child: Text(
                        "Buka Peta",
                        style: TextStyle(color: Color.fromRGBO(173, 6, 6, 1)),
                      ),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      )))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
