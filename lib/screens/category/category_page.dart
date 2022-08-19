import 'package:flutter/material.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/category_card.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';

import '../../widgets/custom_nav_button.dart';
import 'category_class.dart';

class CategoryPage extends StatelessWidget {
  CategoryClass? cc;
  CategoryPage({Key? key, this.cc}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blackBackgroundColor,
        body: Scrollbar(
          controller: _scrollController,
          child: Expanded(
            child: CustomScrollView(
              primary: false,
              slivers: [
                SliverAppBar(
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: cc?.index == 0 ? Image.asset('assets/images/beach.jpg', fit: BoxFit.fill) : Image.asset('assets/images/mountain.jpg', fit: BoxFit.fill),
                  ),
                  backgroundColor: blackBackgroundColor,
                  expandedHeight: 250,
                  leading: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black.withAlpha(50),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back, color: blackBackgroundColor),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MarginHeight(height: 15),
                        Text(
                          '${cc?.index ?? 99}',
                          style: titleText,
                        ),
                        MarginHeight(height: 5),
                        Text(
                          '"There is a feeling of satisfaction every time you walk on wet sand, feel the ocean breeze on your face."',
                          style: subTitleText,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height + 100,
                          child: GridView.builder(
                            shrinkWrap: true,
                            controller: _scrollController,
                            itemCount: 20,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 30,
                                    crossAxisSpacing: 20),
                            itemBuilder: (context, index) => SizedBox(
                              height: 100,
                              width: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  'https://source.unsplash.com/1600x900/?beach',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
