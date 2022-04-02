import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/screen/company_dashboard.dart';
import 'package:e_recruitment/screen/login_screen/login_screen.dart';
import 'package:e_recruitment/widget/common/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectionRoll extends StatefulWidget {
  @override
  _SelectionRollState createState() => _SelectionRollState();
}

class _SelectionRollState extends State<SelectionRoll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [AppColors.gradientRed, AppColors.gradientYellow], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  // setState(() {
                    // launch("https://forms.gle/Fzv9NJGZjdaHcyXN6");
                  // });
                  Get.to(() =>LoginScreen(isAdmin: true,));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    color: AppColors.textFieldColor,
                    boxShadow: newBoxShadow,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImagePath.job,
                        height: 40,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "As a Company",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() =>LoginScreen());
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    color: AppColors.textFieldColor,
                    boxShadow: newBoxShadow,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImagePath.job,
                        height: 40,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "As a Employ",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
