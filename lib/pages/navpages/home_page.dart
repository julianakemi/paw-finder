import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paw_finder/cubit/app_cubit_states.dart';
import 'package:paw_finder/cubit/app_cubits.dart';
import 'package:paw_finder/misc/colors.dart';
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
            Container(
                height: 200,
                alignment: Alignment.centerLeft,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 80, left: 20),
                decoration: BoxDecoration(color: AppColors.primary400),
                child: Row(children: [
                  Column(
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
                             BlocProvider.of<AppCubits>(context)
                            .reportUserInfo();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 0,
                            foregroundColor: AppColors.primary400,
                          ),
                          child: Text("Reporte"),
                        ),
                      ]),
                ])),
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
              height: 360,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: info.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: VerticalCard(
                        location: info[index].location,
                        date: info[index].color),
                  );
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
                      onPressed: () {

                      },
                      child: Text("Ver todos",
                          style: TextStyle(color: AppColors.primary400)))
                ],
              ),
            ),
            SizedBox(
              height: 360,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: info.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () => BlocProvider.of<AppCubits>(context)
                            .petProfilePage(info[index]),
                        child: VerticalCard(
                            location: info[index].location,
                            date: info[index].color)),
                  );
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
