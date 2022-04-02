import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/config/app_constant.dart';
import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/model/no_data_model.dart';
import 'package:e_recruitment/repository/cv_repository.dart';
import 'package:e_recruitment/screen/creste_cv_profile_screen/creste_cv_profile_screen.dart';
import 'package:e_recruitment/utils/common/tost_message.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/navigate_button.dart';
import 'package:e_recruitment/widget/common/style.dart';
import 'package:e_recruitment/widget/common/text_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class SubProfileScreen extends StatefulWidget {
  String cvImage;
  String cvName;
  String phone;
  String address;
  String experience;
  String education;
  String skill;
  Function(bool) isUpdated;

  SubProfileScreen({ this.cvImage, this.phone, this.education, this.skill, this.address, this.cvName, this.experience, this.isUpdated});

  @override
  _SubProfileScreenState createState() => _SubProfileScreenState();
}

class _SubProfileScreenState extends State<SubProfileScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController about = TextEditingController();
  TextEditingController workExperience = TextEditingController();
  TextEditingController education = TextEditingController();
  TextEditingController skill = TextEditingController();

  @override
  void initState() {
    username.text = widget.cvName;
    contact.text = widget.phone;
    about.text = widget.address;
    workExperience.text = widget.experience;
    education.text = widget.education;
    skill.text = widget.skill;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            appbar(
                context: context,
                isTitle: true,
                title: 'Profile',
                appbarActionWidget: widget.cvName == null
                    ? TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreateCvProfile()));
                        },
                        child: Text('Create cv'),
                        style: TextButton.styleFrom(
                          primary: AppColors.textFieldColor,
                        ),
                      )
                    : Container()),
            widget.cvImage != null
                ? Container(
                    margin: EdgeInsets.symmetric(vertical: 26),
                    height: 115,
                    width: 115,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: newBoxShadow,
                      image: DecorationImage(image: NetworkImage(widget.cvImage), fit: BoxFit.cover),
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
            /*Container(
              margin: EdgeInsets.symmetric(vertical: 26),
              height: 115,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: newBoxShadow,
                image: DecorationImage(
                  image: AssetImage(ImagePath.profileImage),
                ),
              ),
            ),*/
            textField(
              isShowLeading: true,
              preFixIcon: Icons.perm_identity,
              hintText: 'User Name',
              controller: username,
            ),
            textField(
              isShowLeading: true,
              preFixIcon: Icons.phone_outlined,
              hintText: 'Contact info',
              controller: contact,
            ),
            textField(
              isShowLeading: true,
              preFixIcon: Icons.person_outline,
              hintText: 'About',
              controller: about,
            ),
            textField(
              isShowLeading: true,
              preFixIcon: Icons.work_outline_rounded,
              hintText: 'Work Experience',
              controller: workExperience,
            ),
            textField(
              isShowLeading: true,
              preFixIcon: Icons.school_outlined,
              hintText: 'Education',
              controller: education,
            ),
            textField(
              isShowLeading: true,
              preFixIcon: Icons.psychology_outlined,
              hintText: 'Skill and Specification',
              controller: skill,
            ),
            SizedBox(
              height: 20,
            ),
            commonButton(
                marginHorizontal: 80,
                title: 'Update Profile',
                onTap: () {
                  updateCvData();
                  /*SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                  sharedPreferences.clear();*/
                  // Get.off(LoginScreen());
                })
          ],
        ),
      ),
    );
  }

  void updateCvData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getString(PrefString.userId);

    NoDataModel data = await CvRepository.updateCv(
        context: context,
        id: id,
        userName: username.text,
        skill: skill.text,
        about: about.text,
        contact: contact.text,
        education: education.text,
        workExperience: workExperience.text);
    if (data.status == 200) {
      showToastMessage(context: context, message: data.message);
      widget.isUpdated(true);
      Navigator.pop(context);
    } else {
      showToastMessage(context: context, message: data.message);
    }
  }
}
