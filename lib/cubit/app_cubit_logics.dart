import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paw_finder/cubit/app_cubit_states.dart';
import 'package:paw_finder/cubit/app_cubits.dart';
import 'package:paw_finder/misc/colors.dart';
import 'package:paw_finder/pages/main_page.dart';
import 'package:paw_finder/pages/pet_profile_page.dart';
import 'package:paw_finder/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
        if (state is WelcomeState) {
          return WelcomePage();
        }
        if (state is LoadedState) {
          return MainPage();
        }
        if (state is PetProfileState) {
          return PetProfilePage();
        }
        if (state is LoadingState) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: AppColors.primary300,
              color: AppColors.primary500,
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
