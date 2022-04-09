
import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/style.dart';
import 'package:e_recruitment/widget/common/title_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdminCvsScreen extends StatefulWidget {
  var examData;
  AdminCvsScreen(this.examData);

  @override
  _AdminCvsScreenState createState() => _AdminCvsScreenState();
}

class _AdminCvsScreenState extends State<AdminCvsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appbar(
              context: context,
              isTitle: true,
              title: 'Profile Details',
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    widget.examData['image'] != null ? Container(
                      margin: EdgeInsets.only(bottom: 20),
                      height: 115,
                      width: 115,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: newBoxShadow,
                        image: DecorationImage(image: NetworkImage(widget.examData['image'][0]['url'] ), fit: BoxFit.cover),
                      ),
                    )
                        : Container(
                      margin: EdgeInsets.symmetric(vertical: 26),
                      height: 115,
                      width: 115,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: newBoxShadow,
                        image: DecorationImage(
                          image: AssetImage(ImagePath.profileImage),
                        ),
                      ),
                    ),
                    titleText(title: 'Personal Details'),
                    Row(
                      children: [
                        Text(
                          "Name : ",
                          style: profileTitleStyle,
                        ),
                        Text(
                          "${widget.examData['name']}",
                          style: profileTitleStyle,
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Address : ",
                          style: profileTitleStyle,
                        ),
                        Expanded(
                          child: Text(
                            "${widget.examData['profile_address']}",
                            style: profileTitleStyle,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "email : ",
                          style: profileTitleStyle,
                        ),
                        Expanded(
                          child: Text(
                            "${widget.examData['email']}",
                            style: profileTitleStyle,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phone no : ",
                          style: profileTitleStyle,
                        ),
                        Expanded(
                          child: Text(
                            "${widget.examData['phone']}",
                            style: profileTitleStyle,
                          ),
                        ),
                      ],
                    ),
                   if(widget.examData['degree'] != null && widget.examData['degree'].isNotEmpty)  Column(
                      children: [
                        Divider(),
                        titleText(title: 'Education Details'),
                        Divider(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Degree : ",
                              style: profileTitleStyle,
                            ),
                            Expanded(
                              child: Text(
                                "${widget.examData['degree']}",
                                style: profileTitleStyle,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "University : ",
                              style: profileTitleStyle,
                            ),
                            Expanded(
                              child: Text(
                                "${widget.examData['university']}",
                                style: profileTitleStyle,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Grade : ",
                              style: profileTitleStyle,
                            ),
                            Expanded(
                              child: Text(
                                "${widget.examData['grade']}",
                                style: profileTitleStyle,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Passing year : ",
                              style: profileTitleStyle,
                            ),
                            Expanded(
                              child: Text(
                                "${widget.examData['year']}",
                                style: profileTitleStyle,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                   if(widget.examData['company_name'] != null && widget.examData['company_name'].isNotEmpty)  Column(
                      children: [
                        Divider(),
                        titleText(title: 'Experience Details'),
                        Divider(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Company name : ",
                              style: profileTitleStyle,
                            ),
                            Expanded(
                              child: Text(
                                "${widget.examData['company_name']}",
                                style: profileTitleStyle,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Job title : ",
                              style: profileTitleStyle,
                            ),
                            Expanded(
                              child: Text(
                                "${widget.examData['job_title']}",
                                style: profileTitleStyle,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "From : ",
                                  style: profileTitleStyle,
                                ),
                                Text(
                                  "${widget.examData['start_date']}",
                                  style: profileTitleStyle,
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "To : ",
                                  style: profileTitleStyle,
                                ),
                                Text(
                                  "${widget.examData['end_date']}",
                                  style: profileTitleStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Experience : ",
                              style: profileTitleStyle,
                            ),
                            Expanded(
                              child: Text(
                                "${widget.examData['experience']} year",
                                style: profileTitleStyle,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                   if(widget.examData['skill'] != null ||widget.examData['objective'] != null || widget.examData['project_title'] != null|| widget.examData['help_tips'] != null)  Column(
                      children: [
                        Divider(),
                        titleText(title: 'Other Details'),
                        if(widget.examData['skill'] != null) Divider(),
                        if(widget.examData['skill'] != null) Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Skill : ",
                              style: profileTitleStyle,
                            ),
                            Expanded(
                              child: Text(
                                "${widget.examData['skill']}",
                                style: profileTitleStyle,
                              ),
                            ),
                          ],
                        ),
                        if(widget.examData['objective'] != null) Divider(),
                        if(widget.examData['objective'] != null) Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Objective : ",
                              style: profileTitleStyle,
                            ),
                            Expanded(
                              child: Text(
                                "${widget.examData['objective']}",
                                style: profileTitleStyle,
                              ),
                            ),
                          ],
                        ),
                        if(widget.examData['project_title'] != null) Divider(),
                        if(widget.examData['project_title'] != null) Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Project title : ",
                              style: profileTitleStyle,
                            ),
                            Expanded(
                              child: Text(
                                "${widget.examData['project_title']}",
                                style: profileTitleStyle,
                              ),
                            ),
                          ],
                        ),
                        if(widget.examData['project_desription'] != null)  Divider(),
                        if(widget.examData['project_desription'] != null) Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Project desription : ",
                              style: profileTitleStyle,
                            ),
                            Expanded(
                              child: Text(
                                "${widget.examData['project_desription']}",
                                style: profileTitleStyle,
                              ),
                            ),
                          ],
                        ),
                        if(widget.examData['help_tips'] != null) Divider(),
                        if(widget.examData['help_tips'] != null) Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Help tips : ",
                              style: profileTitleStyle,
                            ),
                            Expanded(
                              child: Text(
                                "${widget.examData['help_tips']}",
                                style: profileTitleStyle,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}
