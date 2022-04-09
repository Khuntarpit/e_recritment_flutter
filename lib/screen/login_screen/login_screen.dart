import 'dart:convert';

import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/config/app_constant.dart';
import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/model/login_model.dart';
import 'package:e_recruitment/repository/login_repository.dart';
import 'package:e_recruitment/screen/company_dashboard.dart';
import 'package:e_recruitment/screen/forgat_password/forget_passwrod.dart';
import 'package:e_recruitment/screen/main_profile_screen/main_profile_screen.dart';
import 'package:e_recruitment/screen/sign_up_screen/sign_up_screen.dart';
import 'package:e_recruitment/screen/sign_up_screen/sign_up_with_google.dart';
import 'package:e_recruitment/utils/common/tost_message.dart';
import 'package:e_recruitment/widget/common/navigate_button.dart';
import 'package:e_recruitment/widget/common/outline_border_container.dart';
import 'package:e_recruitment/widget/common/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  bool isAdmin = false;
  LoginScreen({this.isAdmin});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSelect = true;
  final formKey = GlobalKey<FormState>();
  bool passwordCheck = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 6,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage(ImagePath.appLogo))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'E - Recruitment',
                    style: TextStyle(fontSize: 23),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  commonTextField(
                    preFixIcon: Icons.email_outlined,
                    hintText: 'Email Id',
                    controller: emailController,
                    isValidate: true,
                    isEmailValidator: true,
                    validationMassage: "Email"
                  ),
                  commonTextField(
                    preFixIcon: Icons.lock_outline_rounded,
                    controller: passwordController,
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
                  if(widget.isAdmin == false) Row(
                    children: [
                      Checkbox(
                        onChanged: (v) {
                          setState(() {
                            isSelect = v;
                          });
                        },
                        value: isSelect,
                      ),
                      Text('Remember Me'),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          Get.to(() =>ForgetPassword());
                        },
                        child: Text('Forgot password'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  commonButton(
                    isExpandHeight: 15,
                    marginHorizontal: 80,
                    isExpand: 10,
                    title: 'Log in',
                    onTap: () {
                      if (formKey.currentState.validate()) {
                        login(
                          context: context,
                          email: emailController.text,
                          password: passwordController.text,

                        );
                      }
                    },
                  ),
                 if(widget.isAdmin == false) outLineBorderConatiner(
                    title: 'Sign up',
                    padding: 80,
                    onTap: () {
                      Get.to(() => SignUpScreen(isAdmin: widget.isAdmin,));
                      // Get.to(() =>SignUpWithGoogle());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void setSharedPreferences({Datam data,String token}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.setString(PrefString.loginModel, json.encode(data));
      sharedPreferences.setString(PrefString.token, token);
      sharedPreferences.setString("id", data.id);
      // sharedPreferences.setString("cvID", data.cvIds[0].id);
      sharedPreferences.setBool(PrefString.isLoginAdmin, data.role == "admin" ? false : true);
      sharedPreferences.setBool(PrefString.isCreatedCv, true);
    });
    print("isLogin------${sharedPreferences.get(PrefString.isLoginAdmin)}");
    print("Login Model------${sharedPreferences.get(PrefString.loginModel)}");
  }

  void login({@required BuildContext context, String email, String password}) async {
    LoginModel loginModel = await LoginRepository.loginUser(
      email: email,
      password: password,
      isAdmin: widget.isAdmin
    );
    if (loginModel.status == 200) {
      setSharedPreferences(data: loginModel.data, token: loginModel.data.token);
      showToastMessage(context: context, message: loginModel.message);
      print("Login--------------");
      if(widget.isAdmin){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => CompanyDashboard()), (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainProfileScreen()), (route) => false);
      }
    } else {
      showToastMessage(context: context, message: loginModel.message);
    }
  }
}
