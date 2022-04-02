import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/screen/main_profile_screen/sub_screens/job_apply_screen.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/Job_card_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class InternShipScreen extends StatefulWidget {
  bool internShip;
  String cvImage;
  String name;
  String phone;

  InternShipScreen({this.internShip = false, this.phone, this.cvImage, this.name});

  @override
  _InternShipScreenState createState() => _InternShipScreenState();
}

class _InternShipScreenState extends State<InternShipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appbar(context: context, isTitle: true, title: widget.internShip == true ? 'InternShip' : 'Jobs'),
          // commonTextField(hintText: 'search', preFixIcon: Icons.search_rounded),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  jobCardView(
                      imagePath: ImagePath.g_logo,
                      title: 'Android Developer',
                      subTitle: 'googleasiant Technolabs',
                      onTap: () {
                        Get.to(() => JobApplyScreen(
                              name: widget.name,
                              phone: widget.phone,
                              cvImage: widget.cvImage,
                            ));
                      }),
                  jobCardView(
                      imagePath: ImagePath.fb_logo,
                      title: 'Graphics Designer',
                      subTitle: 'Googleasiant.com',
                      onTap: () {
                        Get.to(() => JobApplyScreen(
                              name: widget.name,
                              phone: widget.phone,
                              cvImage: widget.cvImage,
                            ));
                      }),
                  jobCardView(
                      imagePath: ImagePath.g_logo,
                      title: 'UI / UX Developer',
                      subTitle: 'Googleasiant.com',
                      onTap: () {
                        Get.to(() => JobApplyScreen(
                              name: widget.name,
                              phone: widget.phone,
                              cvImage: widget.cvImage,
                            ));
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
