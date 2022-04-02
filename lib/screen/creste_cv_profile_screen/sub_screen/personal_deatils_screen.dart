import 'dart:io';

import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/model/cv_model.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/navigate_button.dart';
import 'package:e_recruitment/widget/common/style.dart';
import 'package:e_recruitment/widget/common/text_field.dart';
import 'package:e_recruitment/widget/common/title_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class PersonalDetails extends StatefulWidget {
  String name;
  String address;
  String email;
  String phone;
  File image;
  Function(String) nameData;
  Function(String) addressData;
  Function(String) emailData;
  Function(String) phoneData;
  Function(File) imageData;

  PersonalDetails(
      {this.addressData, this.emailData, this.nameData, this.phoneData, this.name, this.phone, this.email, this.address, this.imageData, this.image});

  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  Data data = Data();

  var pickImageFile;
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void initState() {
    name.text = widget.name;
    address.text = widget.address;
    email.text = widget.email;
    phone.text = widget.phone;
    super.initState();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            appbar(context: context, title: 'Personal Details', isTitle: true),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    titleText(title: 'Name', textSize: 19),
                    textField(hintText: 'Enter Name', controller: name, isValidate: true, validationMassage: 'Name'),
                    titleText(title: 'Address', textSize: 19),
                    textField(hintText: 'Enter Address', maxLine: 7, controller: address, isValidate: true, validationMassage: 'Address'),
                    titleText(title: 'Email', textSize: 19),
                    textField(hintText: 'Enter Email', controller: email, isValidate: true, validationMassage: 'Email', isEmailValidator: true),
                    titleText(title: 'Phone No', textSize: 19),
                    textField(hintText: 'Enter Phone No', keyBordType: TextInputType.number, controller: phone, isValidate: true, validationMassage: 'Phone'),
                    titleText(title: 'Photo ( OPTIONAL )', textSize: 19),
                    Row(
                      children: [
                       widget.image != null
                         ? Container(
                         margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                         height: 155,
                         width: 150,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             boxShadow: newBoxShadow,
                             image: DecorationImage(image: FileImage(widget.image), fit: BoxFit.cover)),
                       )
                         : pickImageFile != null
                            ? Container(
                                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                height: 155,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: newBoxShadow,
                                    image: DecorationImage(image: FileImage(pickImageFile), fit: BoxFit.cover)),
                              )
                            : Container(
                                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                height: 155,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: AppColors.textFieldColor,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: newBoxShadow,
                                ),
                              ),
                        Column(
                          children: [
                            commonButton(
                                title: pickImageFile != null ? 'Change photo' : "  Add photo  ",
                                isExpand: MediaQuery.of(context).size.width / 15,
                                isExpandHeight: 14,
                                textSize: 15,
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) => CameraDialog(
                                            imageFile: (v) {
                                              setState(() {
                                                pickImageFile = v;
                                              });
                                            },
                                          ));
                                }),
                            commonButton(
                                title: 'REMOVE',
                                isExpand: MediaQuery.of(context).size.height / 16,
                                isExpandHeight: 14,
                                textSize: 15,
                                onTap: () {
                                  setState(() {
                                    pickImageFile = null;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    commonButton(
                        title: 'SAVE',
                        isExpandHeight: 15,
                        marginHorizontal: 110,
                        isExpand: 10,
                        onTap: () {
                          if (formKey.currentState.validate()) {
                            // data.image = pickImageFile;
                            widget.nameData(name.text);
                            widget.addressData(address.text);
                            widget.emailData(email.text);
                            widget.phoneData(phone.text);
                            widget.imageData(pickImageFile);
                            Navigator.pop(context);
                          }
                        })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CameraDialog extends StatefulWidget {
  Function(File) imageFile;

  CameraDialog({
    this.imageFile,
  });

  @override
  _CameraDialogState createState() => _CameraDialogState();
}

class _CameraDialogState extends State<CameraDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(80),
          padding: EdgeInsets.all(15),
          color: AppColors.textFieldColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 15,
                  ),
                  Text('Take a pictures', style: TextStyle(fontSize: 17)),
                  IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        Navigator.pop(context);
                        await galleryConnect(galleryImage: (value) async {
                          widget.imageFile(value);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 5),
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(color: AppColors.gradientRed, borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'Gallery',
                            style: TextStyle(fontSize: 15, color: AppColors.textFieldColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        Navigator.pop(context);
                        await cameraConnect(cameraImage: (value) async {
                          widget.imageFile(value);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        margin: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(color: AppColors.gradientYellow, borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'Camera',
                            style: TextStyle(fontSize: 15, color: AppColors.textFieldColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}

cameraConnect({Function(File) cameraImage}) async {
  print('camera Picker is Called');
  // ignore: deprecated_member_use
  File img = await ImagePicker.pickImage(source: ImageSource.camera);

  if (img != null) {
    cameraImage(img);
  }
}

galleryConnect({Function(File) galleryImage}) async {
  print('gallery Picker is Called');
  // ignore: deprecated_member_use
  File gImg = await ImagePicker.pickImage(source: ImageSource.gallery);

  if (gImg != null) {
    galleryImage(gImg);
  }
}
