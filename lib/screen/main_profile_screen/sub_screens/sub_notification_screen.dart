import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/navigate_button.dart';
import 'package:e_recruitment/widget/common/notification_card.dart';
import 'package:e_recruitment/widget/common/style.dart';
import 'package:flutter/material.dart';

class SubNotificationScreen extends StatefulWidget {
  @override
  _SubNotificationScreenState createState() => _SubNotificationScreenState();
}

class _SubNotificationScreenState extends State<SubNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appbar(context: context, isTitle: true, title: 'Notification'),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: commonButton(
                        title: 'Clear',
                        isExpandHeight: 7,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.textFieldColor,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: newBoxShadow,
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                ImagePath.fb_logo,
                                height: 80,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    'Android Developer',
                                    style: jobTitleStyle,
                                  ),
                                  Text(
                                    'Googleasiant Technolabs',
                                    style: jobTextStyle,
                                  )
                                ],
                              ),
                              Spacer(),
                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              'Android software development is the process by which applications are created for devices running the Android operating system.')
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.textFieldColor,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: newBoxShadow,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImagePath.g_logo,
                            height: 90,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Android Developer',
                                style: jobTitleStyle,
                              ),
                              Text(
                                'Googleasiant Technolabs',
                                style: jobTextStyle,
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today_outlined,
                                    size: 17.5,
                                  ),
                                  SizedBox(width: 5,),
                                  Text(
                                    'Applied on ',
                                    style: jobTextStyle,
                                  ),
                                  SizedBox(width: 5,),
                                  Text(
                                    '2nd Sep',
                                    style: boldStyle,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    notificationCard(
                      isSelect: true,
                    ),
                    notificationCard(
                      isSelect: false,
                    ),
                    notificationCard(
                      isSelect: true,
                    ),
                    notificationCard(
                      isSelect: false,
                    ),
                    notificationCard(
                      isSelect: true,
                    ),
                    notificationCard(
                      isSelect: false,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
