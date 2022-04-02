import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/widget/common/style.dart';
import 'package:flutter/material.dart';

Widget examCard({
  String title,
  String description,
  String imagePath,
  bool isText = false,
  String date,
  String time,

}) {
  return Container(
    padding: EdgeInsets.only(top: 20,bottom: 20,left: 20),
    margin: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
    decoration: BoxDecoration(
        color: AppColors.textFieldColor,
        boxShadow: newBoxShadow,
        borderRadius: BorderRadius.circular(30)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: jobTitleStyle,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                    style: jobTextStyle,
                  ),
                  isText == true
                      ? Column(
                        children: [
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Text('Date',style: jobTextStyle,),
                              SizedBox(width: 50,),
                              Text('Time',style: jobTextStyle,),
                            ],
                          ),
                          Row(
                            children: [
                              Text(date,style: TextStyle(color: AppColors.gradientRed,fontSize: 14,fontWeight: FontWeight.bold),),
                              SizedBox(width: 28,),
                              Text(time,style: TextStyle(color: AppColors.gradientRed,fontSize: 14,fontWeight: FontWeight.bold)),
                            ],
                          )
                        ],
                      )
                      : Container()
                ],
              ),
            ),
            Expanded(
                child: Image.asset(
              imagePath,
              height: 125,
            )),
          ],
        ),
      ],
    ),
  );
}
