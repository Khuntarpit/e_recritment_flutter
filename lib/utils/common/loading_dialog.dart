import 'package:e_recruitment/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void showLoadingDialog({
  Color barrierColor,
}) {
  Future.delayed(Duration(seconds: 0), () {
    Get.dialog(
      Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            decoration: BoxDecoration(color: AppColors.backGroundColor, borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.gradientRed),
                    )),
                SizedBox(
                  width: 20,
                ),
                Text(
                    "Loading ...",
                    style: TextStyle(color: AppColors.gradientRed,fontSize: 18)
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,);
  });
}

void hideLoadingDialog() {
  Get.back();
}
