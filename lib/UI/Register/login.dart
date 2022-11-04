import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/Register/forgot_password.dart';
import 'package:mandobi_mobile_app/UI/Register/register_account.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/user_registration_model.dart';
import 'package:mandobi_mobile_app/Widgets/bottom_navigation_bar.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_one.dart';
import 'package:mandobi_mobile_app/Widgets/custom_text_field.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:page_transition/page_transition.dart';
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
          return DefaultTabController(
            length: 2,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: Colors.white,
                  body: HorizontalMargin(
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 3.h,),
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(ImageUtils.loginLogo,
                            height: 18.h,
                            width: 18.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text("Login to your \nAccount",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            //  height: 0.h,
                              fontFamily: FontUtils.poppinsRegular,
                              fontSize: 2.75.t,
                              color: ColorUtils.darkBlue
                          ),
                        ),
                        SizedBox(height: 2.h,),
                        SizedBox(
                          height: 50,
                          child: AppBar(
                            backgroundColor: ColorUtils.silver8,
                            bottom: TabBar(
                              indicator: UnderlineTabIndicator(
                                  borderSide: BorderSide(width: 2.0,
                                  color: ColorUtils.lightBlue
                                  ),
                                  insets: EdgeInsets.symmetric(horizontal:12.w),
                              ),
                              indicatorColor: ColorUtils.lightBlue,
                              labelColor: ColorUtils.lightBlue,
                              unselectedLabelColor: ColorUtils.silver9,
                              tabs: [
                                Tab(
                                  text: "Service Seeker",
                                ),
                                Tab(
                                  text: "Service Assistant",
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(height: 6.h,),
                                    CustomTextField(
                                      controller: model.loginEmailController,
                                      textInputType: TextInputType.emailAddress,
                                      hintText: "Email address",
                                      prefixRequired: true,
                                      prefixIconData: Icons.email_outlined,
                                    ),
                                    SizedBox(height: 1.5.h,),
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
                                      onButtonPressed: (){
                                        Navigator.push(context,
                                            PageTransition(type: PageTransitionType.fade, child:  MyBottomNavBar(index: 0,)));
                                      },
                                      textValue: "Login",
                                    ),
                                    SizedBox(height: 1.5.h,),
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context,
                                            PageTransition(type: PageTransitionType.fade, child:  ForgotPassword()));
                                      },
                                      child: Container(
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
                                        InkWell(
                                          onTap: (){
                                            Navigator.push(context,
                                                PageTransition(type: PageTransitionType.fade, child:  MyBottomNavBar(index: 0,)));
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              border: Border.all(color: ColorUtils.black.withOpacity(0.15)),
                                              borderRadius: BorderRadius.circular(16),
                                              //color: ColorUtils.black.withOpacity(0.5),
                                            ),
                                            child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.8.h),
                                                child: SvgPicture.asset(ImageUtils.facebookLogo)),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            Navigator.push(context,
                                                PageTransition(type: PageTransitionType.fade, child:  MyBottomNavBar(index: 0,)));

                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              border: Border.all(color: ColorUtils.black.withOpacity(0.15)),
                                              borderRadius: BorderRadius.circular(16),
                                              //color: ColorUtils.black.withOpacity(0.5),
                                            ),
                                            child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                                                child: SvgPicture.asset(ImageUtils.googleLogo)),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            Navigator.push(context,
                                                PageTransition(type: PageTransitionType.fade, child:  MyBottomNavBar(index: 0,)));
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              border: Border.all(color: ColorUtils.black.withOpacity(0.15)),
                                              borderRadius: BorderRadius.circular(16),
                                              //color: ColorUtils.black.withOpacity(0.5),
                                            ),
                                            child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                                                child: SvgPicture.asset(ImageUtils.appleLogo)),
                                          ),
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
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.push(context,
                                                PageTransition(type: PageTransitionType.fade, child:  RegisterAccount()));
                                          },
                                          child: Text("Sign Up",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: FontUtils.poppinsBold,
                                                fontSize: 1.8.t,
                                                color: ColorUtils.blue2
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 3.h,),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(height: 6.h,),
                                    CustomTextField(
                                      controller: model.loginEmailController,
                                      textInputType: TextInputType.emailAddress,
                                      hintText: "Email address",
                                      prefixRequired: true,
                                      prefixIconData: Icons.email_outlined,
                                    ),
                                    SizedBox(height: 1.5.h,),
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
                                      onButtonPressed: (){
                                        Navigator.push(context,
                                            PageTransition(type: PageTransitionType.fade, child:  MyBottomNavBar(index: 0,)));
                                      },
                                      textValue: "Login",
                                    ),
                                    SizedBox(height: 1.5.h,),
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context,
                                            PageTransition(type: PageTransitionType.fade, child:  ForgotPassword()));
                                      },
                                      child: Container(
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
                                    ),
                                    SizedBox(height: 4.h,),
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
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.push(context,
                                                PageTransition(type: PageTransitionType.fade, child:  RegisterAccount()));
                                          },
                                          child: Text("Sign Up",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: FontUtils.poppinsBold,
                                                fontSize: 1.8.t,
                                                color: ColorUtils.blue2
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 3.h,),
                                  ],
                                ),
                              )
                            ],
                          ),
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
