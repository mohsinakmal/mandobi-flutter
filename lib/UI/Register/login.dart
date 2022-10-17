import 'package:flutter/material.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 9.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 12.h,),
              Align(
                alignment: Alignment.center,
                child: Image.asset(ImageUtils.loginLogo,
                  height: 20.h,
                  width: 20.h,
                  fit: BoxFit.cover,
                ),
              ),
              Text("Login to your \nAccount",
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 0.22.h,
                    fontFamily: FontUtils.poppinsRegular,
                    fontSize: 2.75.t,
                    color: ColorUtils.DarkBlue
                ),
              ),
              SizedBox(height: 3.h,),
            ],
          ),
        ),
      ),
    );
  }
}
