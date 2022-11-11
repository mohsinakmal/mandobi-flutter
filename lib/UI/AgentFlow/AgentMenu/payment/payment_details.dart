import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/UserFlow/Home/notifications.dart';
import 'package:mandobi_mobile_app/UI/UserFlow/Menu/payment/card_details.dart';
import 'package:mandobi_mobile_app/UI/UserFlow/Profile/my_profile.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/user_mainViewModel.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({Key? key}) : super(key: key);

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
            top: true,
            bottom: false,
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  HorizontalMargin(
                    widget: GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            PageTransition(type: PageTransitionType.fade, child: MyProfile()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Ahmed Saud",
                                    style: TextStyle(
                                        fontFamily: FontUtils.poppinsMedium,
                                        fontSize: 2.t,
                                        color: ColorUtils.black
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(ImageUtils.locationPin),
                                      SizedBox(width: 1.w,),
                                      Text("Emara DB 1254 north area",
                                        style: TextStyle(
                                            fontFamily: FontUtils.poppinsRegular,
                                            fontSize: 1.6.t,
                                            color: ColorUtils.grey1
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  PageTransition(type: PageTransitionType.fade, child:  NotificationsScreen()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorUtils.lightBlue.withOpacity(0.1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SvgPicture.asset(ImageUtils.notificationIcon),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w,),
                    height: 70,
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 18.h,
                          padding: EdgeInsets.symmetric(horizontal: 2.w,),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: ColorUtils.grey,)
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_today_outlined , color: ColorUtils.grey,),
                              SizedBox(width: 3,),
                              Text("september" , style: TextStyle(color: ColorUtils.grey,),),
                              Spacer(),
                              Icon(Icons.keyboard_arrow_down ,  color: ColorUtils.grey,)
                            ],
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: (){
                            Navigator.push(context,
                                PageTransition(type: PageTransitionType.fade, child:  CardDetails()));
                          },
                          child: Container(child: Row(
                            children: [
                              Text(" "),
                            ],
                          )),
                        )

                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 2.h,
                          );
                        },
                        shrinkWrap: true,
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(7)),
                              color: ColorUtils.silver4.withOpacity(0.35),
                            ),
                            child: GestureDetector(
                                onTap: () {
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Passport Renewal",
                                            style: TextStyle(
                                              fontFamily: FontUtils.poppinsMedium,
                                              fontSize: Fontsizes.size11,
                                              color: ColorUtils.black,
                                            ),
                                          ),
                                          Text("#4565",
                                            style: TextStyle(
                                              fontFamily: FontUtils.poppinsRegular,
                                              fontSize: Fontsizes.size14,
                                              color: ColorUtils.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Ali Raza",
                                            style: TextStyle(
                                              fontFamily: FontUtils.poppinsRegular,
                                              fontSize: Fontsizes.size24,
                                              color: ColorUtils.black,
                                            ),
                                          ),
                                          Text("20 AED",
                                            style: TextStyle(
                                              fontFamily: FontUtils.poppinsSemiBold,
                                              fontSize: Fontsizes.size20,
                                              color: ColorUtils.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          );
                        },
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
