import 'dart:async';

import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/config/app_constant.dart';
import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/screen/company_dashboard.dart';
import 'package:e_recruitment/screen/create_cv/create_cv.dart';
import 'package:e_recruitment/screen/login_screen/login_screen.dart';
import 'package:e_recruitment/screen/main_profile_screen/main_profile_screen.dart';
import 'package:e_recruitment/screen/selecation_roll/selecation_roll_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getPrefData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [AppColors.gradientRed, AppColors.gradientYellow], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  ImagePath.spleshScreenLogo,
                  height: MediaQuery.of(context).size.height / 5,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'E - Recruitment',
                  style: TextStyle(fontSize: 30, color: AppColors.textFieldColor),
                ),
                SizedBox(
                  height: 35,
                ),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.textFieldColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void getPrefData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isLogin = sharedPreferences.getBool(PrefString.isLoginAdmin);
    bool isCv = sharedPreferences.getBool(PrefString.isCreatedCv);

    if (isLogin == true) {
      if(isCv == true){
        Timer(Duration(seconds: 3), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainProfileScreen()),
          );
        });
      } else {
        Timer(Duration(seconds: 3), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => CreateCv()),
          );
        });
      }
    } else if(isLogin == false) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CompanyDashboard()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SelectionRoll()),
      );
    }
  }
}
