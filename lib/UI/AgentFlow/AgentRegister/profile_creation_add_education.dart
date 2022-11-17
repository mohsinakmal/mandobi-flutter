import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentRegister/profile_creation_two.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/agent_registration_model.dart';
import 'package:mandobi_mobile_app/Widgets/app_bar_two_items.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_one.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class ProfileCreationAddEducation extends StatefulWidget {
  ProfileCreationAddEducation({Key? key}) : super(key: key);

  @override
  State<ProfileCreationAddEducation> createState() => _ProfileCreationAddEducationState();
}

class _ProfileCreationAddEducationState extends State<ProfileCreationAddEducation> with TickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      value: 0.4,
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {});
    });
    //controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
                          text: "Profile Creation",
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: HorizontalMargin(
                            widget: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: ColorUtils.lightBlue)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Image.asset(
                                          ImageUtils.userPic,
                                          height: 15.i,
                                          width: 15.i,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Syed Ali Raza",
                                          style: TextStyle(
                                              fontFamily:
                                              FontUtils.poppinsMedium,
                                              fontSize: 2.t,
                                              color: ColorUtils.black),
                                        ),
                                        SizedBox(
                                          height: 0.5.h,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                                  2.1,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                  border: Border.all(
                                                      color: ColorUtils
                                                          .lightBlue)),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                                child: LinearProgressIndicator(
                                                  minHeight: 1.h,
                                                  backgroundColor:
                                                  ColorUtils.white,
                                                  color: ColorUtils.lightBlue,
                                                  value: controller.value,
                                                  semanticsLabel:
                                                  'Linear progress indicator',
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Text(
                                              "40%",
                                              style: TextStyle(
                                                  fontFamily:
                                                  FontUtils.poppinsRegular,
                                                  fontSize: Fontsizes.size12,
                                                  color: ColorUtils.lightBlue),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Add Education",
                                      style: TextStyle(
                                        fontFamily: FontUtils.poppinsSemiBold,
                                        fontSize: Fontsizes.size14,
                                        color: ColorUtils.black,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 4.w),
                                      child: Text(
                                        "+ Add",
                                        style: TextStyle(
                                          fontFamily: FontUtils.poppinsMedium,
                                          fontSize: Fontsizes.size11,
                                          color: ColorUtils.blue3,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2.h),
                                Container(
                                  //padding: EdgeInsets.only(bottom: 9.5.h),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(
                                        Radius.circular(6)),
                                    color: ColorUtils.lightBlue,
                                  ),
                                  padding: EdgeInsets.only(
                                      bottom: 0.5.h),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: ColorUtils.white,
                                        borderRadius:
                                        BorderRadius.all(
                                            Radius.circular(
                                                6)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey
                                                .withOpacity(
                                                0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset:
                                            Offset(0, 3),
                                          ),
                                        ]
                                    ),
                                    //margin: EdgeInsets.symmetric(horizontal: 2.w),
                                    child: Padding(
                                      padding:
                                      EdgeInsets.symmetric(
                                          horizontal: 4.w,
                                          vertical: 2.h),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: ColorUtils.black.withOpacity(0.5),
                                                ),
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.all(
                                                      7.0),
                                                  child: SvgPicture.asset(
                                                      ImageUtils.redCross,
                                                    width: 3.i,
                                                    height: 3.i,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                decoration:
                                                BoxDecoration(
                                                  shape: BoxShape
                                                      .rectangle,
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      5),
                                                  color: ColorUtils
                                                      .lightBlue
                                                      .withOpacity(
                                                      0.1),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                      4.5.w,
                                                      vertical:
                                                      2.h),
                                                  child: SvgPicture.asset(
                                                      ImageUtils
                                                          .blueBriefCase),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 3.w,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    "Business Management",
                                                    style: TextStyle(
                                                        fontFamily:
                                                        FontUtils
                                                            .poppinsSemiBold,
                                                        fontSize:
                                                        Fontsizes
                                                            .size13,
                                                        color: ColorUtils
                                                            .black),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                    0.25.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "United Arab Emirates University",
                                                        style: TextStyle(
                                                            fontFamily:
                                                            FontUtils
                                                                .poppinsRegular,
                                                            fontSize:
                                                            Fontsizes
                                                                .size12,
                                                            color: ColorUtils
                                                                .blue4),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        HorizontalMargin(
                          widget: CustomButtonOne(
                            textValue: "Next",
                            onButtonPressed: (){
                              Navigator.push(context,
                                  PageTransition(type: PageTransitionType.fade, child: AgentProfileCreationTwo(forEducation: false,)));
                            },
                          ),
                        ),
                        SizedBox(height: 2.h,),
                        // Bookings List
                      ],
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
