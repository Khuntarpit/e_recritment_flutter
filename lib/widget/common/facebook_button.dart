import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/widget/common/style.dart';
import 'package:flutter/material.dart';

Widget googleButton({
  String title,
  Color textColor,
  Function onTap,
  Function onTap2,
  String imagePath,
  bool isText = false,
}) {
  return isText != true ? GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      decoration: BoxDecoration(
          color: AppColors.textFieldColor,
          boxShadow: newBoxShadow,
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 23,
          ),
          SizedBox(
            width: 15,
          ),
          Text('Sign up with',
              style: TextStyle(
                fontSize: 15,
              )),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: textColor),
          ),
        ],
      ),
    ),
  ):GestureDetector(
    onTap: onTap2,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      margin: EdgeInsets.symmetric( horizontal: 20,vertical: 7),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.textFieldColor,
          boxShadow: newBoxShadow,
          borderRadius: BorderRadius.circular(30)),
      child: Center(child: Text("I'll use my email and password",style: TextStyle(fontSize: 16),)),
    ),
  );
}
