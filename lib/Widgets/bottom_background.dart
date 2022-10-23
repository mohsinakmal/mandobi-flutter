import 'package:flutter/material.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';

class BottomBackground extends StatelessWidget {

  Widget? widget;

  BottomBackground({this.widget, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.circular(6)),
        color: ColorUtils.lightBlue,
      ),
      padding: EdgeInsets.only(bottom: 0.5.h),
      child: widget,
    );
  }
}
