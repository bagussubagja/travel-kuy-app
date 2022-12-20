// ignore_for_file: must_be_immutable, prefer_is_empty

import 'package:cache_manager/core/read_cache_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/core/comment_notifier/comment_notifier.dart';
import 'package:travel_kuy_app/models/comment_model.dart';
import 'package:travel_kuy_app/models/favorite_model.dart';

import '../../models/place_model.dart';
import '../../shared/theme.dart';
import '../../widgets/margin_widget_height.dart';

class ReviewPage extends StatefulWidget {
  PlaceModel? placeModel;
  FavoriteModel? favModel;
  ReviewPage({Key? key, this.placeModel, this.favModel}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final ScrollController _scrollController = ScrollController();
  String? idUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ReadCache.getString(key: 'cache').then((value) {
      setState(() {
        idUser = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final comment = Provider.of<CommentClass>(context, listen: false);
    comment.getCommentContent(
        idPlace: widget.placeModel?.id ?? widget.favModel!.id!,
        context: context);
    return Padding(
      padding: detailPagePadding,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Comment', style: titleText),
            IconButton(
              onPressed: () {
                showDialogWithFields(context);
              },
              icon: const Icon(
                color: Colors.white,
                Icons.add,
              ),
            ),
          ],
        ),
        MarginHeight(height: 10),
        comment.com?.length == 0
            ? Column(
                children: [
                  LottieBuilder.asset('assets/lottie/not-found.json'),
                  Text(
                    "There's no review found yet",
                    style: regularText.copyWith(color: greyColor),
                  )
                ],
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height / 1.7,
                child: Scrollbar(
                  controller: _scrollController,
                  thumbVisibility: true,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: comment.com?.length ?? 0,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            iconColor: whiteColor,
                            textColor: whiteColor,
                            leading: const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/avatar.png'),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  child: RichText(
                                    text: TextSpan(
                                      text:
                                          '${comment.com?[index].users?.name}',
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Your App Font Family',
                                      ),
                                    ),
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text:
                                        '${comment.com?[index].timestamp?.substring(0, 10)}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Your App Font Family',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Text('${comment.com?[index].message}'),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: whiteColor,
                      );
                    },
                  ),
                ),
              ),
      ]),
    );
  }

  void showDialogWithFields(context) {
    showDialog(
      context: context,
      builder: (_) {
        var commentController = TextEditingController();
        return AlertDialog(
          scrollable: true,
          backgroundColor: blackBackgroundColor,
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: commentController,
                  style: regularText,
                  decoration: InputDecoration(
                      hintText: 'Komentar',
                      hintStyle: regularText.copyWith(color: greyColor)),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                CommentModel commentContent = CommentModel(
                    message: commentController.text,
                    placeTourismId:
                        widget.favModel?.id ?? widget.placeModel!.id,
                    createdAt: DateTime.now().toString(),
                    timestamp: DateTime.now().toString(),
                    userId: idUser);
                var addComment =
                    Provider.of<AddCommentClass>(context, listen: false);
                addComment.addComment(commentContent, context);
                Navigator.pop(context);
              },
              child: const Text('Send'),
            ),
          ],
        );
      },
    );
  }
}
