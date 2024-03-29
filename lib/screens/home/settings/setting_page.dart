import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/core/auth_notifier/auth_notifier.dart';
import 'package:travel_kuy_app/routes/routes.dart';
import 'package:travel_kuy_app/screens/home/settings/about_us.dart';
import 'package:travel_kuy_app/screens/home/settings/edit_account.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';
import 'package:travel_kuy_app/widgets/margin_widget_width.dart';

import '../../../core/user_notifier/user_notifier.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final List<String> _menuSettingName = ["Account", "About Us", "Log Out"];

  final List<Widget> _iconList = const [
    Icon(
      Icons.person,
      color: Colors.grey,
    ),
    Icon(Icons.info_outline_rounded, color: Colors.grey),
    Icon(
      Icons.logout_rounded,
      color: Colors.grey,
    )
  ];

  final List _widgetList = [EditAccount(), const AboutUsScreen()];

  @override
  void initState() {
    super.initState();
    final user = Provider.of<UserClass>(context, listen: false);
    ReadCache.getString(key: "cache").then((value) {
      user.getUserData(idUser: value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserClass>(context);
    final AuthenticationNotifier authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    Future<void> signOutAction() async {
      DeleteCache.deleteKey(
          "cache", Navigator.of(context).pushNamed(AppRoutes.loginScreen));
      await authenticationNotifier.signOut(context);
    }

    return Scaffold(
      backgroundColor: blackBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: defaultPadding,
          child: ListView(
            children: [
              Text(
                'Settings',
                style: titleText,
              ),
              MarginHeight(height: 25),
              user.user?.gender == "Male"
                  ? Center(
                      child: CircleAvatar(
                        backgroundColor: greyColor,
                        radius: 115,
                        child: Image.asset(
                          'assets/images/avatar.png',
                          fit: BoxFit.fill,
                          scale: 10,
                        ),
                      ),
                    )
                  : Center(
                      child: CircleAvatar(
                        backgroundColor: greyColor,
                        radius: 115,
                        child: Image.asset(
                          'assets/images/avatar1.png',
                          fit: BoxFit.fill,
                          scale: 10,
                        ),
                      ),
                    ),
              MarginHeight(height: 10),
              Center(
                child: Text(
                  'Hi there, ${user.user?.name}!',
                  style: regularText.copyWith(color: greyColor),
                ),
              ),
              MarginHeight(height: 10),
              SizedBox(
                height: 300,
                child: ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  separatorBuilder: (context, index) =>
                      MarginHeight(height: 10),
                  itemCount: _menuSettingName.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () async => index == 2
                        ? signOutAction()
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => _widgetList[index])),
                    child: Container(
                      height: 75,
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black38),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              _iconList[index],
                              MarginWidth(width: 20),
                              Text(
                                _menuSettingName[index],
                                style: regularText,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_forward_ios,
                                color: greyColor,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
