import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/Home/service_details.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/user_mainViewModel.dart';
import 'package:mandobi_mobile_app/Widgets/back_arrow.dart';
import 'package:mandobi_mobile_app/Widgets/book_mark_circle.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_one.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class AboutAgent extends StatefulWidget {
  const AboutAgent({Key? key}) : super(key: key);

  @override
  State<AboutAgent> createState() => _AboutAgentState();
}

class _AboutAgentState extends State<AboutAgent>
    with SingleTickerProviderStateMixin {
  bool servicesSelected = true;
  bool ratingSelected = false;
  bool showMoreTapped = false;


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
                children: [
                  HorizontalMargin(
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                              "Agent",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: FontUtils.poppinsRegular,
                                  fontSize: 2.t,
                                  color: ColorUtils.darkBlue),
                            ),
                            BookMarkCircle()
                          ],
                        ),

                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 4.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
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
                                              "Contractor",
                                              style: TextStyle(
                                                  fontFamily: FontUtils.poppinsMedium,
                                                  fontSize: 1.3.t,
                                                  color: ColorUtils.lightBlue),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Syed Ali Raza",
                                                  style: TextStyle(
                                                      fontFamily: FontUtils.poppinsMedium,
                                                      fontSize: 2.t,
                                                      color: ColorUtils.black),
                                                ),
                                                SizedBox(width: 3.w,),
                                                SvgPicture.asset(ImageUtils.ratingStar),
                                                SizedBox(width: 1.w,),
                                                Text(
                                                  "5.5",
                                                  style: TextStyle(
                                                      fontFamily: FontUtils.poppinsMedium,
                                                      fontSize: 1.1.t,
                                                      color: ColorUtils.black),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 0.5.h,
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    ImageUtils.plainSearchIcon),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                Text(
                                                  "Emara DB 1254 north area",
                                                  style: TextStyle(
                                                      fontFamily:
                                                      FontUtils.poppinsRegular,
                                                      fontSize: 1.2.t,
                                                      color: ColorUtils.grey1),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                if(showMoreTapped)
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SvgPicture.asset(ImageUtils.bluePhoneIcon),
                                              SizedBox(
                                                width: 3.w,
                                              ),
                                              Text(
                                                "+9 123 123 1234",
                                                style: TextStyle(
                                                    fontFamily: FontUtils.poppinsRegular,
                                                    fontSize: Fontsizes.size14,
                                                    color: ColorUtils.black),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SvgPicture.asset(
                                                ImageUtils.clockIcon,
                                                width: 5.i,
                                                height: 5.i,
                                              ),
                                              SizedBox(
                                                width: 3.w,
                                              ),
                                              Text(
                                                "9AM to 5PM",
                                                style: TextStyle(
                                                    fontFamily: FontUtils.poppinsRegular,
                                                    fontSize: Fontsizes.size14,
                                                    color: ColorUtils.black),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Text(
                                        "About",
                                        style: TextStyle(
                                            fontFamily: FontUtils.poppinsSemiBold,
                                            fontSize: Fontsizes.size13,
                                            color: ColorUtils.black),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        "Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.  is simply dummy text of the printing and type setting industry. Lorem Ipsum is simply dummy text of ttting industry. ",
                                        style: TextStyle(
                                          fontFamily: FontUtils.poppinsRegular,
                                          fontSize: Fontsizes.size10,
                                          color: ColorUtils.silver1,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Text(
                                        "Experience",
                                        style: TextStyle(
                                            fontFamily: FontUtils.poppinsSemiBold,
                                            fontSize: Fontsizes.size13,
                                            color: ColorUtils.black),
                                      ),
                                      SizedBox(
                                        height: 0.5.h,
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
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(6)),
                                                    color: ColorUtils.lightBlue,
                                                  ),
                                                  padding: EdgeInsets.only(bottom: 0.5.h),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: ColorUtils.white,
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(6)),
                                                        border: Border.all(
                                                            color:
                                                            model.selectedCategoryIndex ==
                                                                index
                                                                ? ColorUtils.lightBlue
                                                                : Colors.white),
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
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: 4.w, vertical: 3.h),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                  shape: BoxShape.rectangle,
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      5),
                                                                  color: ColorUtils
                                                                      .lightBlue
                                                                      .withOpacity(0.1),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                  EdgeInsets.symmetric(
                                                                      horizontal: 4.5.w,
                                                                      vertical: 2.h),
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
                                                                    model.agentPlace[index],
                                                                    style: TextStyle(
                                                                        fontFamily: FontUtils
                                                                            .poppinsSemiBold,
                                                                        fontSize: Fontsizes
                                                                            .size13,
                                                                        color: ColorUtils
                                                                            .black),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 0.25.h,
                                                                  ),
                                                                  Text(
                                                                    "Contractor",
                                                                    style: TextStyle(
                                                                        fontFamily: FontUtils
                                                                            .poppinsRegular,
                                                                        fontSize: Fontsizes
                                                                            .size12,
                                                                        color: ColorUtils
                                                                            .blue4),
                                                                  ),
                                                                ],
                                                              ),
                                                              Expanded(
                                                                child: Align(
                                                                  alignment:
                                                                  Alignment.centerRight,
                                                                  child: Text(
                                                                    '2020-2021',
                                                                    style: TextStyle(
                                                                        fontFamily: FontUtils
                                                                            .poppinsSemiBold,
                                                                        fontSize: Fontsizes
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
                                    ],
                                  ),
                                if(showMoreTapped)
                                SizedBox(
                                  height: 3.h,
                                ),
                                Center(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)),
                                    ),
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 400),
                                      height: 5.5.h,
                                      //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(color: ColorUtils.lightBlue),
                                      ),
                                      child: MaterialButton(
                                        padding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25)),
                                        onPressed: () {
                                          if(!showMoreTapped){
                                            showMoreTapped = true;
                                            setState(() {

                                            });
                                          }
                                          else{
                                            showMoreTapped = false;
                                            setState(() {

                                            });
                                          }
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                                          child: Text(showMoreTapped ? "Show Less" : "Show More",
                                            style: TextStyle(
                                                fontFamily: FontUtils.poppinsRegular,
                                                fontSize: Fontsizes.size11,
                                                color: ColorUtils.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)),
                                      border:
                                      Border.all(color: ColorUtils.lightBlue)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25.0)),
                                          ),
                                          child: AnimatedContainer(
                                            duration: Duration(milliseconds: 400),
                                            height: 6.5.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(25),
                                              color: servicesSelected == true
                                                  ? ColorUtils.lightBlue
                                                  : Colors.white,
                                              //border: Border.all(color: ColorUtils.lightBlue),
                                            ),
                                            child: MaterialButton(
                                              padding: EdgeInsets.zero,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(25)),
                                              onPressed: () {
                                                setState(() {
                                                  servicesSelected = true;
                                                  ratingSelected = false;
                                                });
                                              },
                                              child: Text(
                                                "Services",
                                                style: TextStyle(
                                                    fontFamily:
                                                    FontUtils.poppinsRegular,
                                                    fontSize: Fontsizes.size14,
                                                    color: servicesSelected == true
                                                        ? Colors.white
                                                        : Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25.0)),
                                          ),
                                          child: AnimatedContainer(
                                            duration:
                                            const Duration(milliseconds: 400),
                                            height: 6.5.h,
                                            //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(25),
                                              color: ratingSelected == true
                                                  ? ColorUtils.lightBlue
                                                  : Colors.white,
                                            ),
                                            child: MaterialButton(
                                              padding: EdgeInsets.zero,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(25)),
                                              onPressed: () {
                                                setState(() {
                                                  ratingSelected = true;
                                                  servicesSelected = false;
                                                });
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Ratings",
                                                    style: TextStyle(
                                                        fontFamily:
                                                        FontUtils.poppinsRegular,
                                                        fontSize: Fontsizes.size15,
                                                        color: ratingSelected == true
                                                            ? Colors.white
                                                            : Colors.black),
                                                  ),
                                                  SizedBox(
                                                    width: 3.w,
                                                  ),
                                                  SvgPicture.asset(
                                                    ImageUtils.ratingStar,
                                                    width: 3.i,
                                                    height: 3.i,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    width: 1.5.w,
                                                  ),
                                                  Text(
                                                    "5.5",
                                                    style: TextStyle(
                                                      fontFamily:
                                                      FontUtils.poppinsRegular,
                                                      fontSize: Fontsizes.size10,
                                                      color: ratingSelected == true
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (servicesSelected == true)
                            Column(
                              children: [
                                SizedBox(height: 1.h,),
                                ListView.separated(
                                  padding: EdgeInsets.symmetric(horizontal: 3.w),
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
                                        Navigator.push(context,
                                            PageTransition(type: PageTransitionType.fade, child:  ServiceDetails()));
                                      },
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(bottom: 0.5.h),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6)),
                                              color: ColorUtils.lightBlue,
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: ColorUtils.white,
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(6)),
                                                  border: Border.all(
                                                      color:
                                                      model.selectedCategoryIndex ==
                                                          index
                                                          ? ColorUtils.lightBlue
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
                                                    horizontal: 4.w, vertical: 1.5.h),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Passport Renewal",
                                                      style: TextStyle(
                                                          fontFamily: FontUtils
                                                              .poppinsRegular,
                                                          fontSize:
                                                          Fontsizes.size15,
                                                          color: ColorUtils.black),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                        ColorUtils.lightGreen2,
                                                        borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(7)),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 3.w,
                                                            vertical: 1.h),
                                                        child: Text(
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
                          if (ratingSelected == true)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 2.h,),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                                  child: Text(
                                    'User Reviews',
                                    style: TextStyle(
                                        fontFamily: FontUtils
                                            .poppinsSemiBold,
                                        fontSize: Fontsizes
                                            .size13,
                                        color: ColorUtils
                                            .black),
                                  ),
                                ),
                                ListView.separated(
                                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                                  physics: BouncingScrollPhysics(),
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: 1.h,
                                    );
                                  },
                                  shrinkWrap: true,
                                  itemCount: model.popularAgentNames.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {},
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(width: 2.0, color: ColorUtils.silver7.withOpacity(0.4)),
                                              )
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                ListTile(
                                                  leading: Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color: ColorUtils
                                                                .lightBlue)),
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.all(3.0),
                                                      child: Image.asset(
                                                        ImageUtils.userPic,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  title: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Anonymous",
                                                        style: TextStyle(
                                                            fontFamily: FontUtils
                                                                .poppinsRegular,
                                                            fontSize:
                                                            Fontsizes.size13,
                                                            color: ColorUtils.black),
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                          Alignment.centerRight,
                                                          child: Image.asset(
                                                            ImageUtils.ratingsGroup,
                                                            width: 20.i,
                                                            height: 20.i,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  subtitle: Text(
                                                    "5 of 5",
                                                    style: TextStyle(
                                                      fontFamily:
                                                      FontUtils.poppinsRegular,
                                                      fontSize: Fontsizes.size11,
                                                      color: ColorUtils.black
                                                          .withOpacity(0.4),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 6.w, bottom: 3.h),
                                                  child: Text(
                                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                                    style: TextStyle(
                                                        fontFamily:
                                                        FontUtils.poppinsRegular,
                                                        fontSize: Fontsizes.size10,
                                                        color: ColorUtils.silver1),
                                                  ),
                                                ),
                                              ],
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
