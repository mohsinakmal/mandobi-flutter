import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_one.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_two.dart';

class OnBoardingTwo extends StatelessWidget {
  const OnBoardingTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 9.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 17.h,),
              Align(
                alignment: Alignment.center,
                child: Image.asset(ImageUtils.alKhalifa,
                  height: 15.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 5.h,),
              Text("Lorem Ipsum is simply dummy content",
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 0.22.h,
                    fontFamily: FontUtils.poppinsRegular,
                    fontSize: 2.75.t,
                    color: ColorUtils.DarkBlue
                ),
              ),
              SizedBox(height: 3.h,),
              Text("Lorem Ipsum is simply dummy text of the printing and industry. ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 0.22.h,
                    fontFamily: FontUtils.poppinsRegular,
                    fontSize: 1.8.t,
                    color: ColorUtils.grey
                ),
              ),
              SizedBox(height: 8.h,),
              SvgPicture.asset(ImageUtils.indicators),
              SizedBox(height: 8.h,),
              CustomButtonOne(
                onButtonPressed: () {

                },
                textValue: "Next",
              ),
              SizedBox(height: 3.h,),
              CustomButtonTwo(
                onButtonPressed: () {

                },
                textValue: "Skip",
              )
            ],
          ),
        ),
      ),
    );
  }
}
