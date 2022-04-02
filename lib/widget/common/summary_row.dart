import 'package:e_recruitment/config/app_colors.dart';
import 'package:flutter/material.dart';

Widget summaryRow({
  String title,
  Color boxColor,
String question,
}){
  return  Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(right: 10,bottom: 6),
        decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(4)
        ),
        child: Text(question,style: TextStyle(color: AppColors.textFieldColor),),
      ),
      Text(title),
    ],
  );
}