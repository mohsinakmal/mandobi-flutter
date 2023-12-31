import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentBooking/agent_my_bookings.dart';
import 'package:mandobi_mobile_app/UI/UserFlow/Home/checkout.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/user_mainViewModel.dart';
import 'package:mandobi_mobile_app/Widgets/app_bar_two_items.dart';
import 'package:mandobi_mobile_app/Widgets/bottom_navigation_bar.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_one.dart';
import 'package:mandobi_mobile_app/Widgets/custom_text_field.dart';
import 'package:mandobi_mobile_app/Widgets/dialogBox.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class PassportRenewal extends StatelessWidget {
  String? screenTitle;

  PassportRenewal({this.screenTitle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserMainViewModel>.reactive(
      viewModelBuilder: () => locator<UserMainViewModel>(),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HorizontalMargin(
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: context.getPadding().top,
                        ),
                        TopMargin(),
                        AppBarTwoItems(
                          text: screenTitle != "File a Dispute"
                              ? "Passport Renewal"
                              : "File a Dispute",
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          Image.asset(ImageUtils.passportService),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Container(
                                  height: 60,
                                  child: CustomTextField(
                                    textInputType: TextInputType.name,
                                    suffixRequired: false,
                                    prefixRequired: false,
                                    hintText: "Ahmed Saud",
                                  ),
                                ),
                                if (screenTitle != "File a Dispute")
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                if (screenTitle != "File a Dispute")
                                  Container(
                                    height: 60,
                                    child: CustomTextField(
                                      textInputType: TextInputType.text,
                                      suffixRequired: false,
                                      prefixRequired: false,
                                      hintText: "Emara DB 1254 north area",
                                    ),
                                  ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Container(
                                  height: 60,
                                  child: CustomTextField(
                                    textInputType: TextInputType.text,
                                    suffixRequired: false,
                                    prefixRequired: false,
                                    hintText: "Ali Raza - Agent",
                                  ),
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        height: 15.h,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: ColorUtils.lightBlue5,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: ColorUtils.silver6)),
                                        child: Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(Icons.attach_file),
                                              SizedBox(
                                                height: 0.5.h,
                                              ),
                                              Text(
                                                "Upload Attachments",
                                                style: TextStyle(
                                                    fontFamily: FontUtils
                                                        .poppinsRegular,
                                                    fontSize: Fontsizes.size10,
                                                    color: ColorUtils.black
                                                        .withOpacity(0.5)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 15.h,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: ColorUtils.lightBlue5,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: ColorUtils.silver6)),
                                        child: Center(
                                          child: Icon(Icons.add),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                TextField(
                                  maxLines: 5,
                                  style: TextStyle(color: ColorUtils.black),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              ColorUtils.black.withOpacity(0.5),
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
                                    hintText: "Note",
                                    hintStyle: TextStyle(
                                        height: 0.2.h,
                                        color:
                                            ColorUtils.black.withOpacity(0.5)),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.5.h,
                                ),
                                CustomButtonOne(
                                  onButtonPressed: () {
                                    if (screenTitle != "File a Dispute") {
                                      Navigator.push(context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: Checkout()));
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return MyCustomDialog(
                                            childWidget: Column(
                                              children: [
                                                Text(
                                                  "Dispute Submitted",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily:
                                                      FontUtils.poppinsMedium,
                                                      fontSize: Fontsizes.size22,
                                                      color: ColorUtils.black),
                                                ),
                                                //SizedBox(height: 2.h,),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 4.w),
                                                  child: Text(
                                                    "Your Dispute has been successfully submitted",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        height: 0.25.h,
                                                        fontFamily: FontUtils
                                                            .poppinsRegular,
                                                        fontSize:
                                                        Fontsizes.size10,
                                                        color:
                                                        ColorUtils.silver1),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 3.h,
                                                ),
                                                Container(
                                                  decoration: const BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(
                                                            30.0)),
                                                  ),
                                                  child: AnimatedContainer(
                                                    duration: const Duration(
                                                        milliseconds: 400),
                                                    height: 6.5.h,
                                                    //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          25),
                                                      color: ColorUtils.lightBlue,
                                                    ),
                                                    child: MaterialButton(
                                                      padding: EdgeInsets.zero,
                                                      shape:
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              25)),
                                                      onPressed: () {
                                                        //Navigator.pop(context);
                                                        Navigator.push(
                                                            context,
                                                            PageTransition(
                                                                type:
                                                                PageTransitionType
                                                                    .fade,
                                                                child:
                                                                MyBottomNavBar(index: 1,fromAgent: false,)));
                                                      },
                                                      child: Padding(
                                                        padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12.w),
                                                        child: Text(
                                                          "View Bookings",
                                                          style: TextStyle(
                                                              fontFamily: FontUtils
                                                                  .poppinsRegular,
                                                              fontSize: Fontsizes
                                                                  .size14,
                                                              color: ColorUtils
                                                                  .white),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  },
                                  textValue: "Submit",
                                ),
                                SizedBox(
                                  height: 1.h,
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
        );
      },
    );
  }
}
