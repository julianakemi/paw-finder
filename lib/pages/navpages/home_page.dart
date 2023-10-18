import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paw_finder/cubit/app_cubit_states.dart';
import 'package:paw_finder/cubit/app_cubits.dart';
import 'package:paw_finder/misc/colors.dart';
import 'package:paw_finder/pages/pet_profile_page.dart';
import 'package:paw_finder/pages/reportpages/report_user_page.dart';
import 'package:paw_finder/widgets/vertical_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is LoadedState) {
        var info = state.pets;
        return ListView(
          children: [
            Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('img/background-blob.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 40,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Image.asset(
                        'img/background-paws.png',
                        height: MediaQuery.of(context).size.width /
                            2.5, // Maintain aspect ratio
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -40,
                    right: 0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Image.asset(
                        'img/banner.png', // Replace with your image
                        height: MediaQuery.of(context).size.width /
                            2, // Maintain aspect ratio
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Encontrou um animal perdido?",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(height: 5),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ReportUserPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0,
                              foregroundColor: AppColors.primary400,
                            ),
                            child: Text("Reporte"),
                          ),
                        ]),
                  )
                ]),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Animais encontrados",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Ver todos",
                        style: TextStyle(color: AppColors.primary400),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: info.length,
                itemBuilder: (context, index) {
                  return Container(
                      padding: EdgeInsets.all(8.0),
                      child: VerticalCard(
                          img: info[index].img,
                          location: info[index].location,
                          date: info[index].color,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    PetProfilePage(petInfo: info[index]),
                              ),
                            );
                          }));
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Animais para adoção",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  TextButton(
                      onPressed: () {},
                      child: Text("Ver todos",
                          style: TextStyle(color: AppColors.primary400)))
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: info.length,
                itemBuilder: (context, index) {
                  return Container(
                      padding: EdgeInsets.all(8.0),
                      child: VerticalCard(
                          img: info[index].img,
                          location: info[index].location,
                          date: info[index].color,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    PetProfilePage(petInfo: info[index]),
                              ),
                            );
                          }));
                },
              ),
            )
          ],
        );
      } else {
        return Container();
      }
    }));
  }
}
