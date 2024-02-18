import 'package:flutter/material.dart';

class HistoryCard extends StatefulWidget {
  const HistoryCard({super.key});

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      child: Container(
        width: MediaQuery.sizeOf(context).width - 24,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kebakaran di Taman Pancing",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "19:49 WITA, 12 Januari 2024",
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                SizedBox(
                  width: 90.0,
                  height: 35.0,
                  child: ElevatedButton(
                      onPressed: () => {},
                      child: Text(
                        "Lokasi",
                        style: TextStyle(
                            color: Color.fromRGBO(100, 12, 27, 1),
                            fontSize: 12),
                      ),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2),
                                      side: BorderSide(
                                          color: Color.fromRGBO(100, 12, 27, 1),
                                          width: 1.0))))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
