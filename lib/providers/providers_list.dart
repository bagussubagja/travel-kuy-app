import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/core/comment_notifier/comment_notifier.dart';
import 'package:travel_kuy_app/core/fav_notifier/favorite_notifier.dart';
import 'package:travel_kuy_app/core/place_notifier/categories_place_notifier.dart';
import 'package:travel_kuy_app/core/place_notifier/statues_place_notifier.dart';
import 'package:travel_kuy_app/core/schedule_notifier/schedule_notifier.dart';
import 'package:travel_kuy_app/core/user_notifier/user_notifier.dart';

import '../core/auth_notifier/auth_notifier.dart';

class ProvidersList {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (_) => AuthenticationNotifier(),
    ),
    ChangeNotifierProvider(
      create: (_) => RecommendedClass(),
    ),
    ChangeNotifierProvider(
      create: (_) => PopularClass(),
    ),
    ChangeNotifierProvider(
      create: (_) => MostViewedClass(),
    ),
    ChangeNotifierProvider(
      create: (_) => NewlyAddedClass(),
    ),
    ChangeNotifierProvider(
      create: (_) => BeachClass(),
    ),
    ChangeNotifierProvider(
      create: (_) => IslandClass(),
    ),
    ChangeNotifierProvider(
      create: (_) => LakeClass(),
    ),
    ChangeNotifierProvider(
      create: (_) => MountainClass(),
    ),
    ChangeNotifierProvider(
      create: (_) => ParkClass(),
    ),
    ChangeNotifierProvider(
      create: (_) => WaterfallClass(),
    ),
    ChangeNotifierProvider(
      create: (_) => RegisterDataClass(),
    ),
    ChangeNotifierProvider(
      create: (_) => UserClass(),
    ),
    ChangeNotifierProvider(
      create: (_) => FavoritePlaceClass(),
    ),
    ChangeNotifierProvider(
      create: (_) => FavPostDataClass(),
    ),
    ChangeNotifierProvider(
      create: (_) => ScheduleClass(),
    ),
    ChangeNotifierProvider(
      create: (_) => SchedulePostClass(),
    ),
    ChangeNotifierProvider(
      create: (_) => UserPostDataClass(),
    ),
    ChangeNotifierProvider(
      create: (_) => CommentClass(),
    ),
    ChangeNotifierProvider(
      create: (_) => AddCommentClass(),
    ),
  ];
}
