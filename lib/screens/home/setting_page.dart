import 'package:cache_manager/core/delete_cache_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/core/auth_notifier/auth_notifier.dart';
import 'package:travel_kuy_app/routes/routes.dart';
import 'package:travel_kuy_app/screens/authentication/login_screen.dart';
import 'package:travel_kuy_app/screens/authentication/register_screen.dart';
import 'package:travel_kuy_app/screens/details/widgets/booking_success.dart';
import 'package:travel_kuy_app/screens/details/detail_screen.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';
import 'package:travel_kuy_app/widgets/margin_widget_width.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key? key}) : super(key: key);

  final List<String> _menuSettingName = [
    "Account",
    "Help Center",
    "About Me",
    "Log Out"
  ];
  final List<Widget> _iconList = const [
    Icon(
      Icons.person,
      color: Colors.grey,
    ),
    Icon(Icons.help_center_rounded, color: Colors.grey),
    Icon(Icons.info_outline_rounded, color: Colors.grey),
    Icon(
      Icons.logout_rounded,
      color: Colors.grey,
    )
  ];
  final List _widgetList = [
    LoginScreen(),
    RegisterScreen(),
    DetailScreen(),
    BookingSuccess()
  ];
  @override
  Widget build(BuildContext context) {
    final AuthenticationNotifier authenticationNotifier =
    Provider.of<AuthenticationNotifier>(context, listen: false);
    Future<void> signOutAction() async{
      DeleteCache.deleteKey(
          "cache", Navigator.of(context).pushNamed(AppRoutes.loginScreen));
      await authenticationNotifier.signOut(context);
    }
    return Scaffold(
      backgroundColor: blackBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: defaultPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Settings',
                  style: titleText,
                ),
                MarginHeight(height: 25),
                Center(
                  child: CircleAvatar(
                    backgroundColor: greenDarkerColor,
                    radius: 165,
                    child: CircleAvatar(
                      backgroundColor: greyColor,
                      radius: 145,
                      child: Image.asset(
                        'assets/images/avatar.png',
                        fit: BoxFit.fill,
                        scale: 8,
                      ),
                    ),
                  ),
                ),
                MarginHeight(height: 10),
                Center(
                  child: Text(
                    'Hi there, Bagus Subagja!',
                    style: regularText.copyWith(color: greyColor),
                  ),
                ),
                MarginHeight(height: 10),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.3,
                  child: ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        MarginHeight(height: 10),
                    itemCount: _menuSettingName.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () async => index == 3
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
      ),
    );
  }
}
