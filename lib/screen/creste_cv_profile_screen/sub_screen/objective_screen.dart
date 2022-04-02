import 'package:e_recruitment/model/cv_model.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/navigate_button.dart';
import 'package:e_recruitment/widget/common/text_field.dart';
import 'package:e_recruitment/widget/common/title_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ObjectiveScreen extends StatefulWidget {
  String objective;
  Function(String) objectiveData;

  ObjectiveScreen({this.objective,this.objectiveData});

  @override
  _ObjectiveScreenState createState() => _ObjectiveScreenState();
}

class _ObjectiveScreenState extends State<ObjectiveScreen> {
  final formKey = GlobalKey<FormState>();
  Data data = Data();
  TextEditingController objective = TextEditingController();
  
  @override
  void initState() {
    setState(() {
      objective.text = widget.objective;
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
            appbar(context: context, title: 'Objective', isTitle: true),
            titleText(title: 'Objective', textSize: 19),
            textField(hintText: 'Enter Objective', maxLine: 8, isValidate: true, controller: objective, validationMassage: 'Objective'),
            Spacer(),
            commonButton(
                title: 'SAVE',
                isExpandHeight: 15,
                marginHorizontal: 110,
                isExpand: 10,
                onTap: () {
                  if (formKey.currentState.validate()) {
                    widget.objectiveData(objective.text);
                    Navigator.pop(context);
                  }
                })
          ],
        ),
      ),
    );
  }
}
