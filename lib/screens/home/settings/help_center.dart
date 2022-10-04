import 'dart:convert';

import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/core/user_notifier/user_notifier.dart';
import 'package:travel_kuy_app/models/user_model.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/my_textfield.dart';
import 'package:http/http.dart' as http;

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  String? userName;
  String? email;
  String subject = "Problem in Travelkuy App";
  final messageController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final user = Provider.of<UserClass>(context, listen: false);
    ReadCache.getString(key: "cache").then((value) {
      setState(() {
        user.getUserData(idUser: value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserClass>(context);
    setState(() {
      userName = user.user![0].name;
      email = user.user![0].email;
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackBackgroundColor,
        title: Text(
          'Help Center',
          style: regularText,
        ),
      ),
      backgroundColor: blackBackgroundColor,
      body: SafeArea(
          child: Padding(
        padding: defaultPadding,
        child: ListView(
          children: [
            Container(
              height: 250,
              width: 250,
              child: LottieBuilder.asset('assets/lottie/help-center.json'),
            ),
            Text(
              'Tell us how we can help 👋',
              style: titleText,
            ),
            MyTextField(
              minLines: 1,
              textInputType: TextInputType.multiline,
              maxLines: 5,
              height: 120,
              controller: messageController,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await sendEmail(
                      name: userName ?? "Lorem Ipsum",
                      email: email ?? "loremipsum@gmail.com",
                      subject: subject,
                      message: messageController.text);
                  messageController.clear();
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: greenDarkerColor),
                child: Text(
                  'Send',
                  style: regularText,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  Future sendEmail(
      {required String name,
      required String email,
      required String subject,
      required String message}) async {
    final serviceId = 'service_q8vcmou';
    final templateId = 'template_1amg8xa';
    final userId = 'cLGN4ZId-V-muOwWf';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'origin': 'http://localhost'
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': name,
            'user_email': email,
            'user_subject': subject,
            'user_message': message
          }
        }));
  }
}
