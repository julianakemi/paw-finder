import 'package:flutter/material.dart';
import 'package:paw_finder/misc/colors.dart';

class InformationBox extends StatelessWidget {
  final String label;
  final String value;
  InformationBox({super.key,
  required this.label,
  required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: EdgeInsets.only(right: 10),
          height: 84,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primary300.withOpacity(0.25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(label, style: TextStyle(
                color: AppColors.primary500,
                fontWeight: FontWeight.w600
              ),)
            ],
          )),
    );
  }
}
