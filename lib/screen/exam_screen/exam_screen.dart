import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/screen/exam_screen/aptitude_screen.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/exam_card.dart';
import 'package:e_recruitment/widget/common/navigate_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ExamScreen extends StatefulWidget {
  String cvImage;
  String name;
  String phone;

  ExamScreen({this.phone,this.name,this.cvImage});
  @override
  _ExamScreenState createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          imageAppbar(
            title: widget.name,
            subTitle: 'last Seen 9 mins ago',
            imagePath: widget.cvImage,
            onTapCall: () {
              launch("tel: ${widget.phone}");
            },
          ),
          examCard(
            title: 'CONNECTED',
            description:
                'Reference site about Lorem Ipsum, giving information on its origins, as well as a ... Traductions: Pouvez-vous nous aider en traduisant ce site dans des langues ... You visited this page on 1/9/20.',
            imagePath: ImagePath.two,
          ),
          examCard(
              title: 'Aptitude Test Schedule',
              description: 'Reference site about Lorem Ipsum, giving information on its origins, as well as a ... Traductions: Pouvez- .',
              imagePath: ImagePath.one,
              isText: true,
              date: '02 April',
              time: '10 AM'),
          Spacer(),
          commonButton(
              title: 'Start Exam',
              marginHorizontal: 90,
              isExpand: 10,
              isExpandHeight: 15,
              textSize: 17,
              onTap: () {
                Get.to(() => AptitudeScreen());
              }),
        ],
      ),
    );
  }
}
