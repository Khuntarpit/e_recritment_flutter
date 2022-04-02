import 'dart:convert';

import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/config/app_constant.dart';
import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/model/cv_model.dart';
import 'package:e_recruitment/model/login_model.dart';
import 'package:e_recruitment/repository/cv_repository.dart';
import 'package:e_recruitment/repository/login_repository.dart';
import 'package:e_recruitment/screen/exam_screen/exam_screen.dart';
import 'package:e_recruitment/screen/interview_schedule_screen/reading_material.dart';
import 'package:e_recruitment/screen/main_profile_screen/sub_screens/resume.dart';
import 'package:e_recruitment/screen/main_profile_screen/sub_screens/sub_history_screen.dart';
import 'package:e_recruitment/screen/main_profile_screen/sub_screens/sub_job_screen.dart';
import 'package:e_recruitment/screen/main_profile_screen/sub_screens/sub_notification_screen.dart';
import 'package:e_recruitment/screen/main_profile_screen/sub_screens/sub_profile_screen.dart';
import 'package:e_recruitment/screen/selecation_roll/selecation_roll_screen.dart';
import 'package:e_recruitment/widget/common/profile_card_view.dart';
import 'package:e_recruitment/widget/common/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class AdminExamResultsScreen extends StatefulWidget {
  var examData;
  AdminExamResultsScreen(this.examData);

  @override
  _AdminExamResultsScreenState createState() => _AdminExamResultsScreenState();
}

class _AdminExamResultsScreenState extends State<AdminExamResultsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [AppColors.gradientYellow, AppColors.gradientRed], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              title: Row(
                children: [
                  SizedBox(
                    width: 7,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("User Exam Results",),
                    ],
                  ),
                ],
              ),
              elevation: 0,
            ),
          ),
          if(widget.examData != null) Expanded(child: ListView.separated(
            padding: EdgeInsets.only(top: 8),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: 5, right: 5,),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(
                  color: AppColors.textFieldColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: newBoxShadow,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5,),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.textFieldColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: newBoxShadow,
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Q.${index+1} ',
                                style: examText,
                              ),
                              Expanded(
                                child: Text(
                                  widget.examData[index]['question'],
                                  maxLines: 3,
                                  style: questionStyle,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5,),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.textFieldColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: newBoxShadow,
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Answer :',
                                style: TextStyle(
                                    fontSize: 15.5,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.redColor),
                              ),
                              Expanded(
                                child: Text(
                                  widget.examData[index]['choice'],
                                  maxLines: 3,
                                  style: questionStyle,
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Correct Answer :',
                                style: TextStyle(
                                    fontSize: 15.5,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.greenColor),
                              ),
                              Expanded(
                                child: Text(
                                  widget.examData[index]['answer'],
                                  maxLines: 3,
                                  style: questionStyle,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, position) {
              return Divider();
            },
            itemCount: widget.examData.length,
          ),)
        ],
      ),
    );
  }

}
