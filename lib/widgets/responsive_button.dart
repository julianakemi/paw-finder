import 'package:flutter/material.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  String? text;
  IconData? icon;
  double height;
  bool? isIcon;
  Color backgroundColor;
  Color textColor;

  AppButton({Key? key,
    this.isIcon=false,
    this.text="Button",
    this.icon,
    this.height = 50,
    this.backgroundColor = const Color(0xFF5d72db),
    this.textColor = Colors.white,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor),
      child: isIcon==false?Center(child: AppText(text: text!, color: textColor)):Center(child: Icon(icon, color:Colors.white)),
    );
  }
}