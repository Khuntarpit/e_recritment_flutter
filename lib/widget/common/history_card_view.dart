import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/widget/common/style.dart';
import 'package:flutter/material.dart';

Widget historyCardView({
  @required BuildContext context,
  String date,
  String imagePath,
  bool isComplete = false,
  double progress =0,
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
    decoration: BoxDecoration(
        color: AppColors.textFieldColor,
        boxShadow: newBoxShadow,
        borderRadius: BorderRadius.circular(15)),
    child: Column(
      children: [
        Container(

          child: Row(
            children: [
              Container(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 82,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Android Developer',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.5),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'googleasiant Technolabs',
                    style: TextStyle(fontSize: 13),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        ImagePath.cal_2,
                        height: 17,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Applied on',
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        date,
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: progress == 100 ?[
            Text(
              '',
              style: TextStyle(fontSize: 13, color: AppColors.gradientRed),
            ),
            Text(
              'Complete',
              style: TextStyle(fontSize: 14,color: Colors.green),
            )
          ] :[
            Text(
              'PROCESSING',
              style: TextStyle(fontSize: 13, color: AppColors.gradientRed),
            ),
            Text(
              'CHECK STATUS >',
              style: TextStyle(fontSize: 13),
            )
          ],
        ),
        SliderTheme(
          child: Slider(
            value: progress,
            max: 100,
            min: 0,
            activeColor: progress == 100 ? Colors.green: AppColors.gradientRed,
            inactiveColor: AppColors.gradientRed.withOpacity(0.5),
            onChanged: (double value) {},
          ),
          data: SliderThemeData(
            trackShape: CustomTrackShape(),
              // trackHeight: 4,
            trackHeight: 3,
              thumbColor: Colors.transparent,
              thumbShape:  RoundSliderThumbShape(enabledThumbRadius: 0.0))),
      ],
    ),
  );
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}