import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/reading_card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ReadingMaterial extends StatefulWidget {
  @override
  _ReadingMaterialState createState() => _ReadingMaterialState();
}

class _ReadingMaterialState extends State<ReadingMaterial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appbar(context: context, isTitle: true, title: 'Reading Material',),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Column(
                children: [
                  readingCard(
                    title: 'A room without books is like',
                     imagePath: ImagePath.r1,
                    subTitle: 'responsive all about the books',
                    onTap: (){
                      launch("https://www.free-ebooks.net/career");
                    },
                    isFree: true
                  ),
                  readingCard(
                      title: 'A room without books is like',
                      imagePath: ImagePath.r2,
                      subTitle: 'responsive all about the books',
                      onTap: (){
                        launch("https://www.freebookcentre.net/Business/Career-management-books.html");
                      },
                      isFree: true
                  ),
                  readingCard(
                      title: 'A room without books is like',
                      imagePath: ImagePath.r1,
                      subTitle: 'responsive all about the books',
                      onTap: (){
                        launch("https://bookboon.com/en/career-ebooks");
                      },
                      isFree: true
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
