import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/config/image_path.dart';
import 'package:flutter/material.dart';

Widget cardView({
  String title,
Function onTap,
}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(ImagePath.upDownArrow,height: 25,),
              SizedBox(width: 30,),
              Text(title),
            ],
          ),
          Icon(Icons.edit,color: AppColors.gradientYellow,)
        ],
      ),
    ),
  );
}