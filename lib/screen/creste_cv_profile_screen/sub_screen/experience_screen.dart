import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/model/cv_model.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/navigate_button.dart';
import 'package:e_recruitment/widget/common/style.dart';
import 'package:e_recruitment/widget/common/text_field.dart';
import 'package:e_recruitment/widget/common/title_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ExperienceScreen extends StatefulWidget {
  String companyName;
  String jobTitle;
  String startDate;
  String endDate;
  String jobExperience;
  String details;
  Function(String) companyNameData;
  Function(String) jobTitleData;
  Function(String) jobExperienceData;
  Function(String) startDateData;
  Function(String) endDateData;
  Function(String) detailsData;

  ExperienceScreen(
      {this.companyNameData,
      this.detailsData,
      this.endDateData,
      this.jobTitleData,
      this.jobExperienceData,
      this.startDateData,
      this.startDate,
      this.jobTitle,
      this.jobExperience,
      this.endDate,
      this.details,
      this.companyName});

  @override
  _ExperienceScreenState createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  final formKey = GlobalKey<FormState>();

  Data data = Data();

  TextEditingController companyName = TextEditingController();
  TextEditingController jobTitle = TextEditingController();
  TextEditingController jobExperience = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController details = TextEditingController();

  @override
  void initState() {
    companyName.text = widget.companyName;
    jobTitle.text = widget.jobTitle;
    jobExperience.text = widget.jobExperience;
    startDate.text = widget.startDate;
    endDate.text = widget.endDate;
    details.text = widget.details;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            appbar(context: context, title: 'Experience', isTitle: true),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                child: Column(
                  children: [
                    titleText(title: 'Company Name', textSize: 19),
                    textField(hintText: 'Enter Company Name', isValidate: true, controller: companyName, validationMassage: 'Company Name'),
                    titleText(title: 'Job Title', textSize: 19),
                    textField(hintText: 'Enter Job Title', isValidate: true, controller: jobTitle, validationMassage: 'Job Title'),
                     titleText(title: 'Job Experience', textSize: 19),
                    textField(hintText: 'Enter Job Experience', isValidate: true, controller: jobExperience, validationMassage: 'Job Experience',keyBordType: TextInputType.number),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              titleText(title: 'Start Date', textSize: 19),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
                                decoration: BoxDecoration(color: AppColors.textFieldColor, boxShadow: newBoxShadow, borderRadius: BorderRadius.circular(30)),
                                child: TextFormField(
                                  controller: startDate,
                                  readOnly: true,
                                  onTap: () {
                                    FocusScope.of(context).requestFocus(new FocusNode());
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1850, 1),
                                      lastDate: DateTime(2050,12),
                                    ) .then((selectedDate) {
                                      //TODO: handle selected date
                                      if(selectedDate!=null){
                                        startDate.text =  selectedDate.toLocal().toString().substring(0,11);
                                      }
                                    });
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Select Start Date",
                                    hintStyle: TextStyle(fontSize: 15),
                                  ),
                                  keyboardType: TextInputType.text,
                                  maxLines: 1,
                                  validator: (value) {
                                    if (value.length == 0) {
                                      return "Start Date is Required !";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              // textField(hintText: 'Select Start Date', isValidate: true, controller: startDate, validationMassage: 'Start Date'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              titleText(title: 'End Date', textSize: 19),
                              // textField(hintText: 'Select End Date', isValidate: true, controller: endDate, validationMassage: 'End Date'),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
                                decoration: BoxDecoration(color: AppColors.textFieldColor, boxShadow: newBoxShadow, borderRadius: BorderRadius.circular(30)),
                                child: TextFormField(
                                  controller: endDate,
                                  readOnly: true,
                                  onTap: () {
                                    FocusScope.of(context).requestFocus(new FocusNode());
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1850, 1),
                                      lastDate: DateTime(2050,12),
                                    ) .then((selectedDate) {
                                      //TODO: handle selected date
                                      if(selectedDate!=null){
                                        endDate.text = selectedDate.toLocal().toString().substring(0,11);
                                      }
                                    });
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Select End Date",
                                    hintStyle: TextStyle(fontSize: 15),
                                  ),
                                  keyboardType: TextInputType.text,
                                  maxLines: 1,
                                  validator: (value) {
                                    if (value.length == 0) {
                                      return "End Date is Required !";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    titleText(title: 'Details', textSize: 19),
                    textField(maxLine: 7, hintText: 'Enter Details', isValidate: true, controller: details, validationMassage: 'Details'),
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
                            widget.startDateData(startDate.text);
                            widget.jobTitleData(jobTitle.text);
                            widget.endDateData(endDate.text);
                            widget.jobExperienceData(jobExperience.text);
                            widget.detailsData(details.text);
                            widget.companyNameData(companyName.text);
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
