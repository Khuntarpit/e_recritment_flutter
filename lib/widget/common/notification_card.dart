import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/widget/common/style.dart';
import 'package:flutter/material.dart';

Widget notificationCard({
  bool isSelect = false,
}){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 13,vertical: 5),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: AppColors.textFieldColor,
      borderRadius: BorderRadius.circular(25),
      boxShadow: newBoxShadow,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(ImagePath.appbar_image,height: 90,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 18,),
            Text('Alex John',style: jobTitleStyle,),
            Text(
              'Googleasiant Technolabs',
              style: jobTextStyle,
            ),
            SizedBox(height: 8,),
            isSelect == true ? Text('SELECTED',style: TextStyle(color: Colors.green,fontSize: 11.5,),)
            : Text('NOT SELECTED',style: TextStyle(color: AppColors.gradientRed,fontSize: 11.5,),),
          ],
        ),
        Spacer(),
        isSelect == true ? Icon(Icons.check_circle,color: Colors.green,)
            : Icon(Icons.cancel,color: AppColors.gradientRed,),
      ],
    ),
  );
}