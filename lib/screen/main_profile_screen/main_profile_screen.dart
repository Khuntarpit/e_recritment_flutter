import 'dart:convert';

import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/config/app_constant.dart';
import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/model/cv_model.dart';
import 'package:e_recruitment/model/login_model.dart';
import 'package:e_recruitment/repository/cv_repository.dart';
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
class MainProfileScreen extends StatefulWidget {

  MainProfileScreen();

  @override
  _MainProfileScreenState createState() => _MainProfileScreenState();
}

class _MainProfileScreenState extends State<MainProfileScreen> {
  CvModel userData;

  String cvImage;
  String cvName;
  String phone;
  String address;
  String experience;
  String education;
  String skill;

  List name = ['profile', 'Internship', 'Schedule', 'Services'];
  List image = [
    ImagePath.user,
    ImagePath.internship,
    ImagePath.calender,
    ImagePath.resume,
  ];

  List routing = [];

  List name2 = [
    'Job Opening',
    'Materials',
    'History',
    'Notification',
  ];
  List image2 = [
    ImagePath.job,
    ImagePath.materials,
    ImagePath.history,
    ImagePath.notification,
  ];
  List routing2 = [];

  @override
  void initState() {
    getCvData();
    routing = [
          () async {
        await Get.to(() => SubProfileScreen(
          skill: userData.data.skill,
          education: userData.data.degree,
          phone: userData.data.phone,
          address: userData.data.profileAddress,
          cvImage: userData.data.image[0].url,
          cvName: userData.data.name,
          experience: userData.data.experience,
          isUpdated: (val) {
            if(val == true){
              getCvData();
            }
          },
        ));
      },
          () {
        Get.to(() => InternShipScreen(
          internShip: true,
          cvImage: userData.data.image[0].url,
          phone: userData.data.phone,
          name: userData.data.name,
        ));
      },
          () {
        Get.to(() => ExamScreen(
          cvImage: userData.data.image[0].url,
          phone: userData.data.phone,
          name: userData.data.name,
        ));
      },
          () {
        Get.to(() => ServicesScreen());
      },
    ];
    routing2 = [
          () {
        Get.to(() => InternShipScreen(
          cvImage: userData.data.image[0].url,
          phone: userData.data.phone,
          name: userData.data.name,
        ));
      },
          () {
        Get.to(() => ReadingMaterial());
      },
          () {
        Get.to(() => HistoryScreen());
      },
          () {
        Get.to(() => SubNotificationScreen());
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  gradient: LinearGradient(colors: [
                    AppColors.gradientYellow,
                    AppColors.gradientRed,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 70,
                        ),
                        /*cvImage == null
                            ? Container(
                                margin: EdgeInsets.only(top: 40),
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: newBoxShadow,
                                  image: DecorationImage(
                                    image: AssetImage(ImagePath.profileImage),
                                  ),
                                ),
                              )
                            : cvImage != null
                                ? Container(
                                    margin: EdgeInsets.only(top: 40),
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: newBoxShadow,
                                      image: DecorationImage(image: NetworkImage(cvImage), fit: BoxFit.cover),
                                    ),
                                  )
                                : widget.user != null
                                    ? Container(
                                        margin: EdgeInsets.only(top: 40),
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: newBoxShadow,
                                          image: DecorationImage(image: NetworkImage(widget.user.photoURL), fit: BoxFit.cover),
                                        ),
                                      )
                                    : Container(
                                        margin: EdgeInsets.only(top: 40),
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: newBoxShadow,
                                          image: DecorationImage(
                                            image: AssetImage(ImagePath.profileImage),
                                          ),
                                        ),
                                      ),*/
                        userData != null
                            ? Container(
                                margin: EdgeInsets.only(top: 40),
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: newBoxShadow,
                                  image: DecorationImage(image: NetworkImage(userData.data.image[0].url), fit: BoxFit.cover),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.only(top: 40),
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: newBoxShadow,
                                  image: DecorationImage(
                                    image: AssetImage(ImagePath.profileImage),
                                  ),
                                ),
                              ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: IconButton(
                              icon: Icon(
                                Icons.logout,
                                color: AppColors.backGroundColor,
                              ),
                              onPressed: () async {
                                SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                sharedPreferences.clear();
                                Get.off(SelectionRoll());
                              }),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    userData != null
                        ? Text(
                            '${userData.data.name}',
                            style: TextStyle(color: AppColors.textFieldColor, fontSize: 16),
                          )
                        :  Container(),

                    /*userData != null
                        ? Text(
                            '${userData.userName}',
                            style: TextStyle(color: AppColors.textFieldColor, fontSize: 16),
                          )
                        : Container(),*/

                    userData != null
                        ? Text(
                            '${userData.data.email}',
                            style: TextStyle(color: AppColors.textFieldColor, fontSize: 16),
                          )
                        : Container(),

                    /*userData != null
                        ? widget.user != null
                            ? Text(
                                widget.user.email,
                                style: TextStyle(color: AppColors.textFieldColor, fontSize: 16),
                              )
                            : Text(
                                '${userData.email}',
                                style: TextStyle(color: AppColors.textFieldColor, fontSize: 16),
                              )
                        : Container(),*/
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              4,
                              (index) => profileCardView(
                                title: name[index],
                                imagePath: image[index],
                                onTap: routing[index],
                              ),
                            )),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              4,
                              (index) => profileCardView(
                                title: name2[index],
                                imagePath: image2[index],
                                onTap: routing2[index],
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  getCvData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var cvId = json.decode(sharedPreferences.get(PrefString.loginModel));
    print(cvId['_id']);
    userData = await CvRepository.getData(context: context, cvId: cvId['_id']);
    setState(() {
      cvImage = userData.data.image[0].url;
      cvName = userData.data.name;
      phone = userData.data.phone;
      address = userData.data.profileAddress;
      experience = userData.data.experience;
      education = education;
      skill = userData.data.skill;
    });
  }
}
