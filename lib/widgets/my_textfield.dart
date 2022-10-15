// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:travel_kuy_app/shared/theme.dart';

class MyTextField extends StatelessWidget {
  String? titleText;
  String? hintText;
  TextEditingController? controller;
  Widget? widget;
  Widget? suffixIcon;
  Widget? prefixIcon;
  Function()? onTap;
  bool? obscureText;
  bool? readOnly;
  bool? isObscure;
  double? height;
  TextInputType? textInputType;
  MyTextField(
      {Key? key,
      this.titleText,
      this.hintText,
      this.controller,
      this.widget,
      this.onTap,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText,
      this.readOnly,
      this.isObscure,
      this.textInputType,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText == null
            ? const SizedBox.shrink()
            : Text(
                titleText!,
                style: regularText,
              ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: height ?? 50,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  style: readOnly == true
                      ? regularText.copyWith(color: greyColor)
                      : regularText,
                  cursorColor: greenDarkerColor,
                  keyboardType: textInputType,
                  obscureText: obscureText ?? false,
                  onTap: onTap,
                  readOnly: readOnly ?? false,
                  controller: controller,
                  decoration: InputDecoration(
                    suffixIcon: suffixIcon,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: greyColor)),
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
