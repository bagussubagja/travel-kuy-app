import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/core/place_notifier/category_notifier.dart';
import 'package:travel_kuy_app/screens/details/detail_screen.dart';

import '../../../shared/theme.dart';

class ParkCategoryPage extends StatefulWidget {
  const ParkCategoryPage({Key? key}) : super(key: key);

  @override
  State<ParkCategoryPage> createState() => _ParkCategoryPageState();
}

class _ParkCategoryPageState extends State<ParkCategoryPage> {
  String placeholder =
      "https://tekno.esportsku.com/wp-content/uploads/2020/08/Tips-Mengatasi-Error-404-Not-Found-di-PC.png";
  @override
  void initState() {
    super.initState();
    final parkModel = Provider.of<ParkClass>(context, listen: false);
    parkModel.getCatagoryPlaces();
  }

  @override
  Widget build(BuildContext context) {
    final parkModel = Provider.of<ParkClass>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Park'),
        backgroundColor: blackBackgroundColor,
      ),
      backgroundColor: blackBackgroundColor,
      body: GridView.builder(
          padding: defaultPadding,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: parkModel.park?.length ?? 3,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 30, crossAxisSpacing: 20),
          itemBuilder: (context, index) {
            final item = parkModel.park?[index];
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
