import 'package:flutter/material.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/Register/login.dart';
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

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  bool changePassOldPass = true;
  bool changePassNewPass = true;
  bool changePassConfirmPass = true;

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
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.white,
              body: Container(
                child: Column(
                  children: [
                    HorizontalMargin(
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: context.getPadding().top,
                              ),
                              TopMargin(),
                              AppBarTwoItems(text: "Change Password",),
                              SizedBox(
                                height: 5.h,
                              ),
                              Image.asset(ImageUtils.bell,
                                width: 50.i,
                                height: 50.i,
                              ),
                              SizedBox(
                                height: 0.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: TextField(
                                  //controller: model.createNewPasswordController,
                                  style: const TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: changePassOldPass,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.h),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: ColorUtils.black.withOpacity(0.5), width: 1),
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                    focusedBorder:  OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      borderSide: BorderSide(color: ColorUtils.lightBlue, width: 1.5),
                                    ),
                                    hintText: "Old Password",
                                    hintStyle:  TextStyle(color: ColorUtils.black.withOpacity(0.5)),
                                    suffixIcon: IconButton(
                                      icon: changePassOldPass ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                                      color: const Color(0xFFDEDEDE),
                                      onPressed: () {
                                        setState(() {
                                          changePassOldPass = !changePassOldPass;
                                        });
                                      },
                                      splashColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.5.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: TextField(
                                  //controller: model.createNewConfirmPasswordController,
                                  style: const TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: changePassNewPass,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.h),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: ColorUtils.black.withOpacity(0.5), width: 1),
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                    focusedBorder:  OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      borderSide: BorderSide(color: ColorUtils.lightBlue, width: 1.5),
                                    ),
                                    hintText: "New Password",
                                    hintStyle:  TextStyle(color: ColorUtils.black.withOpacity(0.5)),
                                    suffixIcon: IconButton(
                                      icon: changePassNewPass ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                                      color: const Color(0xFFDEDEDE),
                                      onPressed: () {
                                        setState(() {
                                          changePassNewPass = !changePassNewPass;
                                        });
                                      },
                                      splashColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.5.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: TextField(
                                  //controller: model.createNewConfirmPasswordController,
                                  style: const TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: changePassConfirmPass,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.h),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: ColorUtils.black.withOpacity(0.5), width: 1),
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                    focusedBorder:  OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      borderSide: BorderSide(color: ColorUtils.lightBlue, width: 1.5),
                                    ),
                                    hintText: "Confirm Password",
                                    hintStyle:  TextStyle(color: ColorUtils.black.withOpacity(0.5)),
                                    suffixIcon: IconButton(
                                      icon: changePassConfirmPass ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                                      color: const Color(0xFFDEDEDE),
                                      onPressed: () {
                                        setState(() {
                                          changePassConfirmPass = !changePassConfirmPass;
                                        });
                                      },
                                      splashColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 9.w),
                      child: CustomButtonOne(
                        onButtonPressed: (){
                          Navigator.push(context,
                              PageTransition(type: PageTransitionType.fade, child:  LoginScreen()));
                        },
                        textValue: "Update",
                      ),
                    ),
                    SizedBox(
                      height: 3.5.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
