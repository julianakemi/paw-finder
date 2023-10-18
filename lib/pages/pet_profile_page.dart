import 'package:flutter/material.dart';
import 'package:paw_finder/misc/colors.dart';
import 'package:paw_finder/model/pet_model.dart';
import 'package:paw_finder/widgets/information_box.dart';

class PetProfilePage extends StatelessWidget {
  final Pet petInfo;

  const PetProfilePage({super.key, required this.petInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(petInfo.img), fit: BoxFit.cover),
                    ),
                  )),
              Positioned(
                  left: 20,
                  top: 30,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
              Positioned(
                top: 320,
                child: Container(
                  padding: EdgeInsets.only(top: 30, left: 16, right: 16),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              InformationBox(
                                  label: "Raça", value: petInfo.breed),
                              InformationBox(
                                  label: "Porte", value: petInfo.size),
                              InformationBox(
                                  label: "Sexo", value: petInfo.gender),
                              InformationBox(label: "Cor", value: petInfo.color)
                            ],
                          ),
                          SizedBox(
                            height: 26,
                          ),
                          Row(
                            children: [
                              Icon(Icons.place_outlined,
                                  color: AppColors.primary400),
                              Text(
                                petInfo.location,
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(petInfo.description, softWrap: true),
                          SizedBox(
                            height: 20,
                          ),
                          //TODO implement date from database
                          Text("Reportado em 13 de Julho de 2023"),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(right: 14),
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: AppColors.primary400),
                                    child: Icon(Icons.person,
                                        color: Colors.white, size: 28)),
                                Column(
                                  children: [
                                    Text("Reportado por"),
                                    Text("Mario Costa",
                                        softWrap: true,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600))
                                  ],
                                ),
                              ],
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary400,
                                    elevation: 0,
                                    foregroundColor: Colors.white),
                                onPressed: () {
                                  //TODO Exibir informações de contato
                                },
                                child: Text("Contato"))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
