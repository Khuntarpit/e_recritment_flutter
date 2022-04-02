import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/card_veiw.dart';
import 'package:e_recruitment/widget/common/navigate_button.dart';
import 'package:e_recruitment/widget/common/style.dart';
import 'package:e_recruitment/widget/common/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RearrangeScreen extends StatefulWidget {
  @override
  _RearrangeScreenState createState() => _RearrangeScreenState();
}

class _RearrangeScreenState extends State<RearrangeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          appbar(context: context, title: 'Rearrange', isTitle: true),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                color: AppColors.textFieldColor,
                boxShadow: newBoxShadow,
                borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                cardView(
                    title: 'Personal Details',
                    onTap: () {
                      _showMaterialDialog(context);
                    }),
                Divider(
                  color: AppColors.greyColor,
                ),
                cardView(title: 'Education', onTap: () {
                  _showMaterialDialog(context);
                }),
                Divider(
                  color: AppColors.greyColor,
                ),
                cardView(title: 'Experience', onTap: () {
                  _showMaterialDialog(context);
                }),
                Divider(
                  color: AppColors.greyColor,
                ),
                cardView(title: 'Skills', onTap: () {
                  _showMaterialDialog(context);
                }),
                Divider(
                  color: AppColors.greyColor,
                ),
                cardView(title: 'Objective', onTap: () {
                  _showMaterialDialog(context);
                }),
                Divider(
                  color: AppColors.greyColor,
                ),
                cardView(title: 'Reference', onTap: () {
                  _showMaterialDialog(context);
                }),
                Divider(
                  color: AppColors.greyColor,
                ),
                cardView(title: 'Projects', onTap: () {
                  _showMaterialDialog(context);
                }),
                Divider(
                  color: AppColors.greyColor,
                ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
          Spacer(),
          commonButton(
            title: 'SAVE',
            isExpand: 50,
            isExpandHeight: 13,
            textSize: 16,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  _showMaterialDialog(context) {
    showDialog(
      context: context,
      builder: (context) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            height: 250,
            decoration: BoxDecoration(
                color: AppColors.backGroundColor,
                boxShadow: newBoxShadow,
                borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: [
                appbar(
                    context: context,
                    isTitle: true,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    title: 'Edit Title',
                    appBarHeight: MediaQuery.of(context).size.height / 14),
                SizedBox(height: 20,),
                textField(hintText: 'Objective'),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      commonButton(
                          title: 'CANCEL',
                          isExpandHeight: 13,
                          isExpand: 40,
                          onTap: () {Get.back();}),
                      commonButton(
                          title: 'SAVE',
                          isExpandHeight: 13,
                          isExpand: 40,
                          onTap: () {})
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
