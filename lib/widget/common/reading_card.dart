import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/widget/common/style.dart';
import 'package:flutter/material.dart';

Widget readingCard({
  String title,
  String subTitle,
  String imagePath,
  bool isFree = false,
  String perches,
  Function onTap,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
        color: AppColors.textFieldColor,
        boxShadow: newBoxShadow,
        borderRadius: BorderRadius.circular(10)),
    child: ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: TextStyle(color: AppColors.navyBlueColor),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subTitle,
            style: jobTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          isFree == true
              ? Text(
            'FREE',
            style: TextStyle(
              fontSize: 11.5,
              color: AppColors.gradientYellow,
            ),
          )
              : Text(
            '\$ $perches',
            style: TextStyle(
              fontSize: 11.5,
              color: AppColors.gradientRed,
            ),
          ),
        ],
      ),
      leading: Image.asset(imagePath),
      trailing: IconButton(icon: Icon(Icons.auto_stories),color: AppColors.gradientRed,onPressed: onTap,),
    ),
  );
}
