import 'package:e_recruitment/config/app_colors.dart';
import 'package:flutter/material.dart';

Widget outLineBorderConatiner({
  String title,
  Function onTap,
  double padding,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric( vertical: 5),
      padding: EdgeInsets.symmetric( horizontal: padding ?? 55, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.borderColor, width: 1),
      ),
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17),
      ),
    ),
  );
}
