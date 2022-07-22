// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:travel_kuy_app/shared/theme.dart';

class MyTextField extends StatelessWidget {
  String titleText = "";
  String? hintText;
  TextEditingController? controller;
  Widget? widget;
  Widget? prefixIcon;
  Function()? onTap;
  bool? obsecureText;
  MyTextField(
      {Key? key,
      required this.titleText,
      this.hintText,
      this.controller,
      this.widget,
      this.onTap,
      this.prefixIcon,
      this.obsecureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText.isEmpty
            ? const SizedBox.shrink()
            : Text(
                titleText,
                style: regularText,
              ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  style: regularText,
                  cursorColor: greenDarkerColor,
                  obscureText: obsecureText ?? false,
                  onTap: onTap,
                  readOnly: widget == null ? false : true,
                  controller: controller,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: greenDarkerColor)),
                    prefixIcon: prefixIcon,
                    contentPadding: const EdgeInsets.only(left: 10),
                    hintText: hintText,
                    hintStyle: regularText.copyWith(color: greyColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              widget == null
                  ? const SizedBox.shrink()
                  : Container(
                      child: widget,
                    )
            ],
          ),
        ),
      ],
    );
  }
}
