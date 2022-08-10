import 'package:flutter/material.dart';

class ReviewWidget extends StatelessWidget {
  ReviewWidget({Key? key}) : super(key: key);
  List<String> nameReviewer = [
    "Faja Pratama",
    "Farhan Pradipta",
    "Riyandi Arif Rahman"
  ];
  List<String> review = ["Lorem Ipsum Dolor Sit Amet.", "Terbaik", "Terbaik"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(nameReviewer[index]),
          subtitle: Text(review[index]),
        ),
      ),
      itemCount: nameReviewer.length,
    );
  }
}
