import 'package:flutter/material.dart';
import 'package:paw_finder/misc/colors.dart';

class HorizontalCard extends StatelessWidget {
  final String location;
  final String date;
  final String breed;
  final String gender;
  final String img;

  const HorizontalCard(
      {super.key,
      required this.location,
      required this.date,
      required this.breed,
      required this.gender,
      required this.img});

  Icon getGenderIcon() {
    if (gender == "Fêmea") {
      return Icon(Icons.female, size: 30, color: AppColors.primary400);
    } else if (gender == "Macho") {
      return Icon(Icons.male, size: 30, color: AppColors.primary400);
    }
    return Icon(Icons.pets, size: 30, color: AppColors.primary400);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 150,
        width: double.infinity,
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    child: Image.network(
                      img,
                      //TODO add image
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  )),
            ),
            Flexible(
              flex: 3,
              child: Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  breed,
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              getGenderIcon(),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.calendar_month_outlined),
                              Flexible(
                                child: Text(
                                  "13/10/2023",
                                  softWrap: true,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [Icon(Icons.place_outlined), Flexible(child: Text(location,softWrap: true ))],
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
