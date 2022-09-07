import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/core/place_notifier/category_notifier.dart';
import 'package:travel_kuy_app/screens/details/detail_screen.dart';

import '../../../shared/theme.dart';

class LakeCategoryPage extends StatefulWidget {
  const LakeCategoryPage({Key? key}) : super(key: key);

  @override
  State<LakeCategoryPage> createState() => _LakeCategoryPageState();
}

class _LakeCategoryPageState extends State<LakeCategoryPage> {
  String placeholder =
      "https://tekno.esportsku.com/wp-content/uploads/2020/08/Tips-Mengatasi-Error-404-Not-Found-di-PC.png";
  @override
  void initState() {
    super.initState();
    final lakeModel = Provider.of<LakeClass>(context, listen: false);
    lakeModel.getCatagoryPlaces();
  }

  @override
  Widget build(BuildContext context) {
    final lakeModel = Provider.of<LakeClass>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lake'),
        backgroundColor: blackBackgroundColor,
      ),
      backgroundColor: blackBackgroundColor,
      body: GridView.builder(
          padding: defaultPadding,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: lakeModel.lake?.length ?? 3,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 30, crossAxisSpacing: 20),
          itemBuilder: (context, index) {
            final item = lakeModel.lake?[index];
            return InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(
                    placeModel: item,
                  );
                }));
              },
              onLongPress: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      item?.name ?? "Loading..",
                      style: regularText.copyWith(fontSize: 14),
                    ),
                  ),
                );
              },
              child: item?.gallery[0] == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        item!.gallery[0],
                        fit: BoxFit.cover,
                      )),
            );
          }),
    );
  }
}
