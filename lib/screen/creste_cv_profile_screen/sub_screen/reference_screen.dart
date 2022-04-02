import 'package:e_recruitment/model/cv_model.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/navigate_button.dart';
import 'package:e_recruitment/widget/common/text_field.dart';
import 'package:e_recruitment/widget/common/title_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ReferenceScreen extends StatefulWidget {
  String refName;
  String refJobTitle;
  String refCompanyName;
  String refEmail;
  String refPhone;
  Function(String) refNameData;
  Function(String) refJobTitleData;
  Function(String) refCompanyNameData;
  Function(String) refEmailData;
  Function(String) refPhoneData;

  ReferenceScreen(
      {this.refNameData,
      this.refCompanyNameData,
      this.refEmailData,
      this.refJobTitleData,
      this.refPhoneData,
      this.refPhone,
      this.refName,
      this.refJobTitle,
      this.refEmail,
      this.refCompanyName});

  @override
  _ReferenceScreenState createState() => _ReferenceScreenState();
}

class _ReferenceScreenState extends State<ReferenceScreen> {
  Data data = Data();
  final formKey = GlobalKey<FormState>();
  TextEditingController refName = TextEditingController();
  TextEditingController refJobTitle = TextEditingController();
  TextEditingController refCompanyName = TextEditingController();
  TextEditingController refEmail = TextEditingController();
  TextEditingController refPhone = TextEditingController();

  @override
  void initState() {
    refCompanyName.text = widget.refCompanyName;
    refEmail.text = widget.refEmail;
    refJobTitle.text = widget.refJobTitle;
    refName.text = widget.refName;
    refPhone.text = widget.refPhone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            appbar(context: context, title: 'References', isTitle: true),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    titleText(title: "Reference's Name", textSize: 19),
                    textField(hintText: 'Enter Reference\'s Name', controller: refName,isValidate: true,validationMassage: "Reference's Name"),
                    titleText(title: 'Job title', textSize: 19),
                    textField(hintText: 'Enter Job title', controller: refJobTitle,isValidate: true,validationMassage: 'Job title'),
                    titleText(title: 'Company Name', textSize: 19),
                    textField(hintText: 'Enter Company Name', controller: refCompanyName,isValidate: true,validationMassage: 'Company Name'),
                    titleText(title: 'Email', textSize: 19),
                    textField(hintText: 'Enter Email', controller: refEmail,isValidate: true,validationMassage: 'Email'),
                    titleText(title: 'Phone', textSize: 19),
                    textField(hintText: 'Enter Phone', controller: refPhone, keyBordType: TextInputType.phone,isValidate: true,validationMassage: 'Phone'),
                    SizedBox(
                      height: 40,
                    ),
                    commonButton(
                        title: 'SAVE',
                        isExpandHeight: 15,
                        marginHorizontal: 110,
                        isExpand: 10,
                        onTap: () {
                          if (formKey.currentState.validate()) {
                            widget.refJobTitleData(refJobTitle.text);
                            widget.refEmailData(refEmail.text);
                            widget.refCompanyNameData(refCompanyName.text);
                            widget.refPhoneData(refPhone.text);
                            widget.refNameData(refName.text);
                            Navigator.pop(context);
                          }
                        })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
