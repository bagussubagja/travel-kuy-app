import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  final List<String> _teamMemberName = [
    "Bagus Subagja",
    "Daffa Almer Fauzan",
    "Fajar Muhammad Al-Hijri",
    "Nikita Sabila",
    "Ravena",
  ];

  final List<String> _teamMemberRoles = [
    "Fullstack Developer",
    "Back-end Developer",
    "Front-end Developer",
    "UI/UX & Dokumentasi",
    "UI/UX & Dokumentasi",
  ];

  final List<String> _teamMemberPictures = [
    "assets/images/bagus.png",
    "assets/images/daffa.png",
    "assets/images/fajar.png",
    "assets/images/nikita.png",
    "assets/images/ravena.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackBackgroundColor,
        elevation: 0,
      ),
      backgroundColor: blackBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: defaultPadding,
          child: ListView(
            children: [
              Text(
                'About Us',
                style: titleText,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: LottieBuilder.asset('assets/lottie/login.json'),
              ),
              Text(
                'Travel-Kuy App Mobile to introduce so many beatiful Indonesia place to visit!',
                style: regularText,
                textAlign: TextAlign.center,
              ),
              MarginHeight(height: 10),
              ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                _teamMemberPictures[index],
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _teamMemberName[index],
                                style: regularText,
                              ),
                              Text(
                                _teamMemberRoles[index],
                                style: subTitleText,
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return MarginHeight(height: 10);
                  },
                  itemCount: _teamMemberName.length)
            ],
          ),
        ),
      ),
    );
  }
}
