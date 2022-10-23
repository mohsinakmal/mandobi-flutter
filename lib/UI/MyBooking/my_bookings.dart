import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/user_mainViewModel.dart';
import 'package:mandobi_mobile_app/Widgets/book_mark_circle.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:stacked/stacked.dart';

class MyBookings extends StatelessWidget {
  const MyBookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserMainViewModel>.reactive(
      viewModelBuilder: () => locator<UserMainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.myBookingStatus = 0;
        model.disputesStatus[0] = "Pending";
        model.bookingValue = "Pending";
      },
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
                            Container(
                              width: 2.w,
                            ),
                            Text(
                              "My Bookings",
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
                                    ImageUtils.notificationIcon),
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
                          SizedBox(
                            height: 3.h,
                          ),
                          SizedBox(
                            height: 4.5.h,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: 3.w,
                                );
                              },
                              shrinkWrap: true,
                              itemCount: model.bookingsStatus.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    model.myBookingStatus = index;
                                    if (model.bookingsStatus[index] ==
                                        "Pending") {
                                      model.bookingValue = "Pending";
                                    } else if (model.bookingsStatus[index] ==
                                        "Process") {
                                      model.bookingValue = "Process";
                                    } else if (model.bookingsStatus[index] ==
                                        "Completed") {
                                      model.bookingValue = "Completed";
                                    } else {
                                      model.bookingValue = "Cancel";
                                    }
                                    model.notifyListeners();
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 2.w),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(5),
                                      border: model.myBookingStatus == index
                                          ? Border.all(
                                              color: model.bookingsStatus[
                                                          index] ==
                                                      "Pending"
                                                  ? ColorUtils.golden1
                                                  : model.bookingsStatus[
                                                              index] ==
                                                          "Process"
                                                      ? ColorUtils.lightBlue3
                                                      : model.bookingsStatus[
                                                                  index] ==
                                                              "Completed"
                                                          ? ColorUtils
                                                              .lightGreen1
                                                          : ColorUtils.red)
                                          : Border.all(color: Colors.white),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.w),
                                        child: Text(
                                          model.bookingsStatus[index],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily:
                                                  FontUtils.poppinsRegular,
                                              fontSize: Fontsizes.size13,
                                              color: model.bookingsStatus[
                                                          index] ==
                                                      "Pending"
                                                  ? ColorUtils.golden1
                                                  : model.bookingsStatus[
                                                              index] ==
                                                          "Process"
                                                      ? ColorUtils.lightBlue3
                                                      : model.bookingsStatus[
                                                                  index] ==
                                                              "Completed"
                                                          ? ColorUtils
                                                              .lightGreen1
                                                          : ColorUtils.red),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          if(model.bookingValue != "Cancel")
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 4.5.w),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                color: model.bookingValue == "Pending"
                                    ? ColorUtils.golden1
                                    : model.bookingValue == "Process"
                                        ? ColorUtils.lightBlue3
                                        : model.bookingValue == "Completed"
                                            ? ColorUtils.lightGreen1
                                            : ColorUtils.red),
                            padding: EdgeInsets.only(bottom: 0.5.h),
                            child: Material(
                              elevation: 8,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.w, vertical: 2.h),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Column(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Passport Renewal",
                                                style: TextStyle(
                                                  fontFamily:
                                                      FontUtils.poppinsRegular,
                                                  fontSize: Fontsizes.size15,
                                                  color: ColorUtils.black,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 4.w),
                                                child: Text(
                                                  "01/Jan",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        FontUtils.poppinsBold,
                                                    fontSize: Fontsizes.size12,
                                                    color: ColorUtils.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                            child: ListView.separated(
                                              scrollDirection: Axis.horizontal,
                                              //padding: EdgeInsets.symmetric(horizontal: 2.w),
                                              physics: BouncingScrollPhysics(),
                                              separatorBuilder:
                                                  (context, index) {
                                                return SizedBox(
                                                  width: 2.w,
                                                );
                                              },
                                              shrinkWrap: true,
                                              itemCount: model.documents.length,
                                              itemBuilder: (context, index) {
                                                return Image.asset(
                                                  model.documents[index],
                                                );
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.5.h,
                                          ),
                                          Text(
                                            "Note",
                                            style: TextStyle(
                                              fontFamily:
                                                  FontUtils.poppinsMedium,
                                              fontSize: Fontsizes.size14,
                                              color: ColorUtils.black,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(
                                            "Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum is simply dummy text of the ustry. ",
                                            style: TextStyle(
                                              fontFamily:
                                                  FontUtils.poppinsRegular,
                                              fontSize: Fontsizes.size10,
                                              color: ColorUtils.silver1,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2.5.h,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: ColorUtils
                                                            .lightBlue)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(6.0),
                                                  child: Image.asset(
                                                    ImageUtils.userPic,
                                                    height: 15.i,
                                                    width: 15.i,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 3.w,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Syed Ali Raza",
                                                    style: TextStyle(
                                                        fontFamily: FontUtils
                                                            .poppinsRegular,
                                                        fontSize:
                                                            Fontsizes.size15,
                                                        color:
                                                            ColorUtils.black),
                                                  ),
                                                  SizedBox(
                                                    height: 0.25.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Contractor - TAWJEEH",
                                                        style: TextStyle(
                                                            fontFamily: FontUtils
                                                                .poppinsRegular,
                                                            fontSize:
                                                                Fontsizes.size9,
                                                            color: ColorUtils
                                                                .black),
                                                      ),
                                                      SizedBox(
                                                        width: 2.w,
                                                      ),
                                                      if (model.bookingValue !=
                                                          "Process")
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            SvgPicture.asset(
                                                              ImageUtils
                                                                  .clockIcon,
                                                              width: 3.i,
                                                              height: 3.i,
                                                              fit: BoxFit.cover,
                                                            ),
                                                            SizedBox(
                                                              width: 1.5.w,
                                                            ),
                                                            Text(
                                                              "9AM to 5PM",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .poppinsRegular,
                                                                  fontSize:
                                                                      Fontsizes
                                                                          .size9,
                                                                  color:
                                                                      ColorUtils
                                                                          .black),
                                                            ),
                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 2.h,
                                                  ),
                                                ],
                                              ),
                                              if (model.bookingValue ==
                                                  "Process")
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 8.w,
                                                    ),
                                                    Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: ColorUtils
                                                              .lightBlue
                                                              .withOpacity(0.1),
                                                        ),
                                                        padding:
                                                            EdgeInsets.all(16),
                                                        child: SvgPicture.asset(
                                                          ImageUtils.chatIcon,
                                                          width: 4.i,
                                                          height: 4.i,
                                                        ))
                                                  ],
                                                ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                30.0)),
                                                  ),
                                                  child: AnimatedContainer(
                                                    duration: const Duration(
                                                        milliseconds: 400),
                                                    height: 6.5.h,
                                                    //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      color:
                                                          ColorUtils.lightBlue,
                                                    ),
                                                    child: MaterialButton(
                                                      padding: EdgeInsets.zero,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25)),
                                                      onPressed: () {},
                                                      child: Text(
                                                        "Details",
                                                        style: TextStyle(
                                                            fontFamily: FontUtils
                                                                .poppinsRegular,
                                                            fontSize: 1.8.t,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 4.w,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                30.0)),
                                                  ),
                                                  child: AnimatedContainer(
                                                    duration: const Duration(
                                                        milliseconds: 400),
                                                    height: 6.5.h,
                                                    //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      border: Border.all(
                                                          color:
                                                              ColorUtils.red),
                                                    ),
                                                    child: MaterialButton(
                                                      padding: EdgeInsets.zero,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25)),
                                                      onPressed: () {},
                                                      child: Text(
                                                        "Cancel",
                                                        style: TextStyle(
                                                            fontFamily: FontUtils
                                                                .poppinsRegular,
                                                            fontSize: 1.8.t,
                                                            color: Colors.red),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
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
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 4.5.w),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              color: model.bookingValue == "Pending"
                                  ? ColorUtils.golden1
                                  : model.bookingValue == "Process"
                                      ? ColorUtils.lightBlue3
                                      : model.bookingValue == "Completed"
                                          ? ColorUtils.lightGreen1
                                          : ColorUtils.red,
                            ),
                            padding: EdgeInsets.only(bottom: 0.5.h),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ColorUtils.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    ),
                                  ]),
                              //margin: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.w, vertical: 3.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Passport Renewal",
                                      style: TextStyle(
                                        fontFamily: FontUtils.poppinsRegular,
                                        fontSize: Fontsizes.size15,
                                        color: ColorUtils.black,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 4.w),
                                      child: Text(
                                        "01/Jan",
                                        style: TextStyle(
                                          fontFamily: FontUtils.poppinsBold,
                                          fontSize: Fontsizes.size12,
                                          color: ColorUtils.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 4.5.w),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              color: model.bookingValue == "Pending"
                                  ? ColorUtils.golden1
                                  : model.bookingValue == "Process"
                                      ? ColorUtils.lightBlue3
                                      : model.bookingValue == "Completed"
                                          ? ColorUtils.lightGreen1
                                          : ColorUtils.red,
                            ),
                            padding: EdgeInsets.only(bottom: 0.5.h),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ColorUtils.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    ),
                                  ]),
                              //margin: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.w, vertical: 3.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Passport Renewal",
                                      style: TextStyle(
                                        fontFamily: FontUtils.poppinsRegular,
                                        fontSize: Fontsizes.size15,
                                        color: ColorUtils.black,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 4.w),
                                      child: Text(
                                        "01/Jan",
                                        style: TextStyle(
                                          fontFamily: FontUtils.poppinsBold,
                                          fontSize: Fontsizes.size12,
                                          color: ColorUtils.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
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
