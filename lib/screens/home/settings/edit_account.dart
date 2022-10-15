// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/core/auth_notifier/auth_notifier.dart';
import 'package:travel_kuy_app/core/user_notifier/user_notifier.dart';
import 'package:travel_kuy_app/models/user_model.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/my_textfield.dart';

class EditAccount extends StatefulWidget {
  String? name;
  EditAccount({this.name, super.key});

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  String? idUser;
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserClass>(context, listen: false);
    ReadCache.getString(key: "cache").then((value) {
      setState(() {
        user.getUserData(idUser: value);
        idUser = value;
      });
    });
    return Scaffold(
      backgroundColor: blackBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Edit your account',
          style: regularText,
        ),
        backgroundColor: blackBackgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: defaultPadding,
          child: ListView(
            shrinkWrap: true,
            children: [
              MyTextField(
                titleText: "Name",
                hintText: user.user?[0].name,
                controller: nameController,
              ),
              ElevatedButton(
                onPressed: () async {
                  UserModel userUpdate = UserModel(name: nameController.text);
                  final update =
                      Provider.of<UserPostDataClass>(context, listen: false);
                  await update.postData(userUpdate, idUser!, context);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: greenDarkerColor,
                ),
                child: Text(
                  'Update',
                  style: regularText,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
