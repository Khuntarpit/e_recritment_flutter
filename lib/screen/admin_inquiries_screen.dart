import 'dart:convert';

import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/config/app_constant.dart';
import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/model/cv_model.dart';
import 'package:e_recruitment/model/login_model.dart';
import 'package:e_recruitment/repository/cv_repository.dart';
import 'package:e_recruitment/repository/login_repository.dart';
import 'package:e_recruitment/screen/admin_exam_results_screen.dart';
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
class AdminInquiriesScreen extends StatefulWidget {

  AdminInquiriesScreen();

  @override
  _AdminInquiriesScreenState createState() => _AdminInquiriesScreenState();
}

class _AdminInquiriesScreenState extends State<AdminInquiriesScreen> {
  var userData;

  @override
  void initState() {
    getExamData();
    // TODO: implement initState
    super.initState();
  }
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
                      Text("User Inquiries Details",),
                    ],
                  ),
                ],
              ),
              elevation: 0,
            ),
          ),
          if(userData != null) Expanded(child: ListView.separated(
            padding: EdgeInsets.only(top: 8),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                },
                child: Container(
                  padding: EdgeInsets.only(top: 20,bottom: 20,left: 20),
                  margin: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                  decoration: BoxDecoration(
                      color: AppColors.textFieldColor,
                      boxShadow: newBoxShadow,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Email : ",
                            style: boldStyle,
                          ),
                          Text(
                            "${userData[index]['email'].toString()}",
                            style: jobSubTitle,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Subject : ",
                            style: boldStyle,
                          ),
                          Text(
                            "${userData[index]['subject'].toString()}",
                            style: jobSubTitle,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Description : ",
                            style: boldStyle,
                          ),
                          Text(
                            "${userData[index]['description'].toString()}",
                            style: jobSubTitle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, position) {
              return Divider();
            },
            itemCount: userData.length,
          ),)
        ],
      ),
    );
  }

  getExamData() async {
    var data = await LoginRepository.getInquiryData(context: context);
    setState(() {
      userData = data['data'];
      print(userData);
    });
  }
}
