
import 'package:flutter/material.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';

class CustomLabelTextField extends StatelessWidget {

  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? labelText;

  CustomLabelTextField({Key? key, this.controller, this.textInputType, this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: TextField(
          controller: controller,
          style:  TextStyle(color: ColorUtils.black),
          keyboardType: textInputType,
          decoration:  InputDecoration(
            //isDense: true,
            contentPadding: EdgeInsets.only(left: 5.w,top: 2.h, right: 2.w, bottom: 3.h),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorUtils.black.withOpacity(0.5), width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: ColorUtils.lightBlue, width: 1.5),
            ),
            labelText: labelText,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              hintStyle: TextStyle(color: ColorUtils.black.withOpacity(0.5)),
          ),
        )
    );
  }
}
