import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

import '../core/auth_notifier.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => AuthenticationNotifier(),)
  ];
}