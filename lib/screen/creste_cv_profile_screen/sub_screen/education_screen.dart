import 'package:e_recruitment/model/cv_model.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/navigate_button.dart';
import 'package:e_recruitment/widget/common/text_field.dart';
import 'package:e_recruitment/widget/common/title_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EducationScreen extends StatefulWidget {
  String degree;
  String university;
  String grade;
  String year;
  Function(String) universityData;
  Function(String) degreeData;
  Function(String) gradeData;
  Function(String) yearData;

  EducationScreen({this.degreeData, this.gradeData, this.universityData, this.yearData, this.year, this.university, this.grade, this.degree});

  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  final formKey = GlobalKey<FormState>();

  Data data = Data();

  TextEditingController degree = TextEditingController();
  TextEditingController university = TextEditingController();
  TextEditingController grade = TextEditingController();
  TextEditingController year = TextEditingController();

  @override
  void initState() {
    degree.text = widget.degree;
    university.text = widget.university;
    grade.text = widget.grade;
    year.text = widget.year;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            appbar(context: context, title: 'Education', isTitle: true),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    titleText(title: 'Course / Degree', textSize: 19),
                    textField(hintText: 'Enter Course / Degree', controller: degree, isValidate: true, validationMassage: 'Course / Degree'),
                    titleText(title: 'School / University', textSize: 19),
                    textField(hintText: 'Enter School / University', controller: university, isValidate: true, validationMassage: 'School / University'),
                    titleText(title: 'Grade / Score', textSize: 19),
                    textField(hintText: 'Enter Grade / Score', controller: grade, isValidate: true, validationMassage: 'Grade / Score',keyBordType: TextInputType.number),
                    titleText(title: 'Year', textSize: 19),
                    textField(hintText: 'Enter Year', controller: year, isValidate: true, validationMassage: 'Year',keyBordType: TextInputType.number,),
                    SizedBox(
                      height: 30,
                    ),
                    commonButton(
                        title: 'SAVE',
                        isExpandHeight: 15,
                        marginHorizontal: 110,
                        isExpand: 10,
                        onTap: () {
                          if (formKey.currentState.validate()) {
                            widget.yearData(year.text);
                            widget.universityData(university.text);
                            widget.gradeData(grade.text);
                            widget.degreeData(degree.text);
                            Navigator.pop(context);
                          }
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
