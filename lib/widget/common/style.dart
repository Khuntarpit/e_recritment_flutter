import 'package:e_recruitment/config/app_colors.dart';
import 'package:flutter/material.dart';

List<BoxShadow> newBoxShadow = [
  BoxShadow(
      color: Colors.black12,
      spreadRadius: 1,
      blurRadius: 10,
      offset: Offset(8, 8)),
];

final jobTextStyle = TextStyle(
  fontSize: 11.5,
  color: AppColors.navyBlueColor,
);

final jobTitleStyle = TextStyle(
  fontSize: 20,
  color: AppColors.navyBlueColor,
  fontWeight: FontWeight.bold,
);

final profileTitleStyle = TextStyle(
  fontSize: 18,
  color: AppColors.navyBlueColor,
  fontWeight: FontWeight.bold,
);

final jobSubTitle = TextStyle(
  fontSize: 13,
  color: AppColors.navyBlueColor,
);

final smallText = TextStyle(
  fontSize: 10.5,
  color: AppColors.navyBlueColor,
);

final boldStyle = TextStyle(
    fontSize: 15, color: AppColors.navyBlueColor, fontWeight: FontWeight.bold);

final questionStyle = TextStyle(fontSize: 17, color: AppColors.navyBlueColor);

final examText = TextStyle(
    fontSize: 15.5,
    fontWeight: FontWeight.bold,
    color: AppColors.navyBlueColor);
