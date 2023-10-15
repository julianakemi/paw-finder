import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paw_finder/cubit/app_cubits.dart';
import 'package:paw_finder/misc/colors.dart';
import 'package:paw_finder/widgets/app_large_text.dart';
import 'package:paw_finder/widgets/app_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  //TODO turn into map
  List images = ["animais1.png", "animais2.png", "animais3.png"];

  List title = ["Adoção", "Animais", "Reporte"];

  List subtitle = ["Responsável", "Perdidos", "Animais encontrados"];

  List text = [
    "Ache animais procurando um novo lar",
    "Ache seu animal perdido",
    "Reporte animais encontrados na rua"
  ];

  List buttonText = ["Adote seu novo amigo", "Encontre seu pet", "Reporte"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/" + images[index]),
                      fit: BoxFit.cover)),
              child: Container(
                  margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(text: title[index]),
                          AppText(text: subtitle[index], size: 30),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 250,
                            child: AppText(text: text[index]),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary400,
                                elevation: 0,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () =>
                                  BlocProvider.of<AppCubits>(context).getData(),
                              child: Text("Começar"))
                        ],
                      ),
                      Column(
                        children: List.generate(
                            3,
                            (indexDots) => Container(
                                  margin: const EdgeInsets.only(bottom: 4),
                                  width: 8,
                                  height: index == indexDots ? 25 : 8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: index == indexDots
                                          ? AppColors.primary400
                                          : AppColors.primary400
                                              .withOpacity(0.3)),
                                )),
                      ),
                    ],
                  )),
            );
          }),
    );
  }
}
