import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/screen/login_screen/login_screen.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/navigate_button.dart';
import 'package:e_recruitment/widget/common/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appbar(context: context),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'ENTER OTP',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: AppColors.navyBlueColor),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                          'OTP has been sent your email address\nZYZ@gmail.com . Please verify.',style: TextStyle(
                        color: AppColors.greyColor
                      ),),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          otpCard(),
                          otpCard(),
                          otpCard(),
                          otpCard(),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Resend in 20 sec',style: TextStyle(
                          color: AppColors.navyBlueColor
                      ),),
                    ],
                  ),
                ),
                commonButton(
                    marginHorizontal: 110,
                    isExpand: 10,title: 'APPLY', onTap: () {Get.to(() => LoginScreen());}),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget otpCard() {
  return Container(
    height: 60,
    width: 60,
    margin: EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
        color: AppColors.textFieldColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: newBoxShadow),
  );
}
