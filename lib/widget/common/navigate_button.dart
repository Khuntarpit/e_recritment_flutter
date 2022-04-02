import 'package:e_recruitment/config/app_colors.dart';
import 'package:flutter/material.dart';

Widget commonButton({
  String title,
  Function onTap,
  double isExpand,
  double isExpandHeight,
  double textSize,
  double marginHorizontal,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: marginHorizontal ?? 15, vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: isExpand ?? 40, vertical: isExpandHeight ?? 17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
            colors: [AppColors.gradientRed, AppColors.gradientYellow]),
      ),
      child: Center(
        child: Text(
          title,maxLines: 1,
          style: TextStyle(
              color: AppColors.textFieldColor,
              fontWeight: FontWeight.bold,
              fontSize: textSize ?? 17),
        ),
      ),
    ),
  );
}
