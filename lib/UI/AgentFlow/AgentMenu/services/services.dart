import 'package:flutter/material.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentMenu/services/add_services.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/user_mainViewModel.dart';
import 'package:mandobi_mobile_app/Widgets/back_arrow.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';


class Agent_Services extends StatefulWidget {
  const Agent_Services({Key? key}) : super(key: key);

  @override
  State<Agent_Services> createState() => _Agent_ServicesState();
}

class _Agent_ServicesState extends State<Agent_Services> {
  bool servicesSelected = true;
  bool ratingSelected = false;
  bool showMoreTapped = false;
  bool bookmark = false;

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
                              "Services",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: FontUtils.poppinsRegular,
                                  fontSize: 2.t,
                                  color: ColorUtils.darkBlue),
                            ),
                            Text(" ")
                            // BookMarkCircle()
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
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
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
                                        Text(
                                          "Syed Ali Raza",
                                          style: TextStyle(
                                              fontFamily: FontUtils
                                                  .poppinsMedium,
                                              fontSize: 2.t,
                                              color: ColorUtils.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: HorizontalMargin(
                                    widget: Text("Categories",
                                      style: TextStyle(
                                          fontFamily: FontUtils.poppinsSemiBold,
                                          fontSize: 1.7.t,
                                          color: ColorUtils.black
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 23.h,
                                  child: ListView.separated(
                                    physics: BouncingScrollPhysics(),
                                    separatorBuilder: (context, index) {
                                      return SizedBox(width: 0.w,);
                                    },
                                    shrinkWrap: true,
                                    itemCount: model.categoriesText.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: (){
                                          model.selectedCategoryIndex = index;
                                          model.notifyListeners();
                                        },
                                        child: Column(
                                          children: [
                                            SizedBox(height: 2.h,),
                                            Container(
                                              width: 25.w,
                                              height: 18.h,
                                              margin: EdgeInsets.only(left: 3.5.w),
                                              padding: EdgeInsets.only(top: 3.h),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                                  border: Border.all(color: model.selectedCategoryIndex == index ? ColorUtils.lightBlue : Colors.white),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey.withOpacity(0.5),
                                                      spreadRadius: 5,
                                                      blurRadius: 7,
                                                      offset: Offset(0, 3),
                                                    ),
                                                  ]
                                              ),
                                              //margin: EdgeInsets.symmetric(horizontal: 2.w),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset(model.categoriesImages[index],
                                                    height: 10.i,
                                                    width: 10.i,
                                                  ),
                                                  SizedBox(height: 2.h,),
                                                  Text(model.categoriesText[index],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily: FontUtils.poppinsRegular,
                                                        fontSize: 1.6.t,
                                                        color: ColorUtils.black
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },),
                                ),
                                HorizontalMargin(
                                  widget: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Services",
                                        style: TextStyle(
                                            fontFamily: FontUtils.poppinsSemiBold,
                                            fontSize: 1.7.t,
                                            color: ColorUtils.black
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.push(context,
                                              PageTransition(type: PageTransitionType.fade, child: Add_services()));
                                        },
                                        child: Container(
                                          width: 30.w,
                                          height: 3.h,
                                          child: Center(
                                            child: Text("+ Add Services",
                                              style: TextStyle(
                                                  fontFamily: FontUtils.poppinsRegular,
                                                  fontSize: 1.7.t,
                                                  color: ColorUtils.blue3
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ListView.separated(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 3.w),
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
                                                        Text(
                                                          "AED 200",
                                                          style: TextStyle(
                                                              fontFamily: FontUtils
                                                                  .poppinsRegular,
                                                              fontSize:
                                                              Fontsizes.size15,
                                                              color:
                                                              ColorUtils.lightGreen2),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 30.w),
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
                                                        child:  Icon(Icons.edit , color: Colors.white,),
                                                      ),
                                                    ),
                                                    SizedBox(width: 2.w),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: ColorUtils
                                                            .grey,
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
                                                        child:  Icon(Icons.delete , color: Colors.white,),
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
