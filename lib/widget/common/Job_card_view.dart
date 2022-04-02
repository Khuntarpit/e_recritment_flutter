import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/widget/common/style.dart';
import 'package:flutter/material.dart';

Widget jobCardView({
  String imagePath,
  String title,
  String subTitle,
  String thirdTitle,
  Function onTap,
  String resumeDescription,
  String resumeDescription2,
  String itemDescription,
  bool resumeScreenSize = false,
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    padding: EdgeInsets.only(left: 20, top: 15),
    decoration: BoxDecoration(
        color: AppColors.textFieldColor,
        boxShadow: newBoxShadow,
        borderRadius: BorderRadius.circular(30)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: resumeScreenSize ?10 : 0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: resumeScreenSize ?55 :75,
              ),
            ),
            SizedBox(
              width: resumeScreenSize ? 15 : 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(subTitle),
              ],
            )
          ],
        ),
        SizedBox(
          height: resumeScreenSize ?15 :5,
        ),
        Row(
          children: [
            SizedBox(
              width: 25,
            ),
            resumeScreenSize ? Icon(Icons.circle,size: 10,) : Image.asset(
              ImagePath.user_2,
              height: 20,
            ),
            SizedBox(
              width: 15,
            ),
            resumeScreenSize ? Text(resumeDescription) : Text('120 Applications')
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 25,
            ),
            resumeScreenSize ? Icon(Icons.circle,size: 10,) :Image.asset(
              ImagePath.cal_2,
              height: 20,
            ),
            SizedBox(
              width: 15,
            ),
            resumeScreenSize ? Text(resumeDescription2) : Text('Applied on 4th Sep')
          ],
        ),
        SizedBox(
          height: 10,
        ),
        resumeScreenSize ? Row(
          children: [
            SizedBox(
              width: 25,
            ),
             Icon(Icons.circle,size: 10,) ,
            SizedBox(
              width: 15,
            ),
             Text(thirdTitle)
          ],
        ) : Container(),
        SizedBox(
          height: 25,
        ),
        resumeScreenSize ? Text(itemDescription) : Text(
            "Android software development is the process by which\napplications are created for devices running the\nAndroid operating system."),
        Row(
          children: [
            Spacer(),
            TextButton(
              onPressed: onTap,
              child: Text(
              resumeScreenSize?"view service" : 'VIEW APPLICATION >',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.gradientRed,
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
