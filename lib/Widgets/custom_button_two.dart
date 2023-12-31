import 'package:flutter/material.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';

class CustomButtonTwo extends StatelessWidget {

  final VoidCallback? onButtonPressed;
  final String? textValue;

  const CustomButtonTwo({this.onButtonPressed, this.textValue,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: MediaQuery.of(context).size.width / 1,
        height: 6.35.h,
        //margin: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: ColorUtils.lightBlue2,
        ),
        child: MaterialButton(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          onPressed: onButtonPressed,
          child: Text(
            textValue!,
            style: TextStyle(
                fontFamily: FontUtils.poppinsRegular,
                fontSize: 1.8.t,
                color: Colors.lightBlue),
          ),
        ),
      ),
    );
  }
}
