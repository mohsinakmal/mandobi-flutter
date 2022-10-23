import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/Menu/dispute/dispute_details.dart';
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

class Disputes extends StatelessWidget {
  const Disputes({Key? key}) : super(key: key);

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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BackArrow(),
                                Text(
                                  "Disputes",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: FontUtils.poppinsRegular,
                                      fontSize: 2.t,
                                      color: ColorUtils.darkBlue),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          ColorUtils.lightBlue.withOpacity(0.1),
                                    ),
                                    padding: EdgeInsets.all(16),
                                    child: SvgPicture.asset(
                                      ImageUtils.searchIcon,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 1.h,
                          );
                        },
                        shrinkWrap: true,
                        itemCount: model.popularAgentNames.length,
                        itemBuilder: (context, index) {
                          return Container(
                            //margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(6)),
                              color: model.disputesStatus[index]=="Pending" ? ColorUtils.golden1:
                              model.disputesStatus[index]=="In Process" ? ColorUtils.lightBlue3:
                              model.disputesStatus[index]=="Resolved" ? ColorUtils.lightGreen1:
                              ColorUtils.red,
                            ),
                            padding: EdgeInsets.only(bottom: 0.5.h,),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    PageTransition(type: PageTransitionType.fade, child:  DisputeDetails(passportStatus: model.disputesStatus[index])));
                              },
                              child: Card(
                                margin: EdgeInsets.zero,
                                elevation: 5,
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 2.h),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Passport Renewal",
                                                style: TextStyle(
                                                    fontFamily: FontUtils
                                                        .poppinsRegular,
                                                    fontSize:
                                                    Fontsizes.size13,
                                                    color: ColorUtils.black),
                                              ),
                                              Text(
                                                "ID #4564",
                                                style: TextStyle(
                                                    fontFamily: FontUtils
                                                        .poppinsSemiBold,
                                                    fontSize:
                                                    Fontsizes.size14,
                                                    color: ColorUtils.black),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.circular(13),
                                              color: model.disputesStatus[index]=="Pending" ? ColorUtils.golden:
                                              model.disputesStatus[index]=="In Process" ? ColorUtils.lightBlue1.withOpacity(0.13):
                                              model.disputesStatus[index]=="Resolved" ? ColorUtils.lightGreen1.withOpacity(0.2):
                                              ColorUtils.red.withOpacity(0.2),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 2.5.w,
                                                  vertical: 0.5.h),
                                              child: Text(
                                                model.disputesStatus[index],
                                                style: TextStyle(
                                                  fontFamily: FontUtils
                                                      .poppinsRegular,
                                                  fontSize: 1.6.t,
                                                  color: model.disputesStatus[index]=="Pending" ? ColorUtils.golden1:
                                                  model.disputesStatus[index]=="In Process" ? ColorUtils.lightBlue3:
                                                  model.disputesStatus[index]=="Resolved" ? ColorUtils.lightGreen1:
                                                  ColorUtils.red,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
