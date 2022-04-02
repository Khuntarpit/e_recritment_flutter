import 'package:flutter/material.dart';

Widget titleText({
  String title,
  double textSize,
}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    alignment: Alignment.topLeft,
    child: Text(title, style: TextStyle(fontSize: textSize ?? 26,fontWeight: FontWeight.bold),),
  );
}

