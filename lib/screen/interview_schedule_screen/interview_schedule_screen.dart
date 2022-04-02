import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/screen/main_profile_screen/main_profile_screen.dart';
import 'package:e_recruitment/screen/video_call.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/exam_card.dart';
import 'package:e_recruitment/widget/common/navigate_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class InterviewScheduleScreen extends StatefulWidget {
  String cvImage;
  String name;
  String phone;

  InterviewScheduleScreen({this.phone,this.name,this.cvImage});
  @override
  _InterviewScheduleScreenState createState() => _InterviewScheduleScreenState();
}

class _InterviewScheduleScreenState extends State<InterviewScheduleScreen> {
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
                      Text("Schedule Interview",
                          style: TextStyle(
                            fontSize: 15,
                          )),
                      Text('last Seen 9 mins ago', style: TextStyle(fontSize: 11, color: AppColors.textFieldColor.withOpacity(0.7))),
                    ],
                  ),
                ],
              ),
              elevation: 0,
              actions: [
                IconButton(icon: Icon(Icons.phone), onPressed: () => launch("tel: ${widget.phone}"),),
              ],
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
                      date: '02 April',
                      time: '10 AM'
                  ),
                  commonButton(
                      title: 'JOIN INTERVIEW MEETING',
                      isExpand: 40,
                      textSize: 14,
                      onTap: (){
                        Get.to(() =>CallPage());
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
}
