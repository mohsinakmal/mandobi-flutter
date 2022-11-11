import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentBooking/agent_booking_details.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentBooking/agent_my_bookings.dart';
import 'package:mandobi_mobile_app/UI/UserFlow/Home/notifications.dart';
import 'package:mandobi_mobile_app/UI/UserFlow/Profile/my_profile.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/agent_mainViewModel.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class AgentHomeScreen extends StatefulWidget {
  const AgentHomeScreen({Key? key}) : super(key: key);

  @override
  State<AgentHomeScreen> createState() => _AgentHomeScreenState();
}

class _AgentHomeScreenState extends State<AgentHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AgentMainViewModel>.reactive(
      viewModelBuilder: () => locator<AgentMainViewModel>(),
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
                        GestureDetector(
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
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HorizontalMargin(
                            widget: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 2.h,),
                                Container(
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
                                SizedBox(height: 2.h,),
                                Text("Bookings",
                                  style: TextStyle(
                                      fontFamily: FontUtils.poppinsSemiBold,
                                      fontSize: 1.7.t,
                                      color: ColorUtils.black
                                  ),
                                ),
                                SizedBox(height: 2.h,),
                              ],
                            ),
                          ),
                          // Bookings List
                          SizedBox(
                            height: 23.h,
                            child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              separatorBuilder: (context, index) {
                                return SizedBox(width: 0.w,);
                              },
                              shrinkWrap: true,
                              itemCount: model.homeBookingColors.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 1.w, top: 1.h, bottom: 1.h),
                                  child: GestureDetector(
                                    onTap: (){},
                                    child: Container(
                                      margin: EdgeInsets.only(left: 3.5.w),
                                      width: 40.w,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 4,
                                              offset: Offset(0, 1),
                                            ),
                                          ],
                                        borderRadius: BorderRadius.circular(6),
                                        gradient: LinearGradient(
                                          stops: [.5, .5],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            model.homeBookingColors[index]["container11"],
                                            model.homeBookingColors[index]["container12"],
                                          ],
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 5.w, top: 2.h),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    color: ColorUtils.white.withOpacity(0.2),
                                                    borderRadius: BorderRadius.circular(6),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: SvgPicture.asset(model.homeBookingIcons[index]),
                                                  )),
                                            ),
                                            SizedBox(height: 5.h,),
                                            Text(model.homeBookingCount[index],
                                              style: TextStyle(
                                                  fontFamily: FontUtils.poppinsRegular,
                                                  fontSize: Fontsizes.size30,
                                                  color: ColorUtils.white
                                              ),
                                            ),
                                            Text(model.homeBookingTitle[index],
                                              style: TextStyle(
                                                  fontFamily: FontUtils.poppinsRegular,
                                                  fontSize: Fontsizes.size12,
                                                  color: ColorUtils.white
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ),
                                    ),
                                );
                              },),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 2.h,),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Text("Recent Bookings",
                                  style: TextStyle(
                                      fontFamily: FontUtils.poppinsSemiBold,
                                      fontSize: 1.7.t,
                                      color: ColorUtils.black
                                  ),
                                ),
                              ),
                              SizedBox(height: 2.h,),
                              ListView.separated(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                physics: BouncingScrollPhysics(),
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 1.h,
                                  );
                                },
                                shrinkWrap: true,
                                itemCount: model.recentBookingStatus.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    //margin: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                        color: model.recentBookingStatus[index]=="Process" ? ColorUtils.lightBlue3:
                                        model.recentBookingStatus[index]=="Pending" ? ColorUtils.golden3:
                                        ColorUtils.lightGreen1
                                    ),
                                    padding: EdgeInsets.only(bottom: 0.5.h,),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            PageTransition(type: PageTransitionType.fade, child:  AgentBookingDetails(
                                              currentBookingValue: index == 0 ? "Process" : index == 1 ? "Pending" : "Completed",
                                            )));
                                      },
                                      child: Card(
                                        margin: EdgeInsets.zero,
                                        elevation: 5,
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.w, vertical: 2.h),
                                          child: Column(
                                            //mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    SvgPicture.asset(ImageUtils.bulletIcon,
                                                        color: model.recentBookingStatus[index]=="Process" ? ColorUtils.lightBlue3:
                                                        model.recentBookingStatus[index]=="Pending" ? ColorUtils.golden3:
                                                        ColorUtils.lightGreen1
                                                    ),
                                                    SizedBox(width: 1.5.w,),
                                                    Text(model.recentBookingStatus[index],
                                                      style: TextStyle(
                                                          color: model.recentBookingStatus[index]=="Process" ? ColorUtils.lightBlue3:
                                                          model.recentBookingStatus[index]=="Pending" ? ColorUtils.golden3:
                                                          ColorUtils.lightGreen1
                                                      ),
                                                    ),
                                                  ],
                                                ),
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
                                                          Text("Anees A.",
                                                            style: TextStyle(
                                                                fontFamily: FontUtils.poppinsMedium,
                                                                fontSize: Fontsizes.size16,
                                                                color: ColorUtils.black
                                                            ),
                                                          ),
                                                          SizedBox(height: 0.35.h,),
                                                          Text("Driving License",
                                                            style: TextStyle(
                                                                fontFamily: FontUtils.poppinsRegular,
                                                                fontSize: Fontsizes.size12,
                                                                color: ColorUtils.black
                                                            ),
                                                          ),
                                                          Text("AED 500",
                                                            style: TextStyle(
                                                                fontFamily: FontUtils.poppinsRegular,
                                                                fontSize: Fontsizes.size12,
                                                                color: ColorUtils.black
                                                            ),
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
                                  );
                                },
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
