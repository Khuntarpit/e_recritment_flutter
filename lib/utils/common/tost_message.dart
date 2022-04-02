import 'package:e_recruitment/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void showToastMessage({@required BuildContext context,String message,})
{

  Toast.show(message, context,
      backgroundColor: AppColors.greyColor,
      textColor: AppColors.textFieldColor,
      duration: Toast.LENGTH_LONG,
      gravity: Toast.CENTER,
      backgroundRadius: 10,
      border: Border.all(
        color: AppColors.textFieldColor,
        width: 1,
        style: BorderStyle.solid,
      ));

}