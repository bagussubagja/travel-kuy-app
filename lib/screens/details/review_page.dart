import 'package:flutter/material.dart';

import '../../shared/theme.dart';
import '../../widgets/margin_widget_height.dart';

class ReviewPage extends StatelessWidget {
  ReviewPage({Key? key}) : super(key: key);

  List<String> reviewerName = [
    "Alif Ilman Nafian",
    "M. Faja Sumitra",
    "Riyandi Firman Pratama"
  ];

  List<String> reviewerTestimony = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. ",
  ];

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: detailPagePadding,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Review', style: titleText),
        MarginHeight(height: 10),
        SizedBox(
          height: MediaQuery.of(context).size.height / 2.5,
          child: Scrollbar(
            controller: _scrollController,
            thumbVisibility: true,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              controller: _scrollController,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  reviewerName[index],
                  style: regularText,
                ),
                subtitle: Text(
                  reviewerTestimony[index],
                  style: subTitleText,
                ),
                leading: Image.asset('assets/images/avatar.png'),
              ),
              itemCount: reviewerName.length,
            ),
          ),
        ),
      ]),
    );
  }
}
