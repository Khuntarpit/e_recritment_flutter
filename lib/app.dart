import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/screen/splesh_screen/splesh_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ERecruitment extends StatefulWidget {
  @override
  _ERecruitmentState createState() => _ERecruitmentState();
}

class _ERecruitmentState extends State<ERecruitment> {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backGroundColor
      ),
      home: SplashScreen(),
    );
  }
}

