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

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

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
                        AppBarTwoItems(
                          text: "Notifications",
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 3.h,),
                      ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 1.h,
                          );
                        },
                        shrinkWrap: true,
                        itemCount: model.notificationsText.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.only(bottom: 0.5.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(6)),
                                color: model.notificationsText[index] == "Send documents as proof" ?
                                ColorUtils.golden1 : ColorUtils.lightBlue4,
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
                                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.75.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(color: ColorUtils.lightBlue)
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(6.0),
                                              child: Image.asset(ImageUtils.userPic,
                                                height: 15.i,
                                                width: 15.i,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 2.w,),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Syed Ali Raza",
                                                  style: TextStyle(
                                                      fontFamily: FontUtils.poppinsMedium,
                                                      fontSize: Fontsizes.size14,
                                                      color: ColorUtils.black
                                                  ),
                                                ),
                                                if(model.notificationsText[index] == "Send documents as proof")
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: "Send",
                                                        style: TextStyle(
                                                          fontFamily: FontUtils.poppinsMedium,
                                                          fontSize: Fontsizes.size10,
                                                          color: ColorUtils.grey1,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: ' documents',
                                                        style: TextStyle(
                                                          fontFamily: FontUtils.poppinsMedium,
                                                          fontSize: Fontsizes.size10,
                                                          color: ColorUtils.golden1,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: ' as proof',
                                                        style: TextStyle(
                                                          fontFamily: FontUtils.poppinsMedium,
                                                          fontSize: Fontsizes.size10,
                                                          color: ColorUtils.grey1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if(model.notificationsText[index] == "Dispute Request has been resolved successfully")
                                                  RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: "Dispute Request",
                                                          style: TextStyle(
                                                            fontFamily: FontUtils.poppinsMedium,
                                                            fontSize: Fontsizes.size10,
                                                            color: ColorUtils.lightBlue4,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: ' has been resolved successfully',
                                                          style: TextStyle(
                                                            fontFamily: FontUtils.poppinsMedium,
                                                            fontSize: Fontsizes.size10,
                                                            color: ColorUtils.grey1,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Passport Renewal",
                                            style: TextStyle(
                                                fontFamily: FontUtils.poppinsRegular,
                                                fontSize: Fontsizes.size13,
                                                color: ColorUtils.black),
                                          ),
                                          SizedBox(height: 0.5.h,),
                                          Container(
                                            margin: EdgeInsets.only(left: 3.w),
                                            child: Text(
                                              "ID #4564",
                                              style: TextStyle(
                                                  fontFamily: FontUtils.poppinsSemiBold,
                                                  fontSize: Fontsizes.size14,
                                                  color: ColorUtils.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
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
