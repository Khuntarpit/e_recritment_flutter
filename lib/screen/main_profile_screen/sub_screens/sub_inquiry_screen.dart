import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/repository/login_repository.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/navigate_button.dart';
import 'package:e_recruitment/widget/common/notification_card.dart';
import 'package:e_recruitment/widget/common/style.dart';
import 'package:e_recruitment/widget/common/text_field.dart';
import 'package:e_recruitment/widget/common/title_text.dart';
import 'package:flutter/material.dart';

class SubInquiryScreen extends StatefulWidget {
  @override
  _SubInquiryScreenState createState() => _SubInquiryScreenState();
}

class _SubInquiryScreenState extends State<SubInquiryScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            appbar(context: context, isTitle: true, title: 'Inquiry'),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  child: Column(
                    children: [
                      titleText(title: 'Email', textSize: 19),
                      textField(hintText: 'Enter Email', isValidate: true, controller: emailController,isEmailValidator: true, validationMassage: 'Email'),
                      titleText(title: 'Subject', textSize: 19),
                      textField(hintText: 'Enter Subject', isValidate: true, controller: subjectController, validationMassage: 'Subject'),
                      titleText(title: 'Description', textSize: 19),
                      textField(maxLine: 7, hintText: 'Enter Description', isValidate: true, controller: descriptionController, validationMassage: 'Description'),

                      commonButton(
                          title: 'SEND',
                          isExpandHeight: 15,
                          marginHorizontal: 110,
                          isExpand: 10,
                          onTap: () {
                            if (formKey.currentState.validate()) {
                              LoginRepository.createInquiryData(context: context, bodyData: {
                                "email":emailController.text,
                                "subject":subjectController.text,
                                "description":descriptionController.text
                              }).then((f) {
                                Navigator.pop(context);
                              });
                            }
                          })
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
