import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/navigate_button.dart';
import 'package:e_recruitment/widget/common/style.dart';
import 'package:e_recruitment/widget/common/text_field.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appbar(context: context, isTitle: true, title: 'Profile'),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    width: 115,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://cdn.business2community.com/wp-content/uploads/2014/04/profile-picture.jpg'),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.cherryRedColor),
                          child: Icon(
                            Icons.edit,
                            color: AppColors.textFieldColor,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  commonTextField(
                      preFixIcon: Icons.account_circle_outlined,
                      hintText: 'User Name'),
                  commonTextField(
                      preFixIcon: Icons.email_outlined,
                      hintText: 'Email address'),
                  commonTextField(preFixIcon: Icons.phone, hintText: 'Contact'),
                  commonTextField(
                      preFixIcon: Icons.location_on_outlined,
                      hintText: 'Location'),
                  commonTextField(
                      preFixIcon: Icons.account_box_outlined,
                      hintText: 'About Myself'),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    padding: EdgeInsets.all(18),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.textFieldColor,
                        boxShadow: newBoxShadow,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "By saving your profile, you agree that your profile information\nand CV can be viewed by all employers.\n See also E-Recruitment's Privacy Policy.",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  commonButton(marginHorizontal: 50,title: 'SAVE PROFILE', onTap: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
