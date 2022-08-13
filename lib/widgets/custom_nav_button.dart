import 'dart:ui';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomNavButton extends StatelessWidget {
  CustomNavButton(
      {Key? key,
      this.sigmaX,
      this.sigmaY,
      this.height,
      this.width,
      this.borderRadius,
      this.bgColor,
      this.child})
      : super(key: key);
  double? sigmaX, sigmaY, height, width;
  BorderRadius? borderRadius;
  Color? bgColor;
  Icon? icon;
  Widget? child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(100),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigmaX ?? 5, sigmaY: sigmaY ?? 5),
          child: Container(
            height: height ?? 45,
            width: width ?? 45,
            decoration: BoxDecoration(
                color: bgColor ?? Colors.black87.withOpacity(0.1),
                borderRadius: BorderRadius.circular(100)),
            child: child,
          ),
        ),
      ),
    );
  }
}
