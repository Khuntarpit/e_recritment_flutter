import 'package:e_recruitment/model/cv_model.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/navigate_button.dart';
import 'package:e_recruitment/widget/common/text_field.dart';
import 'package:e_recruitment/widget/common/title_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HelpScreen extends StatefulWidget {
  String help;
  Function(String) helpData;

  HelpScreen({this.helpData, this.help});

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  Data data = Data();
  TextEditingController help = TextEditingController();

  @override
  void initState() {
    help.text = widget.help;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appbar(context: context, title: 'Help', isTitle: true),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                titleText(title: "Tips", textSize: 19),
                textField(hintText: 'Enter Tips', maxLine: 8, controller: help),
                SizedBox(height: 50,),
                commonButton(
                    title: 'SAVE',
                    isExpandHeight: 15,
                    marginHorizontal: 110,
                    isExpand: 10,
                    onTap: () {
                      data.helpTips = help.text;
                      widget.helpData(help.text);
                      Navigator.pop(context);
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
