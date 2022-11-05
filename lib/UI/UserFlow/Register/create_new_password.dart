import 'package:flutter/material.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/UserFlow/Register/login.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/user_registration_model.dart';
import 'package:mandobi_mobile_app/Widgets/app_bar_two_items.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_one.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {

  bool createNewPasswordIsVisible = true;
  bool createNewConfirmPasswordIsVisible = true;

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
              body: Column(
                children: [
                  Expanded(
                    child: HorizontalMargin(
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: context.getPadding().top,
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              AppBarTwoItems(
                                text: "Create New Password",
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Image.asset(ImageUtils.bell,
                                width: 50.i,
                                height: 50.i,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: TextField(
                                  controller: model.createNewPasswordController,
                                  style: const TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: createNewPasswordIsVisible,
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
                                      icon: createNewPasswordIsVisible ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                                      color: const Color(0xFFDEDEDE),
                                      onPressed: () {
                                        setState(() {
                                          createNewPasswordIsVisible = !createNewPasswordIsVisible;
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
                                  controller: model.createNewConfirmPasswordController,
                                  style: const TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: createNewConfirmPasswordIsVisible,
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
                                      icon: createNewConfirmPasswordIsVisible ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                                      color: const Color(0xFFDEDEDE),
                                      onPressed: () {
                                        setState(() {
                                          createNewConfirmPasswordIsVisible = !createNewConfirmPasswordIsVisible;
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
                  ),
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
                  SizedBox(height: 6.h,),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
