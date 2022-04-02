import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/widget/common/style.dart';
import 'package:flutter/material.dart';

Widget profileCardView({
  String imagePath,
  String title,
  Function onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: AppColors.textFieldColor,
        boxShadow: newBoxShadow,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 30,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    ),
  );
}
