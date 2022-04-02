import 'package:e_recruitment/config/image_path.dart';
import 'package:e_recruitment/widget/app_bar/app_bar.dart';
import 'package:e_recruitment/widget/common/history_card_view.dart';
import 'package:flutter/material.dart';


class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appbar(context: context, isTitle: true, title: 'History'),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  historyCardView(
                    context: context,
                    imagePath: ImagePath.g_logo,
                    date: '2nd Sep',
                    progress: 100
                  ),
                  historyCardView(
                    context: context,
                    imagePath: ImagePath.fb_logo,
                    date: '28th Aug',
                    progress: 50
                  ),
                  historyCardView(
                    context: context,
                    imagePath: ImagePath.g_logo,
                    date: '25th Aug',
                    progress: 100
                  ),
                  historyCardView(
                    context: context,
                    imagePath: ImagePath.fb_logo,
                    date: '19th Aug',
                    progress: 68
                  ),
                  historyCardView(
                    context: context,
                    imagePath: ImagePath.g_logo,
                    date: '18th Aug',
                    progress: 42
                  ),
                  historyCardView(
                    context: context,
                    imagePath: ImagePath.fb_logo,
                    date: '12nd Aug',
                    progress: 100
                  ),
                  historyCardView(
                    context: context,
                    imagePath: ImagePath.g_logo,
                    date: '2nd sep',
                    progress: 50
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
