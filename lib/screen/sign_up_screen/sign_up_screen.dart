import 'dart:convert';

import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/config/app_constant.dart';
import 'package:e_recruitment/model/signup_model.dart';
import 'package:e_recruitment/repository/signup_repository.dart';
import 'package:e_recruitment/screen/company_dashboard.dart';
import 'package:e_recruitment/screen/create_cv/create_cv.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/navigate_button.dart';
import 'package:e_recruitment/widget/common/text_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  bool isAdmin = false;
  SignUpScreen({this.isAdmin});
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isSelect = true;
  final formKey = GlobalKey<FormState>();
  bool passwordCheck = true;
  TextEditingController userName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            appbar(context: context),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Sign up',
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: AppColors.navyBlueColor),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    commonTextField(
                        isValidate: true,
                        controller: userName,
                        validationMassage: 'Username',
                        hintText: 'Username',
                        preFixIcon: Icons.account_circle_outlined),
                    commonTextField(
                      hintText: 'Mobile number',
                      controller: mobileNumber,
                      preFixIcon: Icons.phone_outlined,
                      isValidate: true,
                      validationMassage: 'Mobile number',
                    ),
                    commonTextField(
                      hintText: 'Email address',
                      controller: email,
                      preFixIcon: Icons.email_outlined,
                      isValidate: true,
                      validationMassage: 'Email address',
                      isEmailValidator: true
                    ),
                    commonTextField(
                        preFixIcon: Icons.lock_outline_rounded,
                        controller: password,
                        hintText: 'Password',
                        validationMassage: "Password",
                        obscureText: passwordCheck,
                        suffixIcon: IconButton(
                            icon: Icon(
                              passwordCheck ? Icons.visibility : Icons.visibility_off,
                              color: AppColors.redColor,
                            ),
                            onPressed: () {
                              setState(() {
                                passwordCheck ^= true;
                              });
                            }),
                        isValidate: true
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 18,
                        ),
                        Checkbox(
                          onChanged: (v) {
                            setState(() {
                              isSelect = v;
                            });
                          },
                          value: isSelect,
                        ),
                        Text('I accept the terms and policy'),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    commonButton(
                      marginHorizontal: 80,
                      title: 'Sign up',
                      onTap: () {
                        if (formKey.currentState.validate()) {
                          createUser(
                            context: context,
                            name: userName.text,
                            email: email.text,
                            password: password.text,
                            phone: mobileNumber.text,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void setSharedPreferences({Data data, String token,String id}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(PrefString.isLoginAdmin, data.role == "admin" ? false : true);
    sharedPreferences.setString(PrefString.token, token);
    sharedPreferences.setString(PrefString.userId, id);
    sharedPreferences.setString(PrefString.loginModel, json.encode(data));
    print("isLogin------${sharedPreferences.get(PrefString.isLoginAdmin)}");
    print("Signup Model------${sharedPreferences.get(PrefString.loginModel)}");
    print("id !! ${sharedPreferences.getString(PrefString.userId)}");
  }

  void createUser({@required BuildContext context, String email, String name, String phone, String password}) async {
    SignUpModel signUpModel = await SignUpRepository.signUp(
      email: email,
      name: name,
      phone: phone,
      password: password,
      isAdmin: widget.isAdmin
    );

    if (signUpModel.status == 200) {
      setSharedPreferences(data: signUpModel.data, token: signUpModel.data.token,id: signUpModel.data.id);
      if(widget.isAdmin == true){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => CompanyDashboard()), (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => CreateCv()), (route) => false);
      }
    }
  }
}
