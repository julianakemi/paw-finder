import 'package:flutter/material.dart';

class VerticalCard extends StatelessWidget {
  final String location;
  final String date;
  final Image? img;

  const VerticalCard({super.key,
  required this.location,
  required this.date,
  this.img});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 220,
        child: Column(
          children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  child: Image.asset("img/dog1.jpg",
                  //TODO implement img from database
                  fit: BoxFit.cover,
                  width: double.infinity,
                  ),
                )
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.place_outlined),
                      Text(location)
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.calendar_month_outlined),
                      Text(date)
                    ],
                  )
              ],)
            )
          ],
        ),
      ),
    );
  }
}