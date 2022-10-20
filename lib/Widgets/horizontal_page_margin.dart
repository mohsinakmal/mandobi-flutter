import 'package:flutter/material.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';

class HorizontalMargin extends StatelessWidget {

  final Widget? widget;

  const HorizontalMargin({this.widget, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      child: widget,
    );
  }
}
