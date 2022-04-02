import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/screen/login_screen/login_screen.dart';
import 'package:e_recruitment/screen/main_profile_screen/main_profile_screen.dart';
import 'package:e_recruitment/screen/sign_up_screen/sign_up_screen.dart';
import 'package:e_recruitment/utils/common/tost_message.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/facebook_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpWithGoogle extends StatefulWidget {
  @override
  _SignUpWithGoogleState createState() => _SignUpWithGoogleState();
}

class _SignUpWithGoogleState extends State<SignUpWithGoogle> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appbar(context: context),
          Spacer(),
          // googleButton(
          //   onTap: () async {
          //     setState(() {
          //       _isSigningIn = true;
          //     });
          //
          //     // User user = await Authentication.signInWithGoogle(context: context);
          //     //
          //     // setState(() {
          //     //   _isSigningIn = false;
          //     // });
          //
          //     // if (user != null) {
          //     //   showToastMessage(context: context,message: 'Login Successfully');
          //     //   Navigator.of(context).pushReplacement(
          //     //     MaterialPageRoute(
          //     //       builder: (context) => MainProfileScreen(
          //     //         user: user,
          //     //       ),
          //     //     ),
          //     //   );
          //     // }
          //   },
          //   title: 'GOOGLE',
          //   textColor: AppColors.googleLogoColor,
          //   imagePath: ImagePath.googleLogo,
          // ),
          googleButton(
              isText: true,
              onTap2: () {
                Get.to(() => SignUpScreen(isAdmin: false,));
              }),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an Account ?'),
              TextButton(
                  child: Text('LOG IN'),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  }),
            ],
          ),
          // TextButton(onPressed: () {}, child: Text('Already have an Account ? LOG IN'))
        ],
      ),
    );
  }
}
