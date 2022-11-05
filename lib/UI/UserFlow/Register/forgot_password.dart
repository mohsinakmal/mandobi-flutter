import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/UserFlow/Register/forgot_password_otp.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/user_registration_model.dart';
import 'package:mandobi_mobile_app/Widgets/app_bar_two_items.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_one.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  bool otpMethod1 = false;
  bool otpMethod2 = false;

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
                        AppBarTwoItems(
                          text: "Forgot Password",
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
                        Text("Select which contact details should we use to reset your password",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 0.25.h,
                              fontFamily: FontUtils.poppinsRegular,
                              fontSize: 1.9.t,
                              color: ColorUtils.grey
                          ),
                        ),
                        SizedBox(height: 4.h,),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              otpMethod1 = true;
                              otpMethod2 = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: otpMethod1 == false ?
                              ColorUtils.black.withOpacity(0.2) : ColorUtils.lightBlue),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorUtils.blue4,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(17.0),
                                      child: SvgPicture.asset(
                                          ImageUtils.sms,
                                        width: 5.i,
                                        height: 5.i,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 4.w,),
                                  Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("via SMS",
                                          style: TextStyle(
                                              fontFamily: FontUtils.poppinsRegular,
                                              fontSize: 1.7.t,
                                              color: ColorUtils.grey
                                          ),
                                        ),
                                        SizedBox(height: 0.5.h,),
                                        Text("+1 111 ******999",
                                          style: TextStyle(
                                              fontFamily: FontUtils.poppinsRegular,
                                              fontSize: 1.85.t,
                                              color: ColorUtils.black1
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.5.h,),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              otpMethod1 = false;
                              otpMethod2 = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: otpMethod2 == false ?
                              ColorUtils.black.withOpacity(0.2) : ColorUtils.lightBlue),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorUtils.blue4,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(17.0),
                                      child: Image.asset(ImageUtils.emailBlue,
                                        width: 5.i,
                                        height: 5.i,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 4.w,),
                                  Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("via Email",
                                          style: TextStyle(
                                              fontFamily: FontUtils.poppinsRegular,
                                              fontSize: 1.7.t,
                                              color: ColorUtils.grey
                                          ),
                                        ),
                                        SizedBox(height: 0.5.h,),
                                        Text("m.jam****@email.com",
                                          style: TextStyle(
                                              fontFamily: FontUtils.poppinsRegular,
                                              fontSize: 1.85.t,
                                              color: ColorUtils.black1
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 6.h,),
                        CustomButtonOne(
                          onButtonPressed: (){
                            Navigator.push(context,
                                PageTransition(type: PageTransitionType.fade, child:  ForgotPasswordOtp()));
                          },
                          textValue: "Continue",
                        ),
                        SizedBox(height: 4.h,),
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
