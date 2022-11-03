import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/Home/about_agent.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/user_mainViewModel.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class Agents extends StatelessWidget {
  const Agents({Key? key}) : super(key: key);

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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 10.w,
                                child: Icon(Icons.arrow_back),
                              ),
                            ),
                            Text(
                              "Agents",
                              style: TextStyle(
                                  fontFamily: FontUtils.poppinsRegular,
                                  fontSize: 2.t,
                                  color: ColorUtils.darkBlue),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorUtils.lightBlue.withOpacity(0.1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SvgPicture.asset(
                                    ImageUtils.searchIcon),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2.h,),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Text("Categories",
                              style: TextStyle(
                                  fontFamily: FontUtils.poppinsSemiBold,
                                  fontSize: 1.7.t,
                                  color: ColorUtils.black
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 22.h,
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
                                        height: 17.5.h,
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
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Text("Popular Services & Agents",
                              style: TextStyle(
                                  fontFamily: FontUtils.poppinsSemiBold,
                                  fontSize: Fontsizes.size13,
                                  color: ColorUtils.black
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 11.h,
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              physics: BouncingScrollPhysics(),
                              separatorBuilder: (context, index) {
                                return SizedBox(width: 0.w,);
                              },
                              shrinkWrap: true,
                              itemCount: model.popularServicesAndAgents.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: (){
                                    model.selectedPopularServiceIndex = index;
                                    model.notifyListeners();
                                  },
                                  child: Column(
                                    children: [
                                      SizedBox(height: 2.h,),
                                      Container(
                                        margin: EdgeInsets.only(left: 3.5.w),
                                        decoration: BoxDecoration(
                                            color: model.selectedPopularServiceIndex == index ? ColorUtils.lightGreen : Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(6)),
                                            border: Border.all(
                                                width: 2,
                                                color:
                                                model.selectedPopularServiceIndex == index ? ColorUtils.lightGreen
                                                    : index == 0 ?
                                                //Colors.primaries[Random().nextInt(Colors.primaries.length)]
                                                ColorUtils.lightGreen2
                                                    : index == 1 ?
                                                ColorUtils.lightGreen5
                                                    : ColorUtils.lightYellow
                                            ),
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
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 1.25.h),
                                          child: Center(
                                            child: Text(model.popularServicesAndAgents[index],
                                              style: TextStyle(
                                                  fontFamily: FontUtils.poppinsSemiBold,
                                                  fontSize: 1.6.t,
                                                  color: model.selectedPopularServiceIndex == index ? ColorUtils.white : ColorUtils.black
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },),
                          ),
                          SizedBox(height: 1.h,),
                          ListView.separated(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            physics: BouncingScrollPhysics(),
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 1.h,);
                            },
                            shrinkWrap: true,
                            itemCount: model.popularAgentNames.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context,
                                      PageTransition(type: PageTransitionType.fade, child: AboutAgent()));
                                },
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ListTile(
                                        leading: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(color: ColorUtils.lightBlue)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Image.asset(
                                              ImageUtils.userPic,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        title: Row(
                                          children: [
                                            Text(model.popularAgentNames[index],
                                              style: TextStyle(
                                                  fontFamily: FontUtils.poppinsRegular,
                                                  fontSize: Fontsizes.size15,
                                                  color: ColorUtils.black
                                              ),
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    SvgPicture.asset(ImageUtils.ratingStar,
                                                      width: 3.i,
                                                      height: 3.i,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    SizedBox(width: 1.5.w,),
                                                    Text("5.5",
                                                      style: TextStyle(
                                                          fontFamily: FontUtils.poppinsRegular,
                                                          fontSize: Fontsizes.size10,
                                                          color: ColorUtils.black
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        subtitle: Row(
                                          children: [
                                            Text("Contractor - TAWJEEH",
                                              style: TextStyle(
                                                  fontFamily: FontUtils.poppinsSemiBold,
                                                  fontSize: Fontsizes.size9,
                                                  color: ColorUtils.black
                                              ),
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    SvgPicture.asset(ImageUtils.clockIcon,
                                                      width: 3.i,
                                                      height: 3.i,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    SizedBox(width: 1.5.w,),
                                                    Text("9AM to 5PM",
                                                      style: TextStyle(
                                                          fontFamily: FontUtils.poppinsRegular,
                                                          fontSize: Fontsizes.size10,
                                                          color: ColorUtils.black
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left:6.w, bottom: 3.h),
                                        child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                          style: TextStyle(
                                              fontFamily: FontUtils.poppinsRegular,
                                              fontSize: Fontsizes.size10,
                                              color: ColorUtils.silver1
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },),
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
