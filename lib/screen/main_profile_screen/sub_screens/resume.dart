import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/Job_card_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesScreen extends StatefulWidget {
  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appbar(context: context, isTitle: true, title: 'Services'),
          // commonTextField(hintText: 'search', preFixIcon: Icons.search_rounded),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  jobCardView(
                     resumeScreenSize: true,
                      imagePath: ImagePath.e_recruitment,
                      resumeDescription: "Find a job",
                      resumeDescription2: "Post a job",
                      itemDescription: 'E-Recruitment India is a global online employment solution for people seeking jobs and the employers who need great people.',
                      title: 'E - Recruitment',
                      subTitle: 'Job Solution',
                      thirdTitle: 'Employment Solutions',
                      onTap: () {
                        launch("https://erecruitmentindia.wixsite.com/jobsolution");
                      }),
                  jobCardView(
                      resumeScreenSize: true,
                      imagePath: ImagePath.friender_meetup,
                      resumeDescription: "Find Friends",
                      resumeDescription2: "Meet Friends",
                      itemDescription: 'Distance is just a test to see how far love can travel ❤✈ Friender Meetup Inc. is an Indian social media and technology company based in Surat, India.',
                      title: 'Friender Meetup',
                      thirdTitle: 'Indian Social Media',
                      subTitle: 'IT Consulting & Services',
                      onTap: () {
                        launch("https://friendermeetup.wixsite.com/konstantinfotech");
                      }),
                  jobCardView(
                      resumeScreenSize: true,
                      imagePath: ImagePath.the_gujarat_news,
                      resumeDescription: "Top News Stories From Gujarat, India and World",
                      resumeDescription2: "Gujarat's largest media house",
                      itemDescription: 'Spreading Gujjuness Worldwide! 😊 Leading Gujarati News Media. Get all Breaking News Headlines from India and World.',
                      title: 'The Gujarat News',
                      subTitle: 'Only Facts',
                      thirdTitle: 'One of The Top Leading Gujarati News Media',
                      onTap: () {
                        launch("https://thegujaratnews.com");
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
