import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentProfile/agent_my_profile.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/agent_registration_model.dart';
import 'package:mandobi_mobile_app/Widgets/app_bar_two_items.dart';
import 'package:mandobi_mobile_app/Widgets/back_arrow.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_one.dart';
import 'package:mandobi_mobile_app/Widgets/custom_label_text_field.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class AgentEditProfile extends StatelessWidget {
  const AgentEditProfile({Key? key}) : super(key: key);

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
                          AppBarTwoItems(
                            text: "Edit Profile",
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
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      width: 29.i,
                                      height: 29.i,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: ColorUtils.lightBlue),
                                      ),
                                      child: ClipOval(
                                          child:
                                          Center(
                                            child: Image.asset(
                                              ImageUtils.userPic,
                                              fit: BoxFit.contain,
                                              width: 25.i,
                                              height: 25.i,
                                            ),
                                          )
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 2.h),
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: PopupMenuButton(
                                          offset: Offset(50, -5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: ColorUtils.blue3,
                                              shape: BoxShape.circle,
                                              border: Border.all(color: Colors.white, width: 1.5),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(6.0),
                                              child: SvgPicture.asset(ImageUtils.registerProfileSelectImage),
                                            ),
                                          ),
                                          itemBuilder: (_) => <PopupMenuItem<String>>[
                                            new PopupMenuItem<String>(
                                              child: new Text('Camera'),
                                              value: 'Camera',
                                              onTap: () {
                                                //model.registrationProfileOpenCamera();
                                              },
                                            ),
                                            new PopupMenuItem<String>(
                                              child: new Text('Gallery'),
                                              value: 'Gallery',
                                              onTap: () {
                                                //model.registrationProfileGetImage();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    CustomLabelTextField(
                                      textInputType: TextInputType.text,
                                      labelText: "Full Name",
                                    ),
                                    SizedBox(height: 2.h,),
                                    CustomLabelTextField(
                                      textInputType: TextInputType.text,
                                      labelText: "Designation",
                                    ),
                                    SizedBox(height: 2.h,),
                                    CustomLabelTextField(
                                      textInputType: TextInputType.text,
                                      labelText: "Phone Number",
                                    ),
                                    SizedBox(height: 2.h,),
                                    CustomLabelTextField(
                                      textInputType: TextInputType.text,
                                      labelText: "Email",
                                    ),
                                    SizedBox(height: 2.h,),
                                    CustomLabelTextField(
                                      textInputType: TextInputType.text,
                                      labelText: "Location",
                                    ),
                                    SizedBox(height: 2.h,),
                                    CustomLabelTextField(
                                      textInputType: TextInputType.text,
                                      labelText: "Timings",
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
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                                      "Contractor 2016-2020",
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
                                                            Row(
                                                              children: [
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
                                                                        horizontal: 1.75.w,
                                                                        vertical: 1.h),
                                                                    child: SvgPicture.asset(ImageUtils.editIcon),
                                                                  ),
                                                                ),
                                                                SizedBox(width: 2.w,),
                                                                Container(
                                                                  decoration: BoxDecoration(
                                                                    color: ColorUtils
                                                                        .lightBlue10,
                                                                    borderRadius:
                                                                    BorderRadius.all(
                                                                        Radius.circular(
                                                                            7)),
                                                                  ),
                                                                  child: Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                        horizontal: 1.75.w,
                                                                        vertical: 1.h),
                                                                    child: SvgPicture.asset(ImageUtils.redTrash),
                                                                  ),
                                                                ),
                                                              ],
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
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      "Education",
                                      style: TextStyle(
                                          fontFamily: FontUtils.poppinsSemiBold,
                                          fontSize: 1.7.t,
                                          color: ColorUtils.black),
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
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      "Services",
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
                                                        Row(
                                                          children: [
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
                                                                    horizontal: 1.75.w,
                                                                    vertical: 1.h),
                                                                child: SvgPicture.asset(ImageUtils.editIcon),
                                                              ),
                                                            ),
                                                            SizedBox(width: 2.w,),
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                color: ColorUtils
                                                                    .lightBlue10,
                                                                borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        7)),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                    horizontal: 1.75.w,
                                                                    vertical: 1.h),
                                                                child: SvgPicture.asset(ImageUtils.redTrash),
                                                              ),
                                                            ),
                                                          ],
                                                        )
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
                                      height: 3.h,
                                    ),
                                    CustomButtonOne(
                                      textValue: "Save",
                                      onButtonPressed: (){
                                        Navigator.push(context,
                                            PageTransition(type: PageTransitionType.fade, child: AgentMyProfile()));
                                      },
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
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}
