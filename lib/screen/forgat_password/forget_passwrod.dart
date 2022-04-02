import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/model/forgot_password_model.dart';
import 'package:e_recruitment/repository/forgot_password_repository.dart';
import 'package:e_recruitment/screen/login_screen/login_screen.dart';
import 'package:e_recruitment/utils/common/tost_message.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/navigate_button.dart';
import 'package:e_recruitment/widget/common/text_field.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emilController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appbar(context: context),
          Spacer(),
          Text(
            'Forget password',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: AppColors.navyBlueColor),
          ),
          Text(
            'Are you sure do that !',
            style: TextStyle(color: AppColors.greyColor),
          ),
          Spacer(),
          Text("Enter the email address associated \nwith your account. we' ll send you a reset link !",
              textAlign: TextAlign.center, style: TextStyle(color: AppColors.greyColor)),
          SizedBox(
            height: 15,
          ),
          commonTextField(
            preFixIcon: Icons.email_outlined,
            controller: emilController,
            hintText: 'Enter your Email',
          ),
          Spacer(),
          commonButton(
              marginHorizontal: 100,
              title: 'SENT',
              onTap: () {
                forgotPassword();
              }),
          Spacer(),
          Spacer(),
        ],
      ),
    );
  }

  void forgotPassword() async {
    ForgotPasswordModel forgotPasswordModel = await ForgotPasswordRepository.forgotPassword(email: emilController.text);
    if (forgotPasswordModel.status == 200) {
      showToastMessage(context: context, message: forgotPasswordModel.message);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }
}
