import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentProfile/agent_edit_profile.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/agent_registration_model.dart';
import 'package:mandobi_mobile_app/ViewModels/user_mainViewModel.dart';
import 'package:mandobi_mobile_app/Widgets/back_arrow.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class AgentMyProfile extends StatelessWidget {
  const AgentMyProfile({Key? key}) : super(key: key);

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
                  children: [
                    HorizontalMargin(
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: context.getPadding().top,
                          ),
                          TopMargin(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BackArrow(),
                              Text(
                                "My Profile",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: FontUtils.poppinsRegular,
                                    fontSize: 2.t,
                                    color: ColorUtils.darkBlue),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context,
                                      PageTransition(type: PageTransitionType.fade, child: AgentEditProfile()));
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          ColorUtils.lightBlue.withOpacity(0.1),
                                    ),
                                    padding: EdgeInsets.all(16),
                                    child: SvgPicture.asset(
                                      ImageUtils.editBlueIcon,
                                      color: ColorUtils.lightBlue,
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: HorizontalMargin(
                          widget: Column(
                            children: [
                              SizedBox(
                                height: 3.h,
                              ),
                              Container(
                                //alignment: Alignment.topCenter,
                                width: 30.i,
                                height: 30.i,
                                child: Container(
                                  width: 29.i,
                                  height: 29.i,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: ColorUtils.lightBlue),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      ImageUtils.userPic,
                                      fit: BoxFit.contain,
                                      width: 25.i,
                                      height: 25.i,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                "Syed Ali Raza",
                                style: TextStyle(
                                    fontFamily: FontUtils.poppinsMedium,
                                    fontSize: Fontsizes.size20,
                                    color: ColorUtils.black),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(
                                "Contractor",
                                style: TextStyle(
                                    fontFamily: FontUtils.poppinsRegular,
                                    fontSize: 1.6.t,
                                    color: ColorUtils.grey1),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                            ImageUtils.bluePhoneIcon),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Text(
                                          "+9 123 123 1234",
                                          style: TextStyle(
                                              fontFamily:
                                                  FontUtils.poppinsRegular,
                                              fontSize: Fontsizes.size14,
                                              color: ColorUtils.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                            ImageUtils.agentBlueEmailIcon),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Text(
                                          "syedaliraza@email.com",
                                          style: TextStyle(
                                              fontFamily:
                                                  FontUtils.poppinsRegular,
                                              fontSize: Fontsizes.size14,
                                              color: ColorUtils.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                          ImageUtils.agentBlueLocationPin,
                                          width: 5.i,
                                          height: 5.i,
                                        ),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        Text(
                                          "Emara DB 1254 north area",
                                          style: TextStyle(
                                              fontFamily:
                                                  FontUtils.poppinsRegular,
                                              fontSize: Fontsizes.size14,
                                              color: ColorUtils.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                          ImageUtils.agentBlueClockIcon,
                                          width: 5.i,
                                          height: 5.i,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          "9AM to 5PM",
                                          style: TextStyle(
                                              fontFamily:
                                                  FontUtils.poppinsRegular,
                                              fontSize: Fontsizes.size14,
                                              color: ColorUtils.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      "Experience",
                                      style: TextStyle(
                                          fontFamily: FontUtils.poppinsSemiBold,
                                          fontSize: 1.7.t,
                                          color: ColorUtils.black),
                                    ),
                                    ListView.separated(
                                      padding: EdgeInsets.zero,
                                      //padding: EdgeInsets.symmetric(horizontal: 4.w),
                                      physics: BouncingScrollPhysics(),
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          height: 1.h,
                                        );
                                      },
                                      shrinkWrap: true,
                                      itemCount: model.agentPlace.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {},
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 2.h,
                                              ),
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
                                                              Radius
                                                                  .circular(6)),
                                                      border: Border.all(
                                                          color:
                                                              model.selectedCategoryIndex ==
                                                                      index
                                                                  ? ColorUtils
                                                                      .lightBlue
                                                                  : Colors
                                                                      .white),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.5),
                                                          spreadRadius: 5,
                                                          blurRadius: 7,
                                                          offset: Offset(0, 3),
                                                        ),
                                                      ]
                                                      /*boxShadow: [
                                                  BoxShadow(blurRadius: 8.0),
                                                  BoxShadow(spreadRadius: 5),
                                                  BoxShadow(color: Colors.black, offset: Offset(0, -16)),
                                                  BoxShadow(color: Colors.black, offset: Offset(0, 16)),
                                                  BoxShadow(color: Colors.black, offset: Offset(-16, -16)),
                                                  BoxShadow(color: Colors.black, offset: Offset(-16, 16)),
                                                ],*/
                                                      ),
                                                  //margin: EdgeInsets.symmetric(horizontal: 2.w),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 4.w,
                                                            vertical: 3.h),
                                                    child: Column(
                                                      children: [
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
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            4.5
                                                                                .w,
                                                                        vertical:
                                                                            2.h),
                                                                child: SvgPicture
                                                                    .asset(ImageUtils
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
                                                                  model.agentPlace[
                                                                      index],
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
                                                                Text(
                                                                  "Contractor",
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
                                                            Expanded(
                                                              child: Align(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                child: Text(
                                                                  '2020-2021',
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
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(height: 4.h,),
                                    Text("Education",
                                      style: TextStyle(
                                          fontFamily: FontUtils.poppinsSemiBold,
                                          fontSize: 1.7.t,
                                          color: ColorUtils.black
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 2.h,
                                          ),
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
                                                      Radius
                                                          .circular(6)),
                                                  border: Border.all(
                                                      color:ColorUtils
                                                          .lightBlue),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 5,
                                                      blurRadius: 7,
                                                      offset: Offset(0, 3),
                                                    ),
                                                  ]
                                                /*boxShadow: [
                                                    BoxShadow(blurRadius: 8.0),
                                                    BoxShadow(spreadRadius: 5),
                                                    BoxShadow(color: Colors.black, offset: Offset(0, -16)),
                                                    BoxShadow(color: Colors.black, offset: Offset(0, 16)),
                                                    BoxShadow(color: Colors.black, offset: Offset(-16, -16)),
                                                    BoxShadow(color: Colors.black, offset: Offset(-16, 16)),
                                                  ],*/
                                              ),
                                              //margin: EdgeInsets.symmetric(horizontal: 2.w),
                                              child: Padding(
                                                padding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 4.w,
                                                    vertical: 3.h),
                                                child: Column(
                                                  children: [
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
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                4.5
                                                                    .w,
                                                                vertical:
                                                                2.h),
                                                            child: SvgPicture
                                                                .asset(ImageUtils
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
                                                              "American University In Dubail",
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
                                                            Text(
                                                              "2012-2015",
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
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 4.h,),
                                    Text("Services",
                                      style: TextStyle(
                                          fontFamily: FontUtils.poppinsSemiBold,
                                          fontSize: 1.7.t,
                                          color: ColorUtils.black
                                      ),
                                    ),
                                    ListView.separated(
                                      padding:
                                      EdgeInsets.zero,
                                      //padding: EdgeInsets.symmetric(horizontal: 4.w),
                                      physics: BouncingScrollPhysics(),
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          height: 0.h,
                                        );
                                      },
                                      shrinkWrap: true,
                                      itemCount: 3,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            // Navigator.push(
                                            //     context,
                                            //     PageTransition(
                                            //         type: PageTransitionType.fade,
                                            //         child: ServiceDetails()));
                                          },
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Container(
                                                padding:
                                                EdgeInsets.only(bottom: 0.5.h),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(6)),
                                                  color: ColorUtils.lightBlue,
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: ColorUtils.white,
                                                      borderRadius: BorderRadius
                                                          .all(Radius.circular(6)),
                                                      border: Border.all(
                                                          color:
                                                          model.selectedCategoryIndex ==
                                                              index
                                                              ? ColorUtils
                                                              .lightBlue
                                                              : Colors.white),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.5),
                                                          spreadRadius: 5,
                                                          blurRadius: 7,
                                                          offset: Offset(0, 3),
                                                        ),
                                                      ]),
                                                  //margin: EdgeInsets.symmetric(horizontal: 2.w),
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 3.w,
                                                        vertical: 1.5.h),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              "Passport Renewal",
                                                              style: TextStyle(
                                                                  fontFamily: FontUtils
                                                                      .poppinsRegular,
                                                                  fontSize:
                                                                  Fontsizes.size15,
                                                                  color:
                                                                  ColorUtils.black),
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            color: ColorUtils
                                                                .lightGreen2,
                                                            borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    7)),
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                horizontal: 1.w,
                                                                vertical: 0.5.h),
                                                            child:  Text(
                                                              "AED 200",
                                                              style: TextStyle(
                                                                  fontFamily: FontUtils
                                                                      .poppinsRegular,
                                                                  fontSize:
                                                                  Fontsizes.size12,
                                                                  color:
                                                                  ColorUtils.white),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
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
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}
