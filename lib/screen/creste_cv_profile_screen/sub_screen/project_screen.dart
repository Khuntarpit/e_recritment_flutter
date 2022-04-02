import 'package:e_recruitment/model/cv_model.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/navigate_button.dart';
import 'package:e_recruitment/widget/common/text_field.dart';
import 'package:e_recruitment/widget/common/title_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProjectScreen extends StatefulWidget {
  String projectTitle;
  String projectDescription;

  Function(String) projectTitleData;
  Function(String) projectDescriptionData;

  ProjectScreen({this.projectTitleData, this.projectDescriptionData, this.projectTitle, this.projectDescription});

  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  Data data = Data();
  final formKey = GlobalKey<FormState>();
  TextEditingController projectTitle = TextEditingController();
  TextEditingController projectDescription = TextEditingController();

  @override
  void initState() {
    projectTitle.text = widget.projectTitle;
    projectDescription.text = widget.projectDescription;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            appbar(context: context, title: 'Projects', isTitle: true),
            Expanded(
              child: ListView(
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  titleText(title: "Title", textSize: 19),
                  textField(hintText: 'Enter Title', controller: projectTitle, isValidate: true, validationMassage: 'Title'),
                  titleText(title: 'Descriptions', textSize: 19),
                  textField(hintText: 'Enter Descriptions', maxLine: 8, controller: projectDescription, isValidate: true, validationMassage: 'Descriptions'),
                  SizedBox(
                    height: 50,
                  ),
                  commonButton(
                      title: 'SAVE',
                      isExpandHeight: 15,
                      marginHorizontal: 110,
                      isExpand: 10,
                      onTap: () {
                        if (formKey.currentState.validate()) {
                          widget.projectDescriptionData(projectTitle.text);
                          widget.projectTitleData(projectDescription.text);
                          Navigator.pop(context);
                        }
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
