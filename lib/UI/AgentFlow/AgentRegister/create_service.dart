import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/agent_registration_model.dart';
import 'package:mandobi_mobile_app/Widgets/app_bar_two_items.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_one.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/text_field_spaces.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:stacked/stacked.dart';

import '../../../Widgets/margin_below_appbar.dart';

class ProfileCreationCreateService extends StatefulWidget {
  const ProfileCreationCreateService({Key? key}) : super(key: key);

  @override
  State<ProfileCreationCreateService> createState() => _ProfileCreationCreateServiceState();
}

class _ProfileCreationCreateServiceState extends State<ProfileCreationCreateService> {
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
                          text: "Create Service",
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
                                      hintText: "Service Name",
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
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Documents Required",
                                      style: TextStyle(
                                        fontFamily: FontUtils.poppinsSemiBold,
                                        fontSize: Fontsizes.size14,
                                        color: ColorUtils.black,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 4.w),
                                      child: Text(
                                        "+ Add More",
                                        style: TextStyle(
                                          fontFamily: FontUtils.poppinsMedium,
                                          fontSize: Fontsizes.size11,
                                          color: ColorUtils.blue3,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TextFieldSpace(),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: ColorUtils.silver12,
                                    borderRadius: BorderRadius.circular(6)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(ImageUtils.docIcon),
                                            SizedBox(width: 3.w,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Lorem Ipsum.doc",
                                                  style: TextStyle(
                                                    fontFamily: FontUtils.poppinsMedium,
                                                    fontSize: Fontsizes.size14,
                                                    color: ColorUtils.black,
                                                  ),
                                                ),
                                                SizedBox(height: 0.5.h,),
                                                Text(
                                                  "15kb",
                                                  style: TextStyle(
                                                    fontFamily: FontUtils.poppinsMedium,
                                                    fontSize: Fontsizes.size11,
                                                    color: ColorUtils.lightBlue9,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: ColorUtils.grey4
                                          ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: SvgPicture.asset(ImageUtils.crossWhite),
                                            ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                TextFieldSpace(),
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: ColorUtils.silver12,
                                      borderRadius: BorderRadius.circular(6)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(ImageUtils.pdfIcon,
                                            width: 7.i,
                                              height: 7.i,
                                            ),
                                            SizedBox(width: 3.w,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Lorem Ipsum.pdf",
                                                  style: TextStyle(
                                                    fontFamily: FontUtils.poppinsMedium,
                                                    fontSize: Fontsizes.size14,
                                                    color: ColorUtils.black,
                                                  ),
                                                ),
                                                SizedBox(height: 0.5.h,),
                                                Text(
                                                  "15kb",
                                                  style: TextStyle(
                                                    fontFamily: FontUtils.poppinsMedium,
                                                    fontSize: Fontsizes.size11,
                                                    color: ColorUtils.lightBlue9,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorUtils.grey4
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SvgPicture.asset(ImageUtils.crossWhite),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
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
                                  textValue: "Save",
                                ),
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
