import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/screen/interview_schedule_screen/interview_schedule_screen.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/history_card_view.dart';
import 'package:e_recruitment/widget/common/navigate_button.dart';
import 'package:e_recruitment/widget/common/style.dart';
import 'package:e_recruitment/widget/common/summary_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ExamResultScreen extends StatefulWidget {
  int attemptQuestions;

  ExamResultScreen({this.attemptQuestions});
  @override
  _ExamResultScreenState createState() => _ExamResultScreenState();
}

class _ExamResultScreenState extends State<ExamResultScreen> {
  double question = 7.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appbar(context: context, isTitle: true, title: 'Exam Result'),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: AppColors.textFieldColor,
                        boxShadow: newBoxShadow,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SUMMARY',
                          style: jobTitleStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        summaryRow(
                            title: 'Total Questions',
                            boxColor: AppColors.gradientRed,
                            question: '10'),
                        summaryRow(
                            title: 'Attempted Questions',
                            boxColor: AppColors.gradientYellow,
                            question: '${widget.attemptQuestions}'),
                        summaryRow(
                            title: 'No Attempted Questions',
                            boxColor: AppColors.gradientYellow.withOpacity(0.7),
                            question: '${10 - widget.attemptQuestions}'),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: AppColors.textFieldColor,
                        boxShadow: newBoxShadow,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'RESULTS',
                          style: jobTitleStyle,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              ImagePath.g_logo,
                              height: 90,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Googleasiant Technolabs',
                                  style:
                                      TextStyle(color: AppColors.navyBlueColor),
                                ),
                                SizedBox(height: 4,),
                                Row(
                                  children: [
                                    Text(
                                      'Exam Date: ',
                                      style: jobTextStyle,
                                    ),
                                    Text(
                                      '5 April',
                                      style: TextStyle(
                                          color: AppColors.gradientRed,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Score: ',
                                      style: jobTextStyle,
                                    ),
                                    SizedBox(width: 5,),
                                    Text('${widget.attemptQuestions*10} / 100'),
                                    SizedBox(width: 7,),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: SliderTheme(
                                        child: Slider(
                                          value: widget.attemptQuestions.toDouble(),
                                          max: 10,
                                          min: 0,
                                          activeColor: question == 100
                                              ? Colors.green
                                              : AppColors.gradientRed,
                                          inactiveColor: AppColors.gradientRed
                                              .withOpacity(0.5),
                                          onChanged: (double value) {},
                                        ),
                                        data: SliderThemeData(
                                          trackShape: CustomTrackShape(),
                                          trackHeight: 5,
                                          minThumbSeparation: 0,
                                          thumbColor: Colors.transparent,
                                          thumbShape: RoundSliderThumbShape(
                                              enabledThumbRadius: 0.0,
                                              disabledThumbRadius: 0.0,
                                              pressedElevation: 0.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  commonButton(
                    title: 'CHECK INTERVIEW SCHEDULE',
                    isExpand: 40,
                    textSize: 14,
                    onTap: (){
                      Get.off(() => InterviewScheduleScreen());
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
