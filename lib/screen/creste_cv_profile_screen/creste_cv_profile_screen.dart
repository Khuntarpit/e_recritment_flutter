import 'dart:io';

import 'package:e_recruitment/config/app_constant.dart';
import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/model/cv_model.dart';
import 'package:e_recruitment/repository/cv_repository.dart';
import 'package:e_recruitment/screen/creste_cv_profile_screen/sub_screen/education_screen.dart';
import 'package:e_recruitment/screen/creste_cv_profile_screen/sub_screen/experience_screen.dart';
import 'package:e_recruitment/screen/creste_cv_profile_screen/sub_screen/help_screen.dart';
import 'package:e_recruitment/screen/creste_cv_profile_screen/sub_screen/objective_screen.dart';
import 'package:e_recruitment/screen/creste_cv_profile_screen/sub_screen/personal_deatils_screen.dart';
import 'package:e_recruitment/screen/creste_cv_profile_screen/sub_screen/project_screen.dart';
import 'package:e_recruitment/screen/creste_cv_profile_screen/sub_screen/reference_screen.dart';
import 'package:e_recruitment/screen/creste_cv_profile_screen/sub_screen/skill_screen.dart';
import 'package:e_recruitment/screen/main_profile_screen/main_profile_screen.dart';
import 'package:e_recruitment/utils/common/tost_message.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/listview.dart';
import 'package:e_recruitment/widget/common/navigate_button.dart';
import 'package:e_recruitment/widget/common/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateCvProfile extends StatefulWidget {
  @override
  _CreateCvProfileState createState() => _CreateCvProfileState();
}

class _CreateCvProfileState extends State<CreateCvProfile> {
  Data data = Data();
  File image;
  String name;
  String address;
  String email;
  String phone;
  String degree;
  String university;
  String grade;
  String year;
  String companyName;
  String jobTitle;
  String jobExperience;
  String startDate;
  String endDate;
  String details;
  String skill;
  String objective;
  String refName;
  String refJobTitle;
  String refCompanyName;
  String refEmail;
  String refPhone;
  String projectTitle;
  String projectDescription;
  String help;
  String examResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appbar(context: context, isTitle: true, title: 'Profile'),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  titleText(title: 'Sections'),
                  commonListView(
                      title: 'Personal Detail',
                      imagePath: ImagePath.user,
                      isShowFillDataTrue: name == null ? false : true,
                      onTap: () {
                        Get.to(() => PersonalDetails(
                              name: name,
                              phone: phone,
                              email: email,
                              address: address,
                              image: image,
                              addressData: (v) {
                                setState(() {
                                  address = v;
                                });
                              },
                              emailData: (v) {
                                setState(() {
                                  email = v;
                                });
                              },
                              nameData: (v) {
                                setState(() {
                                  name = v;
                                });
                              },
                              phoneData: (v) {
                                setState(() {
                                  phone = v;
                                });
                              },
                              imageData: (v) {
                                setState(() {
                                  image = v;
                                });
                              },
                            ));
                      }),
                  commonListView(
                      isShowFillDataTrue: university == null ? false : true,
                      title: 'Educations',
                      imagePath: ImagePath.education,
                      onTap: () {
                        print('image !! $image');
                        Get.to(() => EducationScreen(
                              year: year,
                              university: university,
                              grade: grade,
                              degree: degree,
                              degreeData: (v) {
                                setState(() {
                                  degree = v;
                                });
                              },
                              gradeData: (v) {
                                setState(() {
                                  grade = v;
                                });
                              },
                              universityData: (v) {
                                setState(() {
                                  university = v;
                                });
                              },
                              yearData: (v) {
                                setState(() {
                                  year = v;
                                });
                              },
                            ));
                      }),
                  commonListView(
                      isShowFillDataTrue: companyName == null ? false : true,
                      title: 'Experience (OPTIONAL)',
                      imagePath: ImagePath.professional,
                      onTap: () {
                        Get.to(() => ExperienceScreen(
                              startDate: startDate,
                              jobTitle: jobTitle,
                              endDate: endDate,
                              jobExperience: jobExperience,
                              details: details,
                              companyName: companyName,
                              companyNameData: (v) {
                                setState(() {
                                  companyName = v;
                                });
                              },
                              detailsData: (v) {
                                setState(() {
                                  details = v;
                                });
                              },
                              jobExperienceData: (v) {
                                setState(() {
                                  jobExperience = v;
                                });
                              },
                              endDateData: (v) {
                                setState(() {
                                  endDate = v;
                                });
                              },
                              jobTitleData: (v) {
                                setState(() {
                                  jobTitle = v;
                                });
                              },
                              startDateData: (v) {
                                setState(() {
                                  startDate = v;
                                });
                              },
                            ));
                      }),
                  //More Sections
                  titleText(title: 'More Sections (OPTIONAL)',textSize: 20),
                  commonListView(
                      isShowFillDataTrue: skill == null ? false : true,
                      title: 'Skills',
                      imagePath: ImagePath.skills,
                      onTap: () {
                        Get.to(() => SkillScreen(
                          skill: skill,
                          skillData: (v) {
                            setState(() {
                              skill = v;
                            });
                          },
                        ));
                      }),
                  commonListView(
                      isShowFillDataTrue: objective == null ? false : true,
                      title: 'Objectives',
                      imagePath: ImagePath.objective,
                      onTap: () {
                        Get.to(() => ObjectiveScreen(
                          objectiveData: (v) {
                            setState(() {
                              objective = v;
                            });
                          },
                          objective: objective,
                        ));
                      }),
                  commonListView(
                      isShowFillDataTrue:
                      refName == null || refJobTitle == null || refCompanyName == null || refEmail == null || refPhone == null ? false : true,
                      title: 'References',
                      imagePath: ImagePath.reference,
                      onTap: () {
                        Get.to(() => ReferenceScreen(
                          refPhone: refPhone,
                          refName: refName,
                          refJobTitle: refJobTitle,
                          refEmail: refEmail,
                          refCompanyName: refCompanyName,
                          refCompanyNameData: (v) {
                            setState(() {
                              refCompanyName = v;
                            });
                          },
                          refEmailData: (v) {
                            setState(() {
                              refEmail = v;
                            });
                          },
                          refJobTitleData: (v) {
                            setState(() {
                              refJobTitle = v;
                            });
                          },
                          refNameData: (v) {
                            setState(() {
                              refName = v;
                            });
                          },
                          refPhoneData: (v) {
                            setState(() {
                              refPhone = v;
                            });
                          },
                        ));
                      }),

                  commonListView(
                      isShowFillDataTrue: projectTitle == null ? false : true,
                      title: 'Projects',
                      imagePath: ImagePath.project,
                      onTap: () {
                        Get.to(() => ProjectScreen(
                              projectTitle: projectTitle,
                              projectDescription: projectDescription,
                              projectTitleData: (v) {
                                setState(() {
                                  projectTitle = v;
                                });
                              },
                              projectDescriptionData: (v) {
                                setState(() {
                                  projectDescription = v;
                                });
                              },
                            ));
                      }),

                  //Manage Sections
                  titleText(title: 'Manage Sections (OPTIONAL)',textSize: 20),
                  commonListView(
                      isShowFillDataTrue: help == null ? false : true,
                      title: 'Help',
                      imagePath: ImagePath.help,
                      onTap: () {
                        Get.to(() => HelpScreen(
                              help: help,
                              helpData: (v) {
                                setState(() {
                                  help = v;
                                });
                              },
                            ));
                      }),
                  SizedBox(
                    height: 45,
                  ),
                  commonButton(
                      title: 'SAVE PROFILE',
                      isExpandHeight: 15,
                      marginHorizontal: 110,
                      isExpand: 10,
                      onTap: () {
                        if (name == null) {
                          showToastMessage(context: context, message: 'please Fill up Personal details');
                        } else if (university == null) {
                          showToastMessage(context: context, message: 'please Fill up Education');
                        // } else if (companyName == null) {
                        //   showToastMessage(context: context, message: 'please Fill up Experience');
                        // } else if (skill == null) {
                        //   showToastMessage(context: context, message: 'please Fill up Skill');
                        // } else if (objective == null) {
                        //   showToastMessage(context: context, message: 'please Fill up Objective');
                        // } else if (refName == null) {
                        //   showToastMessage(context: context, message: 'please Fill up Reference');
                        // } else if (projectTitle == null) {
                        //   showToastMessage(context: context, message: 'please Fill up Projects');
                        } else {
                          createCv(context: context);
                        }
                      },
                      textSize: 15),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void createCv({@required BuildContext context}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var loginId = sharedPreferences.getString(PrefString.userId);
    CvModel cvModel = await CvRepository.createCv(context,
        userId: loginId,
        image: image,
        email: email,
        name: name,
        phone: phone,
        companyName: companyName,
        degree: degree,
        details: details,
        endDate: endDate,
        examResult: examResult,
        grade: grade,
        helpTips: help,
        jobTitle: jobTitle,
        jobExperience:jobExperience,
        objective: objective,
        profileAddress: address,
        projectDescription: projectDescription,
        projectTitle: projectTitle,
        refCompanyName: refCompanyName,
        refEmail: refEmail,
        refJobTitle: refJobTitle,
        refName: refName,
        refPhone: refPhone,
        skill: skill,
        startDate: startDate,
        university: university,
        year: year);
    if (cvModel.status == 200) {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setBool(PrefString.isCreatedCv, true);
      showToastMessage(context: context, message: "Your CV Successfully Created");
      // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      // sharedPreferences.setString("cvId", cvModel.data.id);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainProfileScreen()), (route) => false);
    }
  }
}
