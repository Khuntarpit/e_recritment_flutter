import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/widget/common/style.dart';
import 'package:flutter/material.dart';

Widget commonListView({
  String title,
  String imagePath,
  Function onTap,
  double size,
  bool isShowFillDataTrue = false,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.only(left: 15,right: 15,top: 17, bottom:  size ?? 17),
      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 7.5),
      decoration: BoxDecoration(
          color: AppColors.textFieldColor,
          boxShadow: newBoxShadow,
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          SizedBox(width: 15,),
          Image.asset(
            imagePath,
            fit: BoxFit.contain,
            height: 20,
            width: 20,
          ),
          SizedBox(width: 20,),
          Text(title,style: TextStyle(fontSize: 15.5,color: AppColors.greyColor),),
          Spacer(),
          isShowFillDataTrue == true ? Icon(Icons.check_circle,color: Colors.green,):Container(),
        ],
      ),
    ),
  );
}
