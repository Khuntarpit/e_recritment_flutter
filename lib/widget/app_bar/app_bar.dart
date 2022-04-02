import 'package:e_recruitment/config/app_colors.dart';
import 'package:e_recruitment/config/image_path.dart';
import 'package:flutter/material.dart';

Widget appbar({
  @required context,
  String title,
  bool isTitle = false,
  double appBarHeight,
  BorderRadius borderRadius,
  Widget appbarActionWidget,
}) {
  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: [AppColors.gradientYellow, AppColors.gradientRed], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        borderRadius: borderRadius ?? BorderRadius.circular(0)),
    child: Center(
      child: AppBar(
        toolbarHeight: AppBar().preferredSize.height / 1,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: appbarActionWidget != null ? [appbarActionWidget] : null,
        title: Text(isTitle ? title : ''),
        elevation: 0.0,
      ),
    ),
  );
}

Widget imageAppbar({
  String imagePath,
  String title,
  String subTitle,
  Function onTapCall,
}) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [AppColors.gradientYellow, AppColors.gradientRed], begin: Alignment.topCenter, end: Alignment.bottomCenter),
    ),
    child: AppBar(
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: imagePath != null
                        ? NetworkImage(
                            imagePath,
                          )
                        : AssetImage(
                            ImagePath.profileImage,
                          ),
                    fit: BoxFit.cover)),
            /*child: imagePath != null
                  ? Image.network(
                      imagePath,
                      height: 55,
                    )
                  : Image.asset(
                      ImagePath.profileImage,
                      height: 55,
                    )*/
          ),
          SizedBox(
            width: 7,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                    fontSize: 15,
                  )),
              Text(subTitle, style: TextStyle(fontSize: 11, color: AppColors.textFieldColor.withOpacity(0.7))),
            ],
          ),
        ],
      ),
      elevation: 0,
      actions: [
        IconButton(icon: Icon(Icons.phone), onPressed: onTapCall),
      ],
    ),
  );
}
