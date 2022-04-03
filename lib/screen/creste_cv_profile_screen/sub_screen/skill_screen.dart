import 'package:e_recruitment/model/cv_model.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/navigate_button.dart';
import 'package:e_recruitment/widget/common/text_field.dart';
import 'package:e_recruitment/widget/common/title_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SkillScreen extends StatefulWidget {
  String skill;
  Function(String) skillData;
  SkillScreen({this.skillData,this.skill});

  @override
  _SkillScreenState createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {
  final formKey = GlobalKey<FormState>();

  Data data = Data();
  TextEditingController skill = TextEditingController();

  @override
  void initState() {
    setState(() {
      skill.text = widget.skill;
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            appbar(context: context, title: 'Skill', isTitle: true),
            titleText(title: 'Skill', textSize: 19),
            textField(hintText: 'Enter Skill', maxLine: 6, controller: skill, validationMassage: 'Skill'),
            Spacer(),
            commonButton(
                title: 'SAVE',
                isExpandHeight: 15,
                marginHorizontal: 110,
                isExpand: 10,
                onTap: () {
                  if (formKey.currentState.validate()) {
                   if(skill.text.isNotEmpty) widget.skillData(skill.text);
                   Navigator.pop(context);
                  }
                })
          ],
        ),
      ),
    );
  }
}
