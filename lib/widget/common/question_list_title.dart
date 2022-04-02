import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/widget/common/style.dart';
import 'package:flutter/material.dart';

Widget questionListTitle({
  String title,
  String value,
  String groupValue,
  Function(String) onChange,
}) {
  return ListTile(
    title: Text(
      title,
      style: questionStyle,
    ),
    leading: Radio(
      activeColor: AppColors.gradientRed,
      value: value,
      groupValue: groupValue,
      onChanged: onChange,
    ),
  );
}
