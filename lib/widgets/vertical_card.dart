import 'package:flutter/material.dart';

class VerticalCard extends StatelessWidget {
  final String location;
  final String date;
  final String img;

  const VerticalCard({super.key,
  required this.location,
  required this.date,
  required this.img});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2.3,
        child: Column(
          children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  child: Image.network(img,
                  //TODO implement img from database
                  fit: BoxFit.cover,
                  width: double.infinity,
                  ),
                )
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                      Text("13/10/2023")
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