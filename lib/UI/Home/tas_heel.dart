import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/user_mainViewModel.dart';
import 'package:mandobi_mobile_app/Widgets/app_bar_two_items.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:stacked/stacked.dart';

class Tasheel extends StatefulWidget {
  const Tasheel({Key? key}) : super(key: key);

  @override
  State<Tasheel> createState() => _TasheelState();
}

class _TasheelState extends State<Tasheel> {
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
              body: SingleChildScrollView(
                child: Column(
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
                            text: "Tas-Heel",
                          ),
                          SizedBox(height: 2.h,),
                          Image.asset(ImageUtils.tasHeel),
                          SizedBox(height: 2.h,),
                          Container(
                            margin: EdgeInsets.only(top: 4.h,left: 3.w,right: 3.w),
                            decoration:  BoxDecoration(
                              border: Border.all(color: ColorUtils.silver2.withOpacity(0.2)),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(24)),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 4.w,),
                                Icon(Icons.search,
                                color: ColorUtils.silver3,
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: 3.w,
                                      right: 3.w,
                                    ),
                                    child: TextField(
                                      onTap: () {},
                                      enabled: true,
                                      //readOnly: true,
                                      //focusNode: model.searchFocus,
                                      //controller: model.mapSearchController,
                                      decoration: InputDecoration(
                                        hintText: "Search",
                                        hintStyle: TextStyle(
                                          //fontFamily: FontUtils.proximaNovaRegular,
                                          color: Colors.black.withOpacity(0.5),
                                          fontSize: Fontsizes.size12,
                                        ),
                                        border: InputBorder.none,
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 2.h),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 5.w),
                                    child: SvgPicture.asset(ImageUtils.searchMenu)),
                              ],
                            ),
                          ),
                          SizedBox(height: 2.5.h,),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Text("Services & Agents",
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
                        itemCount: model.servicesNames.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              model.selectedServiceIndex = index;
                              model.notifyListeners();
                            },
                            child: Column(
                              children: [
                                SizedBox(height: 2.h,),
                                Container(
                                  margin: EdgeInsets.only(left: 3.5.w),
                                  decoration: BoxDecoration(
                                      color: model.selectedServiceIndex == index ? ColorUtils.lightGreen : Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                      border: Border.all(
                                          width: 2.5,
                                          color: model.selectedServiceIndex == index ? ColorUtils.lightGreen2 : Colors.primaries[Random().nextInt(Colors.primaries.length)]),
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
                                    padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
                                    child: Center(
                                      child: Text(model.servicesNames[index],
                                        style: TextStyle(
                                            fontFamily: FontUtils.poppinsSemiBold,
                                            fontSize: 1.7.t,
                                            color: model.selectedServiceIndex == index ? ColorUtils.white : ColorUtils.black
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      Image.asset(ImageUtils.bookMark,
                                        width: 3.i,
                                        height: 3.i,
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
          ),
        );
      },
    );
  }
}
