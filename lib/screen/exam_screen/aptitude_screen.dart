import 'dart:convert';

import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/config/app_constant.dart';
import 'package:e_recruitment/repository/cv_repository.dart';
import 'package:e_recruitment/repository/login_repository.dart';
import 'package:e_recruitment/screen/exam_screen/exam_result_screen.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/history_card_view.dart';
import 'package:e_recruitment/widget/common/navigate_button.dart';
import 'package:e_recruitment/widget/common/question_list_title.dart';
import 'package:e_recruitment/widget/common/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AptitudeScreen extends StatefulWidget {
  @override
  _AptitudeScreenState createState() => _AptitudeScreenState();
}

class _AptitudeScreenState extends State<AptitudeScreen> {



  List<String> optionList = ['op1', 'op2', 'op3', 'op4', 'op5', 'op6', 'op7', 'op8', 'op9', 'op10'];

  List qNum = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

  List questionList = [];
  List ids = [];
  List ans1 = [];
  List ans2 = [];
  List ans3 = [];
  List ans4 = [];
  PageController pageController;

  List finalAnswerList = [];

  getQuestionsData() async {
    var userData = await LoginRepository.getQuestionData(context: context,);
    if(userData != null){
      setState(() {
        var data = userData["data"];
        for(var i=0; i<data.length; i++){
          questionList.add(data[i]['question']);
          ans1.add(data[i]['choice1']);
          ans2.add(data[i]['choice2']);
          ans3.add(data[i]['choice3']);
          ans4.add(data[i]['choice4']);
          ids.add(data[i]['_id']);
        }
      });
    }
  }
  submitExamData(List answers) async {
    var userData = await LoginRepository.submitExamData(context: context,answers: answers);
    if(userData != null){
      Get.off(() => ExamResultScreen(
        attemptQuestions: answers.length,
      ));
    }
  }
  @override
  void initState() {
    getQuestionsData();
    pageController = PageController(
      keepPage: true,
      initialPage: 0,
    );
    super.initState();
  }

  int question = 0;

  @override
  void dispose() {
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appbar(context: context, isTitle: true, title: 'Aptitude Exam'),
          Expanded(
            child: questionList.isEmpty ? Container() : Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text('Questions', style: questionStyle),
                      SizedBox(
                        width: 10,
                      ),
                      Text('${question + 1} / 10', style: examText),
                    ],
                  ),
                  SliderTheme(
                    child: Slider(
                      value: question.toDouble() + 1,
                      max: 10,
                      min: 0,
                      activeColor: question == 10 ? Colors.green : AppColors.gradientRed,
                      inactiveColor: AppColors.gradientRed.withOpacity(0.5),
                      onChanged: (double value) {},
                    ),
                    data: SliderThemeData(
                      trackShape: CustomTrackShape(),
                      trackHeight: 5,
                      minThumbSeparation: 0,
                      thumbColor: Colors.transparent,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0, disabledThumbRadius: 0.0, pressedElevation: 0.0),
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                        controller: pageController,
                        scrollDirection: Axis.horizontal,
                        itemCount: questionList.length,
                        allowImplicitScrolling: true,
                        onPageChanged: (v) {
                          setState(() {
                            question = v;
                          });
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(left: 5, right: 5, bottom: 40),
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                              color: AppColors.textFieldColor,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: newBoxShadow,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      'Q.${qNum[index]}',
                                      style: examText,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 32,
                                    ),
                                    Expanded(
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            questionList[index],
                                            style: questionStyle,
                                          )),
                                    ),
                                  ],
                                ),
                                questionListTitle(
                                  title: ans1[index],
                                  value: 'one',
                                  groupValue: optionList[index],
                                  onChange: (v) {
                                    setState(() {
                                      optionList[index] = v;
                                      print(v);
                                      print("ans !! ${ans1[index]}");
                                    });
                                  },
                                ),
                                questionListTitle(
                                  title: ans2[index],
                                  value: 'two',
                                  groupValue: optionList[index],
                                  onChange: (v) {
                                    setState(() {
                                      optionList[index] = v;
                                      print(v);
                                    });
                                  },
                                ),
                                questionListTitle(
                                  title: ans3[index],
                                  value: 'three',
                                  groupValue: optionList[index],
                                  onChange: (v) {
                                    setState(() {
                                      optionList[index] = v;
                                      print(v);
                                    });
                                  },
                                ),
                                questionListTitle(
                                  title: ans4[index],
                                  value: 'fore',
                                  groupValue: optionList[index],
                                  onChange: (v) {
                                    setState(() {
                                      optionList[index] = v;
                                      print(v);
                                    });
                                  },
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      commonButton(
                          title: 'PREVIEWS',
                          isExpandHeight: 15,
                          isExpand: 25,
                          textSize: 15,
                          onTap: () {
                            pageController.animateToPage(--question, duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
                          }),
                      commonButton(
                        title: question == 9 ? "Submit" : 'SAVE & NEXT',
                        isExpandHeight: 15,
                        isExpand: question == 9 ? 35 : 25,
                        textSize: 15,
                        onTap: () async {
                          print(optionList);
                          pageController.animateToPage(++question, duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
                          if (question == 10) {
                            List submitAns = [];
                            for(var i=0; i<optionList.length; i++){
                              if(!optionList[i].contains("op")){
                                if(optionList[i] == 'one'){
                                  submitAns.add({"_id":ids[i],"choice":ans1[i]});
                                } else if(optionList[i] == 'two'){
                                  submitAns.add({"_id":ids[i],"choice":ans2[i]});
                                } else if(optionList[i] == 'three'){
                                  submitAns.add({"_id":ids[i],"choice":ans3[i]});
                                } else {
                                  submitAns.add({"_id":ids[i],"choice":ans4[i]});
                                }
                              }
                            }
                            await submitExamData(submitAns);
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
