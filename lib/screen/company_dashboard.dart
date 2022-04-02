import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/screen/admin_results_screen.dart';
import 'package:e_recruitment/screen/main_profile_screen/sub_screens/resume.dart';
import 'package:e_recruitment/screen/main_profile_screen/sub_screens/sub_notification_screen.dart';
import 'package:e_recruitment/screen/selecation_roll/selecation_roll_screen.dart';
import 'package:e_recruitment/screen/start_interview.dart';
import 'package:e_recruitment/screen/video_call.dart';
import 'package:e_recruitment/widget/common/profile_card_view.dart';
import 'package:e_recruitment/widget/common/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompanyDashboard extends StatefulWidget {
  @override
  _CompanyDashboardState createState() => _CompanyDashboardState();
}

class _CompanyDashboardState extends State<CompanyDashboard> {

  List name = ['Schedule', 'Results', 'Notification', 'Services'];
  List image = [
    ImagePath.calender,
    ImagePath.internship,
    ImagePath.notification,
    ImagePath.resume,
  ];
  List routing = [];
  Future<void> onJoin() async {
    // await for camera and mic permissions before pushing video page
    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);
    // push video page with given channel name
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CallPage(
          channelName: "Arpit",
          role: ClientRole.Broadcaster,
        ),
      ),
    );
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }

  @override
  void initState() {
    // TODO: implement initState
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
                        Container(
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
                    // userData != null
                    //     ? Text(
                    //   '${userData.data.name}',
                    //   style: TextStyle(color: AppColors.textFieldColor, fontSize: 16),
                    // )
                    //     :  Container(),
                    // userData != null
                    //     ? Text(
                    //   '${userData.data.email}',
                    //   style: TextStyle(color: AppColors.textFieldColor, fontSize: 16),
                    // )
                    //     : Container(),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              profileCardView(
                                title: name[0],
                                imagePath: image[0],
                                onTap: (){
                                  Get.to(() => StartInterviewScreen());
                                },
                              ),
                              profileCardView(
                                title: name[1],
                                imagePath: image[1],
                                onTap: (){
                                  Get.to(() => AdminResultsScreen());
                                },
                              ),
                            ]),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              profileCardView(
                                title: name[2],
                                imagePath: image[2],
                                onTap: (){
                                  Get.to(() => SubNotificationScreen());
                                },
                              ),
                              profileCardView(
                                title: name[3],
                                imagePath: image[3],
                                onTap: (){
                                  Get.to(() => ServicesScreen());
                                },
                              ),
                            ]),
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
}
