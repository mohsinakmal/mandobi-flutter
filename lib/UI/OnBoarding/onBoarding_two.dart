import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/UI/Register/login.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/Widgets/app_bar_two_items.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_one.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_two.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:page_transition/page_transition.dart';

class OnBoardingTwo extends StatelessWidget {
  const OnBoardingTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: HorizontalMargin(
          widget: Column(
            children: [
              SizedBox(
                height: context.getPadding().top,
              ),
              TopMargin(),
              // AppBarTwoItems(
              //   text: "",
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 6.h,),
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
                        color: ColorUtils.darkBlue
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
                  SizedBox(height: 12.h,),
                  CustomButtonOne(
                    onButtonPressed: () {
                      Navigator.push(context,
                          PageTransition(type: PageTransitionType.fade, child:  LoginScreen()));
                    },
                    textValue: "Next",
                  ),
                  SizedBox(height: 1.5.h,),
                  CustomButtonTwo(
                    onButtonPressed: () {
                      Navigator.push(context,
                          PageTransition(type: PageTransitionType.fade, child:  LoginScreen()));
                    },
                    textValue: "Skip",
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
