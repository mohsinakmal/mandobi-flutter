import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/user_registration_model.dart';
import 'package:mandobi_mobile_app/Widgets/bottom_navigation_bar.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_one.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:stacked/stacked.dart';

class OTPVerification extends StatelessWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserRegistrationModel>.reactive(
      viewModelBuilder: () => locator<UserRegistrationModel>(),
      disposeViewModel: false,
      onModelReady: (model) {},
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            top: false,
            bottom: false,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: HorizontalMargin(
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: context.getPadding().top,
                      ),
                      TopMargin(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorUtils.lightBlue.withOpacity(0.1),
                              ),
                              padding: EdgeInsets.all(16),
                              child: SvgPicture.asset(ImageUtils.blueArrow)
                          ),
                          // SizedBox(width: 16.w,),
                          Text("OTP Verification",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: FontUtils.poppinsRegular,
                                fontSize: 2.t,
                                color: ColorUtils.darkBlue
                            ),
                          ),
                          Text("   ")

                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Image.asset(ImageUtils.bell,
                        width: 50.i,
                        height: 50.i,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text("Code has been send to \n+1 111 ****999",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 0.25.h,
                            fontFamily: FontUtils.poppinsRegular,
                            fontSize: 1.9.t,
                            color: ColorUtils.grey
                        ),
                      ),
                      SizedBox(height: 4.h,),
                      PinCodeTextField(
                        /*onDone: (value){

                        },*/
                        pinBoxOuterPadding: EdgeInsets.symmetric(horizontal: 1.5.w),
                        //controller: model.forgotPasswordController,
                        pinTextAnimatedSwitcherTransition:
                        ProvidedPinBoxTextAnimation.scalingTransition,
                        pinTextAnimatedSwitcherDuration:
                        Duration(milliseconds: 300),
                        highlightPinBoxColor: ColorUtils.silver,
                        maxLength: 4,
                        pinBoxWidth: 16.w,
                        pinBoxRadius: 6,
                        pinBoxHeight: 10.h,
                        pinBoxColor: Colors.transparent,
                        defaultBorderColor: ColorUtils.black.withOpacity(0.2),
                        hasTextBorderColor: ColorUtils.blue3,
                        pinBoxBorderWidth: 1.5,
                        keyboardType: TextInputType.number,
                        pinTextStyle: TextStyle(
                          fontFamily: FontUtils.poppinsBold,
                          //fontWeight: FontWeight.w400,
                          fontSize: 3.t,
                        ),
                      ),
                      SizedBox(height: 3.h,),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Resend",
                              style: TextStyle(
                                fontFamily: FontUtils.poppinsBold,
                                fontSize: 2.t,
                                color: ColorUtils.lightBlue,
                              ),
                            ),
                            TextSpan(
                              text: ' code in',
                              style: TextStyle(
                                fontFamily: FontUtils.poppinsRegular,
                                fontSize: 2.t,
                                color: ColorUtils.grey,
                              ),
                            ),
                            TextSpan(
                              text: ' 55',
                              style: TextStyle(
                                fontFamily: FontUtils.poppinsRegular,
                                fontSize: 2.t,
                                color: ColorUtils.lightBlue,
                              ),
                            ),
                            TextSpan(
                              text: ' sec',
                              style: TextStyle(
                                fontFamily: FontUtils.poppinsRegular,
                                fontSize: 2.t,
                                color: ColorUtils.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 13.h,),
                      CustomButtonOne(
                        textValue: "Submit",
                        onButtonPressed: (){
                          Navigator.push(context,
                              PageTransition(type: PageTransitionType.fade, child:  MyBottomNavBar(index: 0, fromAgent: false,)));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
