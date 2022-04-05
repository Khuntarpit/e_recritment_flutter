import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/screen/main_profile_screen/main_profile_screen.dart';
import 'package:e_recruitment/screen/video_call.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/exam_card.dart';
import 'package:e_recruitment/widget/common/navigate_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class StartInterviewScreen extends StatefulWidget {
  @override
  _StartInterviewScreenState createState() => _StartInterviewScreenState();
}

class _StartInterviewScreenState extends State<StartInterviewScreen> {
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
                      Text("Start Interview",),
                    ],
                  ),
                ],
              ),
              elevation: 0,
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  examCard(
                      title: 'INTERVIEW SCHEDULE',
                      description: 'Reference site about Lorem Ipsum, giving information on its origins, as well as a ... Traductions: Pouvez- .',
                      imagePath: ImagePath.interview,
                      isText: true,
                      date: '05 April',
                      time: '12 AM'
                  ),
                  commonButton(
                      title: 'START INTERVIEW MEETING',
                      isExpand: 40,
                      textSize: 14,
                      onTap: ()async{
                        await _handleCameraAndMic(Permission.camera);
                        await _handleCameraAndMic(Permission.microphone);
                        Get.to(() =>CallPage(          channelName: "Arpit",
                          role: ClientRole.Broadcaster,));
                      }
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
}
