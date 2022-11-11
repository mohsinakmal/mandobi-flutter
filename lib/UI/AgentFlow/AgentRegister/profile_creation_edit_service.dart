import 'package:flutter/material.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentRegister/profile_creation_three.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/agent_registration_model.dart';
import 'package:mandobi_mobile_app/Widgets/app_bar_two_items.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_one.dart';
import 'package:mandobi_mobile_app/Widgets/custom_text_field.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/margin_below_appbar.dart';
import 'package:mandobi_mobile_app/Widgets/text_field_spaces.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class AgentProfileEditService extends StatefulWidget {
  const AgentProfileEditService({Key? key}) : super(key: key);

  @override
  State<AgentProfileEditService> createState() => _AgentProfileEditServiceState();
}

class _AgentProfileEditServiceState extends State<AgentProfileEditService> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AgentRegistrationModel>.reactive(
      viewModelBuilder: () => locator<AgentRegistrationModel>(),
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
                          text: "Edit Service",
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HorizontalMargin(
                            widget: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MarginBelowAppBar(),
                                Container(
                                  color: ColorUtils.lightBlue5,
                                  child: TextField(
                                    style:  TextStyle(
                                        color: ColorUtils.black,
                                      fontFamily: FontUtils.poppinsSemiBold,
                                      fontSize: Fontsizes.size16,
                                    ),
                                    keyboardType: TextInputType.text,
                                    decoration:  InputDecoration(
                                      //isDense: true,
                                      contentPadding: EdgeInsets.only(left: 5.w,top: 2.h, right: 2.w, bottom: 3.h),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: ColorUtils.black.withOpacity(0.5), width: 1),
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                        borderSide: BorderSide(color: ColorUtils.black.withOpacity(0.5), width: 1.5),
                                      ),
                                      hintText: "Passport Renewal",
                                      hintStyle: TextStyle(
                                          color: ColorUtils.black.withOpacity(0.5),
                                        fontFamily: FontUtils.poppinsSemiBold,
                                        fontSize: Fontsizes.size16,
                                      ),
                                    ),
                                  ),
                                ),
                                TextFieldSpace(),
                                Container(
                                  color: ColorUtils.lightBlue5,
                                  child: TextField(
                                    style:  TextStyle(
                                      color: ColorUtils.black,
                                      fontFamily: FontUtils.poppinsSemiBold,
                                      fontSize: Fontsizes.size16,
                                    ),
                                    keyboardType: TextInputType.text,
                                    decoration:  InputDecoration(
                                      //isDense: true,
                                      contentPadding: EdgeInsets.only(left: 5.w,top: 2.h, right: 2.w, bottom: 3.h),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: ColorUtils.black.withOpacity(0.5), width: 1),
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                        borderSide: BorderSide(color: ColorUtils.black.withOpacity(0.5), width: 1.5),
                                      ),
                                      hintText: "AED 200",
                                      hintStyle: TextStyle(
                                        color: ColorUtils.black,
                                        fontFamily: FontUtils.poppinsSemiBold,
                                        fontSize: Fontsizes.size16,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4.h,),
                                Text(
                                  "Documents Required",
                                  style: TextStyle(
                                    fontFamily: FontUtils.poppinsMedium,
                                    fontSize: Fontsizes.size14,
                                    color: ColorUtils.black,
                                  ),
                                ),
                                TextFieldSpace(),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        height: 15.h,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: ColorUtils.lightBlue5,
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: ColorUtils.silver6)
                                        ),
                                        child: Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(Icons.attach_file),
                                              SizedBox(height: 0.5.h,),
                                              Text(
                                                "Upload Attachments",
                                                style: TextStyle(
                                                    fontFamily: FontUtils.poppinsRegular,
                                                    fontSize: Fontsizes.size10,
                                                    color: ColorUtils.black.withOpacity(0.5)
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 3.w,),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 15.h,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: ColorUtils.lightBlue5,
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: ColorUtils.silver6)
                                        ),
                                        child: Center(
                                          child: Icon(Icons.add),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4.h,),
                                TextField(
                                  maxLines: 5,
                                  style:  TextStyle(color: ColorUtils.black),
                                  keyboardType: TextInputType.text,
                                  decoration:  InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: ColorUtils.black.withOpacity(0.5), width: 1),
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      borderSide: BorderSide(color: ColorUtils.lightBlue, width: 1.5),
                                    ),
                                    hintText: "About - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-lesopposed ",
                                    hintStyle: TextStyle(
                                      height: 0.2.h,
                                      fontFamily: FontUtils.poppinsRegular,
                                      fontSize: Fontsizes.size9,
                                      color: ColorUtils.silver10,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4.h,),
                                Text(
                                  "Payment By Milestone",
                                  style: TextStyle(
                                    fontFamily: FontUtils.poppinsMedium,
                                    fontSize: Fontsizes.size14,
                                    color: ColorUtils.black,
                                  ),
                                ),
                                TextFieldSpace(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              ImageUtils.circleGrey1,
                                              width: 18.75.i,
                                              height: 18.75.i,
                                              fit: BoxFit.cover,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Image.asset(ImageUtils.greyDotLines,
                                                width: 6.i,
                                                height: 6.i,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 2.h,),
                                        Padding(
                                          padding: EdgeInsets.only(left: 3.w),
                                          child: Text(
                                            "Initial \nPayment",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily:
                                              FontUtils.poppinsMedium,
                                              fontSize: Fontsizes.size10,
                                              color: ColorUtils.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              ImageUtils.circleGrey2,
                                              width: 20.i,
                                              height: 20.i,
                                              fit: BoxFit.cover,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Image.asset(ImageUtils.greyDotLines,
                                                width: 6.i,
                                                height: 6.i,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 2.h,),
                                        Padding(
                                          padding: EdgeInsets.only(right: 8.w),
                                          child: Text(
                                            "Document \nSubmission",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily:
                                              FontUtils.poppinsMedium,
                                              fontSize: Fontsizes.size10,
                                              color: ColorUtils.black.withOpacity(0.3),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(
                                          ImageUtils.circleGrey3,
                                          width: 20.i,
                                          height: 20.i,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(height: 2.h,),
                                        Text(
                                          "Final \nDelivery",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily:
                                            FontUtils.poppinsMedium,
                                            fontSize: Fontsizes.size10,
                                            color: ColorUtils.black.withOpacity(0.3),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4.h,),
                                CustomButtonOne(
                                  onButtonPressed: (){
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type:
                                            PageTransitionType.fade,
                                            child: AgentProfileCreationThree()));
                                  },
                                  textValue: "Done",
                                ),
                                SizedBox(height: 2.h,),
                              ],
                            ),
                          ),
                          // Bookings List
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
