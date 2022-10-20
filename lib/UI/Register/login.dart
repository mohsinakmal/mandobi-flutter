import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/user_registration_model.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_one.dart';
import 'package:mandobi_mobile_app/Widgets/custom_text_field.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:stacked/stacked.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

   bool loginIsVisible = true;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserRegistrationModel>.reactive(
        viewModelBuilder: () => locator<UserRegistrationModel>(),
        disposeViewModel: false,
        onModelReady: (model){},
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
                              color: ColorUtils.darkBlue
                          ),
                        ),
                        SizedBox(height: 6.h,),
                        CustomTextField(
                          controller: model.loginEmailController,
                          textInputType: TextInputType.emailAddress,
                          hintText: "Email address",
                          prefixRequired: true,
                          prefixIconData: Icons.email_outlined,
                        ),
                        SizedBox(height: 3.h,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: TextField(
                            controller: model.loginPasswordController,
                            style: const TextStyle(color: Colors.black),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: loginIsVisible,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: ColorUtils.black.withOpacity(0.5), width: 1),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                              focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: ColorUtils.lightBlue, width: 1.5),
                              ),
                              hintText: "Password",
                              hintStyle:  TextStyle(color: ColorUtils.black.withOpacity(0.5)),
                              prefixIcon:  Icon(
                                Icons.lock,
                                color: ColorUtils.blue1,
                              ),
                              suffixIcon: IconButton(
                                icon: loginIsVisible ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                                color: const Color(0xFFDEDEDE),
                                onPressed: () {
                                  setState(() {
                                    loginIsVisible = !loginIsVisible;
                                  });
                                },
                                splashColor: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h,),
                        CustomButtonOne(
                          onButtonPressed: (){},
                          textValue: "Login",
                        ),
                        SizedBox(height: 1.5.h,),
                        Container(
                          margin: EdgeInsets.only(right: 5.w),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text("Forgot Password",
                              style: TextStyle(
                                  fontFamily: FontUtils.poppinsRegular,
                                  fontSize: 1.6.t,
                                  color: ColorUtils.blue2
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(ImageUtils.horizontalLine),
                            Text("Or continue with",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: FontUtils.poppinsRegular,
                                  fontSize: 1.8.t,
                                  color: ColorUtils.blue2
                              ),
                            ),
                            SvgPicture.asset(ImageUtils.horizontalLine),
                          ],
                        ),
                        SizedBox(height: 2.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(color: ColorUtils.black.withOpacity(0.15)),
                                borderRadius: BorderRadius.circular(16),
                                //color: ColorUtils.black.withOpacity(0.5),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
                                  child: SvgPicture.asset(ImageUtils.facebookLogo)),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(color: ColorUtils.black.withOpacity(0.15)),
                                borderRadius: BorderRadius.circular(16),
                                //color: ColorUtils.black.withOpacity(0.5),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
                                  child: SvgPicture.asset(ImageUtils.googleLogo)),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(color: ColorUtils.black.withOpacity(0.15)),
                                borderRadius: BorderRadius.circular(16),
                                //color: ColorUtils.black.withOpacity(0.5),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
                                  child: SvgPicture.asset(ImageUtils.appleLogo)),
                            ),
                          ],
                        ),
                        SizedBox(height: 3.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don’t have an account?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: FontUtils.poppinsRegular,
                                  fontSize: 1.8.t,
                                  color: ColorUtils.blue2
                              ),
                            ),
                            SizedBox(width: 1.w,),
                            Text("Sign Up",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: FontUtils.poppinsBold,
                                  fontSize: 1.8.t,
                                  color: ColorUtils.blue2
                              ),
                            ),
                          ],
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
