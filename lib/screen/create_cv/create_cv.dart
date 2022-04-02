import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/screen/creste_cv_profile_screen/creste_cv_profile_screen.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/navigate_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CreateCv extends StatefulWidget {
  @override
  _CreateCvState createState() => _CreateCvState();
}

class _CreateCvState extends State<CreateCv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appbar(context: context),
          Spacer(),
          Container(
            height:170,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.gradientYellow.withOpacity(0.4),
                  blurRadius: 10,spreadRadius: 1
                )
              ],
              gradient: LinearGradient(
                  colors: [AppColors.gradientRed, AppColors.gradientYellow],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              shape: BoxShape.circle
            ),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset(ImagePath.createCv,),
            ),
          ),
          Spacer(),
          commonButton(
              isExpandHeight: 15,
              marginHorizontal: 100,
              isExpand: 10,
            title: 'CREATE CV',
            onTap: (){
              Get.to(() =>CreateCvProfile());
            }
          ),
         /* outLineBorderConatiner(
            title: "I'll type in my details",
            onTap: (){
              Get.to(() =>ProfileScreen());
            }
          ),*/
          Spacer(),
        ],
      ),
    );
  }
}
