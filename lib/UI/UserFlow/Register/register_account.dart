import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentRegister/profile_creation_one.dart';
import 'package:mandobi_mobile_app/UI/UserFlow/Register/otp_verification.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/user_registration_model.dart';
import 'package:mandobi_mobile_app/Widgets/app_bar_two_items.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_one.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_two.dart';
import 'package:mandobi_mobile_app/Widgets/custom_text_field.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/margin_below_appbar.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class RegisterAccount extends StatefulWidget {

  RegisterAccount({Key? key}) : super(key: key);

  @override
  State<RegisterAccount> createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {
  bool registerIsVisible = true;
  bool confirmPasswordIsVisible = true;
  bool checkValue = false;
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserRegistrationModel>.reactive(
      viewModelBuilder: () => locator<UserRegistrationModel>(),
      disposeViewModel: false,
      onModelReady: (model) {},
      builder: (context, model, child) {
        return DefaultTabController(
          length: 2,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                body: Column(
                  children: [
                    HorizontalMargin(
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // SizedBox(
                          //   height: context.getPadding().top,
                          // ),
                          TopMargin(),
                          AppBarTwoItems(
                            text: "Register Your Account",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: HorizontalMargin(
                        widget: Column(
                          children: [
                            MarginBelowAppBar(),
                            Container(
                              //alignment: Alignment.topCenter,
                              width: 22.8.i,
                              height: 22.8.i,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: 22.i,
                                    height: 22.i,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: ColorUtils.lightBlue),
                                    ),
                                    child: ClipOval(
                                        child: model.registrationProfileFileImage ==
                                                null
                                            ?
                                            /*model.registrationProfileFileImage == null
                                                ? model.usersModel.user_image != null
                                                ? CachedNetworkImage(
                                              imageUrl: model.usersModel.user_image ?? '',
                                              width: 20.i,
                                              height: 20.i,
                                              fit: BoxFit.cover,
                                            )
                                                : */
                                            Center(
                                                child: SvgPicture.asset(
                                                  ImageUtils.defaultAvatar,
                                                  fit: BoxFit.contain,
                                                  width: 8.i,
                                                  height: 8.i,
                                                ),
                                              )
                                            : Image.file(
                                                model
                                                    .registrationProfileFileImage!,
                                                width: 8.i,
                                                height: 8.i,
                                                fit: BoxFit.cover,
                                              )),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 1.h),
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: PopupMenuButton(
                                        offset: Offset(50, -5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: ColorUtils.blue3,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.white,
                                                width: 1.5),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.all(6.0),
                                            child: SvgPicture.asset(ImageUtils
                                                .registerProfileSelectImage),
                                          ),
                                        ),
                                        itemBuilder: (_) =>
                                            <PopupMenuItem<String>>[
                                          new PopupMenuItem<String>(
                                            child: new Text('Camera'),
                                            value: 'Camera',
                                            onTap: () async {
                                              await model
                                                  .registrationProfileOpenCamera();
                                            },
                                          ),
                                          new PopupMenuItem<String>(
                                            child: new Text('Gallery'),
                                            value: 'Gallery',
                                            onTap: () async {
                                              await model
                                                  .registrationProfileGetImage();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 1.h,),
                            SizedBox(
                              height: 6.5.h,
                              child: AppBar(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ),
                                ),
                                elevation: 0,
                                backgroundColor: ColorUtils.silver8,
                                bottom: TabBar(
                                  onTap: (value) {
                                    setState(() {
                                      selectedTabIndex = value;
                                    });
                                  },
                                  indicator: UnderlineTabIndicator(
                                    borderSide: BorderSide(
                                        width: 2.0,
                                        color: ColorUtils.lightBlue),
                                    insets: EdgeInsets.symmetric(
                                        horizontal: 10.w),
                                  ),
                                  indicatorColor: ColorUtils.lightBlue,
                                  labelColor: ColorUtils.lightBlue,
                                  unselectedLabelColor:
                                      ColorUtils.silver9.withOpacity(0.5),
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
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        CustomTextField(
                                          prefixRequired: false,
                                          suffixRequired: false,
                                          hintText: "Full Name",
                                          textInputType: TextInputType.name,
                                          controller:
                                              model.registerNameController,
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        CustomTextField(
                                          prefixRequired: false,
                                          suffixRequired: true,
                                          svgImage: ImageUtils.checkIcon,
                                          hintText: "Email",
                                          textInputType:
                                              TextInputType.emailAddress,
                                          controller:
                                              model.registerEmailController,
                                          suffixImageWidth: 10.i,
                                          suffixImageHeight: 10.i,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        IntlPhoneField(
                                          decoration: InputDecoration(
                                            counter: Text(""),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            focusedBorder: OutlineInputBorder(
                                              // width: 0.0 produces a thin "hairline" border
                                              borderSide: BorderSide(
                                                  color: ColorUtils.lightBlue),
                                            ),
                                            labelText: 'Phone Number',
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(),
                                            ),
                                          ),
                                          initialCountryCode: 'AE',
                                          onChanged: (phone) {
                                            print(phone.completeNumber);
                                          },
                                        ),
                                        CustomTextField(
                                          prefixRequired: false,
                                          suffixRequired: false,
                                          svgImage: ImageUtils.checkIcon,
                                          hintText: "Address",
                                          textInputType: TextInputType.text,
                                          controller:
                                              model.registerAddressController,
                                        ),
                                        SizedBox(
                                          height: 1.5.h,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          child: TextField(
                                            controller: model
                                                .registerPasswordController,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            obscureText: registerIsVisible,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 5.w,
                                                      vertical: 2.5.h),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: ColorUtils.black
                                                        .withOpacity(0.5),
                                                    width: 1),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                                borderSide: BorderSide(
                                                    color: ColorUtils.lightBlue,
                                                    width: 1.5),
                                              ),
                                              hintText: "Password",
                                              hintStyle: TextStyle(
                                                  color: ColorUtils.black
                                                      .withOpacity(0.5)),
                                              suffixIcon: IconButton(
                                                icon: registerIsVisible
                                                    ? const Icon(
                                                        Icons.visibility_off)
                                                    : const Icon(
                                                        Icons.visibility),
                                                color: const Color(0xFFDEDEDE),
                                                onPressed: () {
                                                  setState(() {
                                                    registerIsVisible =
                                                        !registerIsVisible;
                                                  });
                                                },
                                                splashColor: Colors.transparent,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.5.h,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          child: TextField(
                                            controller: model
                                                .registerConfirmPasswordController,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            obscureText:
                                                confirmPasswordIsVisible,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 5.w,
                                                      vertical: 2.5.h),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: ColorUtils.black
                                                        .withOpacity(0.5),
                                                    width: 1),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                                borderSide: BorderSide(
                                                    color: ColorUtils.lightBlue,
                                                    width: 1.5),
                                              ),
                                              hintText: "Confirm Password",
                                              hintStyle: TextStyle(
                                                  color: ColorUtils.black
                                                      .withOpacity(0.5)),
                                              suffixIcon: IconButton(
                                                icon: confirmPasswordIsVisible
                                                    ? const Icon(
                                                        Icons.visibility_off)
                                                    : const Icon(
                                                        Icons.visibility),
                                                color: const Color(0xFFDEDEDE),
                                                onPressed: () {
                                                  setState(() {
                                                    confirmPasswordIsVisible =
                                                        !confirmPasswordIsVisible;
                                                  });
                                                },
                                                splashColor: Colors.transparent,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        CustomButtonOne(
                                          onButtonPressed: () {
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    child: OTPVerification()));
                                          },
                                          textValue: "Continue",
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 1.5.h,
                                        ),
                                        CustomTextField(
                                          prefixRequired: false,
                                          suffixRequired: false,
                                          hintText: "Full Name",
                                          textInputType: TextInputType.name,
                                          controller:
                                              model.registerNameController,
                                        ),
                                        SizedBox(
                                          height: 1.5.h,
                                        ),
                                        CustomTextField(
                                          prefixRequired: false,
                                          suffixRequired: true,
                                          svgImage: ImageUtils.checkIcon,
                                          hintText: "Email",
                                          textInputType:
                                              TextInputType.emailAddress,
                                          controller:
                                              model.registerEmailController,
                                          suffixImageWidth: 10.i,
                                          suffixImageHeight: 10.i,
                                        ),
                                        SizedBox(
                                          height: 1.5.h,
                                        ),
                                        IntlPhoneField(
                                          decoration: InputDecoration(
                                            counter: Text(""),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            focusedBorder: OutlineInputBorder(
                                              // width: 0.0 produces a thin "hairline" border
                                              borderSide: BorderSide(
                                                  color: ColorUtils.lightBlue),
                                            ),
                                            labelText: 'Phone Number',
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(),
                                            ),
                                          ),
                                          initialCountryCode: 'AE',
                                          onChanged: (phone) {
                                            print(phone.completeNumber);
                                          },
                                        ),
                                        CustomTextField(
                                          prefixRequired: false,
                                          suffixRequired: false,
                                          svgImage: ImageUtils.checkIcon,
                                          hintText: "Address",
                                          textInputType: TextInputType.text,
                                          controller:
                                              model.registerAddressController,
                                        ),
                                        SizedBox(
                                          height: 1.5.h,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          child: TextField(
                                            controller: model
                                                .registerPasswordController,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            obscureText: registerIsVisible,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 5.w,
                                                      vertical: 2.5.h),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: ColorUtils.black
                                                        .withOpacity(0.5),
                                                    width: 1),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                                borderSide: BorderSide(
                                                    color: ColorUtils.lightBlue,
                                                    width: 1.5),
                                              ),
                                              hintText: "Password",
                                              hintStyle: TextStyle(
                                                  color: ColorUtils.black
                                                      .withOpacity(0.5)),
                                              suffixIcon: IconButton(
                                                icon: registerIsVisible
                                                    ? const Icon(
                                                        Icons.visibility_off)
                                                    : const Icon(
                                                        Icons.visibility),
                                                color: const Color(0xFFDEDEDE),
                                                onPressed: () {
                                                  setState(() {
                                                    registerIsVisible =
                                                        !registerIsVisible;
                                                  });
                                                },
                                                splashColor: Colors.transparent,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.5.h,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          child: TextField(
                                            controller: model
                                                .registerConfirmPasswordController,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            obscureText:
                                                confirmPasswordIsVisible,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 5.w,
                                                      vertical: 2.5.h),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: ColorUtils.black
                                                        .withOpacity(0.5),
                                                    width: 1),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                                borderSide: BorderSide(
                                                    color: ColorUtils.lightBlue,
                                                    width: 1.5),
                                              ),
                                              hintText: "Confirm Password",
                                              hintStyle: TextStyle(
                                                  color: ColorUtils.black
                                                      .withOpacity(0.5)),
                                              suffixIcon: IconButton(
                                                icon: confirmPasswordIsVisible
                                                    ? const Icon(
                                                        Icons.visibility_off)
                                                    : const Icon(
                                                        Icons.visibility),
                                                color: const Color(0xFFDEDEDE),
                                                onPressed: () {
                                                  setState(() {
                                                    confirmPasswordIsVisible =
                                                        !confirmPasswordIsVisible;
                                                  });
                                                },
                                                splashColor: Colors.transparent,
                                              ),
                                            ),
                                          ),
                                        ),
                                       /* Row(
                                          children: [
                                            Checkbox(
                                              value: checkValue,
                                              onChanged: (value) {
                                                setState(() {
                                                  checkValue = value!;
                                                });
                                              },
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "I accept the",
                                                    style: TextStyle(
                                                      fontFamily: FontUtils
                                                          .poppinsRegular,
                                                      fontSize:
                                                          Fontsizes.size10,
                                                      color: ColorUtils.black,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        ' terms and conditions',
                                                    style: TextStyle(
                                                      fontFamily: FontUtils
                                                          .poppinsRegular,
                                                      fontSize:
                                                          Fontsizes.size10,
                                                      color:
                                                          ColorUtils.lightBlue,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ), */
                                        SizedBox(
                                          height: 1.5.h,
                                        ),
                                        CustomButtonOne(
                                          onButtonPressed: () {
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    child: AgentProfileCreationOne()));
                                          },
                                          textValue: "Continue",
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
