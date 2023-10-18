import 'package:flutter/material.dart';
import 'package:paw_finder/misc/colors.dart';
import 'package:paw_finder/pages/navpages/adoption_page.dart';
import 'package:paw_finder/pages/navpages/home_page.dart';
import 'package:paw_finder/pages/navpages/search_page.dart';
import 'package:paw_finder/pages/navpages/user_profile.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    AdoptionPage(),
    SearchPage(),
    UserProfile()
  ];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: AppColors.primary400,
        unselectedItemColor: Colors.black38,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label:"Home", icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label:"Adoção", icon: Icon(Icons.pets)),
          BottomNavigationBarItem(label:"Encontrados", icon: Icon(Icons.search)),
          BottomNavigationBarItem(label:"Meu perfil", icon: Icon(Icons.person)),
        ]
      ),
    ) ;
  }
}