import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/screen/exam_screen/exam_screen.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/navigate_button.dart';
import 'package:e_recruitment/widget/common/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class JobApplyScreen extends StatefulWidget {
  String cvImage;
  String name;
  String title;
  String companyName;
  String phone;
  String imagePath;

  JobApplyScreen({this.phone,this.name,this.title,this.companyName,this.cvImage,this.imagePath});
  @override
  _JobApplyScreenState createState() => _JobApplyScreenState();
}

class _JobApplyScreenState extends State<JobApplyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appbar(context: context, isTitle: true, title: 'Job'),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 17, vertical: 15),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: BoxDecoration(
                      color: AppColors.textFieldColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Image.asset(
                        widget.imagePath,
                        height: 90,
                      ),
                      Text(
                        widget.title,
                        style: jobTitleStyle,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.companyName,
                        style: jobSubTitle,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '📍 A-29 Sahjanand Complex, Near Decision Makers, Australia',
                        style: smallText,
                      ),
                      SizedBox(height: 10,),
                      Text(
                        '\$60,000 - \$80,000 per year',
                        style: boldStyle,
                      ),
                      SizedBox(height: 15,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Android software development is the process by which\napplications are created for devices running the Android\noperating system.',
                          style: jobTextStyle,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'REQUIREMENTS',
                            style: boldStyle,
                          )),
                      SizedBox(height: 8,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text(
                                '->',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              )),
                          Expanded(
                            flex: 11,
                            child: Text(
                                'Strong knowledge of Android UI design principles, patterns, and best practices',
                                style: jobTextStyle),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text(
                                '->',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              )),
                          Expanded(
                            flex: 11,
                            child: Text(
                                'Strong knowledge of Android UI design principles, patterns, and best practices',
                                style: jobTextStyle),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text(
                                '->',
                                style: TextStyle(
                                    fontSize: 17  , fontWeight: FontWeight.bold),
                              )),
                          Expanded(
                            flex: 11,
                            child: Text(
                                'Strong knowledge of Android UI design principles, patterns, and best practices',
                                style: jobTextStyle),
                          ),
                        ],
                      ),
                      SizedBox(height: 25,),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'JOB DESCRIPTIONS',
                            style: boldStyle,
                          )),
                      SizedBox(height: 8,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                            'Write clear, high-quality code of Android apps\nProvide input on software development projects\nDetect and troubleshoot application issues\nSound knowledge of Programming & API\nGood knowledge of OOPS concepts, Data Structure',
                            style: jobTextStyle),
                      ),
                      SizedBox(height: 60,),
                      commonButton(
                        title: 'APPLY',
                        isExpand: 10,
                        marginHorizontal: 80,
                        isExpandHeight: 15,
                        textSize: 17,
                        onTap: (){
                          Get.to(() =>ExamScreen(cvImage: widget.cvImage,phone: widget.phone,name: widget.name,));
                        }
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
