import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/widget/common/style.dart';
import 'package:flutter/material.dart';

Widget commonTextField({
  String hintText,
  IconData preFixIcon,
  TextEditingController controller,
  String validationMassage,
  bool obscureText = false,
  IconButton suffixIcon,
  bool isValidate = false,
  bool isEmailValidator = false,
}) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
        margin: EdgeInsets.symmetric(horizontal: 18, vertical: 7.5),
        decoration: BoxDecoration(color: AppColors.textFieldColor, boxShadow: newBoxShadow, borderRadius: BorderRadius.circular(30)),
        child: TextFormField(
          obscureText: obscureText,
          controller: controller,
          validator: isValidate
              ? (value) {
                  if (value.length == 0) {
                    return "$validationMassage is Required !";
                  } else if (isEmailValidator == true) {
                    if (value.isEmpty) {
                      return "$validationMassage is Required !";
                    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                      return 'Enter Valid $validationMassage';
                    }
                  }
                  return null;
                }
              : null,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: suffixIcon,
            prefixIcon: IconButton(
              icon: Icon(preFixIcon),
              onPressed: () {},
              color: AppColors.redColor,
            ),
            hintText: hintText,
          ),
        ),
      ),
    ],
  );
}

Widget textField({
  String hintText,
  String validationMassage,
  bool isValidate = false,
  bool isEmailValidator = false,
  TextEditingController controller,
  IconData preFixIcon,
  bool isShowLeading = false,
  int maxLine,
  TextInputType keyBordType,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 27, vertical: 1),
    margin: EdgeInsets.symmetric(horizontal: 18, vertical: 7.5),
    decoration: BoxDecoration(color: AppColors.textFieldColor, boxShadow: newBoxShadow, borderRadius: BorderRadius.circular(30)),
    child: Row(
      children: [
        isShowLeading
            ? Icon(preFixIcon, color: AppColors.redColor)
            : Container(),
        isShowLeading ? SizedBox(width: 13,):Container(),
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 15),
            ),
            keyboardType: keyBordType ?? TextInputType.text,
            maxLines: maxLine ?? 1,
            validator: isValidate
                ? (value) {
                    if (value.length == 0) {
                      return "$validationMassage is Required !";
                    } else if (isEmailValidator == true) {
                      if (value.isEmpty) {
                        return "$validationMassage is Required !";
                      } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                        return 'Enter Valid $validationMassage';
                      }
                    }
                    return null;
                  }
                : null,
          ),
        ),
      ],
    ),
  );
}
