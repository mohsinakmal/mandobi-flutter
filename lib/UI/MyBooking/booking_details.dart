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
import 'package:mandobi_mobile_app/Widgets/custom_button_one.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:stacked/stacked.dart';

class BookingDetails extends StatefulWidget {
  String? currentBookingValue;

  BookingDetails({this.currentBookingValue, Key? key}) : super(key: key);

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  bool detailsSelected = true;
  bool milestonesSelected = false;

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
                        AppBarTwoItems(
                          text: "Booking Details",
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
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                                  border: Border.all(color: ColorUtils.lightBlue)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                      ),
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 400),
                                        height: 6.5.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color: detailsSelected == true
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
                                              detailsSelected = true;
                                              milestonesSelected = false;
                                            });
                                          },
                                          child: Text(
                                            "Details",
                                            style: TextStyle(
                                                fontFamily: FontUtils.poppinsRegular,
                                                fontSize: Fontsizes.size14,
                                                color: detailsSelected == true
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
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                      ),
                                      child: AnimatedContainer(
                                        duration: const Duration(milliseconds: 400),
                                        height: 6.5.h,
                                        //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color: milestonesSelected == true
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
                                              milestonesSelected = true;
                                              detailsSelected = false;
                                            });
                                          },
                                          child: Text(
                                            "Milestones",
                                            style: TextStyle(
                                                fontFamily: FontUtils.poppinsRegular,
                                                fontSize: Fontsizes.size14,
                                                color: milestonesSelected == true
                                                    ? ColorUtils.white
                                                    : Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Service Type",
                                      style: TextStyle(
                                          fontFamily: FontUtils.poppinsRegular,
                                          fontSize: Fontsizes.size10,
                                          color: ColorUtils.black),
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(ImageUtils.arrowForward),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          "Passport Renewal",
                                          style: TextStyle(
                                              fontFamily: FontUtils.poppinsRegular,
                                              fontSize: Fontsizes.size13,
                                              color: ColorUtils.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
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
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(7),
                                    color: widget.currentBookingValue == "Pending"
                                        ? ColorUtils.golden2 :
                                    widget.currentBookingValue == "Process" ? ColorUtils.lightBlue3 :  widget.currentBookingValue == "Completed" ?
                                    ColorUtils.lightGreen : ColorUtils.red,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.5.w, vertical: 0.5.h),
                                    child: Text(
                                      widget.currentBookingValue!,
                                      //widget.passportStatus!,
                                      style: TextStyle(
                                        fontFamily: FontUtils.poppinsRegular,
                                        fontSize: 1.6.t,
                                        color: ColorUtils.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (detailsSelected == true)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "My Documents",
                                    style: TextStyle(
                                      fontFamily: FontUtils.poppinsMedium,
                                      fontSize: Fontsizes.size14,
                                      color: ColorUtils.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      //padding: EdgeInsets.symmetric(horizontal: 2.w),
                                      physics: BouncingScrollPhysics(),
                                      separatorBuilder: (context, index) {
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
                                      fontFamily: FontUtils.poppinsMedium,
                                      fontSize: Fontsizes.size14,
                                      color: ColorUtils.black,
                                    ),
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
                                    height: 2.5.h,
                                  ),
                                  Text(
                                    "Agent Details",
                                    style: TextStyle(
                                      fontFamily: FontUtils.poppinsMedium,
                                      fontSize: Fontsizes.size14,
                                      color: ColorUtils.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 0.5.h),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                      color: ColorUtils.lightBlue,
                                    ),
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
                                            horizontal: 4.w, vertical: 1.5.h),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color:
                                                          ColorUtils.lightBlue)),
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
                                                          fontFamily:
                                                          FontUtils.poppinsMedium,
                                                          fontSize: Fontsizes.size16,
                                                          color: ColorUtils.black),
                                                    ),
                                                    SizedBox(
                                                      height: 0.25.h,
                                                    ),
                                                    Text(
                                                      "Contractor - TAWJEEH",
                                                      style: TextStyle(
                                                          fontFamily: FontUtils
                                                              .poppinsRegular,
                                                          fontSize: Fontsizes.size11,
                                                          color: ColorUtils.black),
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
                                  if (detailsSelected == true)
                                    Column(
                                      children: [
                                        if(model.bookingValue != "Completed" && model.bookingValue != "Cancel")
                                        Container(
                                          margin: EdgeInsets.only(top: 8.h),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(30.0)),
                                            border: Border.all(color: ColorUtils.red2),
                                          ),
                                          child: AnimatedContainer(
                                            duration: const Duration(milliseconds: 400),
                                            width: MediaQuery.of(context).size.width / 1,
                                            height: 6.5.h,
                                            //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(25),
                                              color: ColorUtils.white,
                                            ),
                                            child: MaterialButton(
                                              padding: EdgeInsets.zero,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(25)),
                                              onPressed: () {},
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    fontFamily: FontUtils.poppinsRegular,
                                                    fontSize: Fontsizes.size16,
                                                    color: Colors.red),
                                              ),
                                            ),
                                          ),
                                        ),
                                        if(model.bookingValue == "Completed")
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  margin: EdgeInsets.only(top: 8.h),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                    BorderRadius.all(Radius.circular(30.0)),
                                                  ),
                                                  child: AnimatedContainer(
                                                    duration: const Duration(milliseconds: 400),
                                                    height: 6.5.h,
                                                    //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(25), color: ColorUtils.lightBlue
                                                    ),
                                                    child: MaterialButton(
                                                      padding: EdgeInsets.zero,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(25)),
                                                      onPressed: () {},
                                                      child: Text(
                                                        "Leave a Review",
                                                        style: TextStyle(
                                                            fontFamily: FontUtils.poppinsRegular,
                                                            fontSize: Fontsizes.size16,
                                                            color: Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 3.w,),
                                              Expanded(
                                                child: Container(
                                                  margin: EdgeInsets.only(top: 8.h),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                    BorderRadius.all(Radius.circular(30.0)),
                                                    border: Border.all(color: ColorUtils.red2),
                                                  ),
                                                  child: AnimatedContainer(
                                                    duration: const Duration(milliseconds: 400),
                                                    height: 6.5.h,
                                                    //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(25),
                                                      color: ColorUtils.white,
                                                    ),
                                                    child: MaterialButton(
                                                      padding: EdgeInsets.zero,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(25)),
                                                      onPressed: () {},
                                                      child: Text(
                                                        "File A Dispute",
                                                        style: TextStyle(
                                                            fontFamily: FontUtils.poppinsRegular,
                                                            fontSize: Fontsizes.size16,
                                                            color: Colors.red),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        SizedBox(height: 2.h,),
                                      ],
                                    ),
                                  if (model.bookingValue == "Cancel")
                                    Container(
                                      margin: EdgeInsets.only(top: 2.h),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: ColorUtils.red1,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w, vertical: 2.h),
                                        child: Text(
                                          "Lorem Ipsum is simply dummy text of the printing and type setting industry.",
                                          style: TextStyle(
                                              fontFamily: FontUtils.poppinsRegular,
                                              fontSize: 1.8.t,
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            if (milestonesSelected == true)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Text(
                                    "Payment By Milestone",
                                    style: TextStyle(
                                      fontFamily: FontUtils.poppinsMedium,
                                      fontSize: Fontsizes.size14,
                                      color: ColorUtils.black,
                                    ),
                                  ),
                                  SizedBox(height: 2.5.h,),
                                  if(model.bookingValue == "Pending")
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            ImageUtils.circle1,
                                            width: 20.i,
                                            height: 20.i,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(height: 2.h,),
                                          Text(
                                            "Initial \nPayment",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily:
                                              FontUtils.poppinsMedium,
                                              fontSize: Fontsizes.size10,
                                              color: ColorUtils.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Image.asset(
                                            ImageUtils.circleGrey2,
                                            width: 20.i,
                                            height: 20.i,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(height: 2.h,),
                                          Text(
                                            "Document \nSubmission",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily:
                                              FontUtils.poppinsMedium,
                                              fontSize: Fontsizes.size10,
                                              color: ColorUtils.black.withOpacity(0.3),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Image.asset(
                                            ImageUtils.circleGrey3,
                                            width: 20.i,
                                            height: 20.i,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(height: 2.h,),
                                          Text(
                                            "Final \nDelivery",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily:
                                              FontUtils.poppinsMedium,
                                              fontSize: Fontsizes.size10,
                                              color: ColorUtils.black.withOpacity(0.3),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  if(model.bookingValue == "Process")
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              ImageUtils.circle1,
                                              width: 20.i,
                                              height: 20.i,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(height: 2.h,),
                                            Text(
                                              "Initial \nPayment",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily:
                                                FontUtils.poppinsMedium,
                                                fontSize: Fontsizes.size10,
                                                color: ColorUtils.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Image.asset(
                                              ImageUtils.circle2,
                                              width: 20.i,
                                              height: 20.i,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(height: 2.h,),
                                            Text(
                                              "Document \nSubmission",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily:
                                                FontUtils.poppinsMedium,
                                                fontSize: Fontsizes.size10,
                                                color: ColorUtils.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Image.asset(
                                              ImageUtils.circleGrey3,
                                              width: 20.i,
                                              height: 20.i,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(height: 2.h,),
                                            Text(
                                              "Final \nDelivery",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily:
                                                FontUtils.poppinsMedium,
                                                fontSize: Fontsizes.size10,
                                                color: ColorUtils.black.withOpacity(0.3),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  if(model.bookingValue == "Completed")
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              ImageUtils.circle1,
                                              width: 20.i,
                                              height: 20.i,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(height: 2.h,),
                                            Text(
                                              "Initial \nPayment",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily:
                                                FontUtils.poppinsMedium,
                                                fontSize: Fontsizes.size10,
                                                color: ColorUtils.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Image.asset(
                                              ImageUtils.circle2,
                                              width: 20.i,
                                              height: 20.i,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(height: 2.h,),
                                            Text(
                                              "Document \nSubmission",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily:
                                                FontUtils.poppinsMedium,
                                                fontSize: Fontsizes.size10,
                                                color: ColorUtils.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Image.asset(
                                              ImageUtils.circle3,
                                              width: 20.i,
                                              height: 20.i,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(height: 2.h,),
                                            Text(
                                              "Final \nDelivery",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily:
                                                FontUtils.poppinsMedium,
                                                fontSize: Fontsizes.size10,
                                                color: ColorUtils.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  if(model.bookingValue == "Cancel")
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              ImageUtils.circleGrey1,
                                              width: 20.i,
                                              height: 20.i,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(height: 2.h,),
                                            Text(
                                              "Initial \nPayment",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily:
                                                FontUtils.poppinsMedium,
                                                fontSize: Fontsizes.size10,
                                                color: ColorUtils.black.withOpacity(0.3),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Image.asset(
                                              ImageUtils.circleGrey2,
                                              width: 20.i,
                                              height: 20.i,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(height: 2.h,),
                                            Text(
                                              "Document \nSubmission",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily:
                                                FontUtils.poppinsMedium,
                                                fontSize: Fontsizes.size10,
                                                color: ColorUtils.black.withOpacity(0.3),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Image.asset(
                                              ImageUtils.circleGrey3,
                                              width: 20.i,
                                              height: 20.i,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(height: 2.h,),
                                            Text(
                                              "Final \nDelivery",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily:
                                                FontUtils.poppinsMedium,
                                                fontSize: Fontsizes.size10,
                                                color: ColorUtils.black.withOpacity(0.3),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  if(model.bookingValue == "Process")
                                    Column(
                                      children: [
                                        SizedBox(height: 4.h,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Initial Payment",
                                              style: TextStyle(
                                                  fontFamily:
                                                  FontUtils.poppinsRegular,
                                                  fontSize: Fontsizes.size13,
                                                  color: ColorUtils.black),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Done",
                                                  style: TextStyle(
                                                      fontFamily:
                                                      FontUtils.poppinsRegular,
                                                      fontSize: Fontsizes.size13,
                                                      color: ColorUtils.lightGreen3),
                                                ),
                                                SizedBox(width: 1.w,),
                                                Icon(Icons.check,
                                                    size: 5.i,
                                                    color: ColorUtils.lightGreen3
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 1.h,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Milestone Status",
                                              style: TextStyle(
                                                  fontFamily:
                                                  FontUtils.poppinsRegular,
                                                  fontSize: Fontsizes.size13,
                                                  color: ColorUtils.black),
                                            ),
                                            Text(
                                              "Completed",
                                              style: TextStyle(
                                                  fontFamily:
                                                  FontUtils.poppinsMedium,
                                                  fontSize: Fontsizes.size13,
                                                  color: ColorUtils.lightGreen3),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  if(model.bookingValue == "Completed")
                                    Column(
                                      children: [
                                        SizedBox(height: 4.h,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Initial Payment",
                                              style: TextStyle(
                                                  fontFamily:
                                                  FontUtils.poppinsRegular,
                                                  fontSize: Fontsizes.size13,
                                                  color: ColorUtils.black),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Done",
                                                  style: TextStyle(
                                                      fontFamily:
                                                      FontUtils.poppinsRegular,
                                                      fontSize: Fontsizes.size13,
                                                      color: ColorUtils.lightGreen3),
                                                ),
                                                SizedBox(width: 1.w,),
                                                Icon(Icons.check,
                                                    size: 5.i,
                                                    color: ColorUtils.lightGreen3
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 1.h,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Document Submission",
                                              style: TextStyle(
                                                  fontFamily:
                                                  FontUtils.poppinsRegular,
                                                  fontSize: Fontsizes.size13,
                                                  color: ColorUtils.black),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Done",
                                                  style: TextStyle(
                                                      fontFamily:
                                                      FontUtils.poppinsRegular,
                                                      fontSize: Fontsizes.size13,
                                                      color: ColorUtils.lightGreen3),
                                                ),
                                                SizedBox(width: 1.w,),
                                                Icon(Icons.check,
                                                    size: 5.i,
                                                    color: ColorUtils.lightGreen3
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 1.h,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Milestone Status",
                                              style: TextStyle(
                                                  fontFamily:
                                                  FontUtils.poppinsRegular,
                                                  fontSize: Fontsizes.size13,
                                                  color: ColorUtils.black),
                                            ),
                                            Text(
                                              "Completed",
                                              style: TextStyle(
                                                  fontFamily:
                                                  FontUtils.poppinsRegular,
                                                  fontSize: Fontsizes.size13,
                                                  color: ColorUtils.lightGreen3),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  SizedBox(height: 4.h,),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 0.5.h),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                      color: ColorUtils.lightBlue,
                                    ),
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
                                            horizontal: 4.w, vertical: 1.5.h),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color:
                                                          ColorUtils.lightBlue)),
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
                                                          fontFamily:
                                                          FontUtils.poppinsMedium,
                                                          fontSize: Fontsizes.size16,
                                                          color: ColorUtils.black),
                                                    ),
                                                    SizedBox(
                                                      height: 0.25.h,
                                                    ),
                                                    Text(
                                                      "Contractor - TAWJEEH",
                                                      style: TextStyle(
                                                          fontFamily: FontUtils
                                                              .poppinsRegular,
                                                          fontSize: Fontsizes.size11,
                                                          color: ColorUtils.black),
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
                                  if(model.bookingValue == "Process")
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 4.h,),
                                        Text(
                                          "Documented proof",
                                          style: TextStyle(
                                            fontFamily: FontUtils.poppinsMedium,
                                            fontSize: Fontsizes.size14,
                                            color: ColorUtils.black,
                                          ),
                                        ),
                                        SizedBox(height: 2.h,),
                                        SizedBox(
                                          height: 10.h,
                                          child: ListView.separated(
                                            scrollDirection: Axis.horizontal,
                                            //padding: EdgeInsets.symmetric(horizontal: 2.w),
                                            physics: BouncingScrollPhysics(),
                                            separatorBuilder: (context, index) {
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
                                      ],
                                    ),
                                  if(model.bookingValue == "Completed")
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 4.h,),
                                        Text(
                                          "Documented proof",
                                          style: TextStyle(
                                            fontFamily: FontUtils.poppinsMedium,
                                            fontSize: Fontsizes.size14,
                                            color: ColorUtils.black,
                                          ),
                                        ),
                                        SizedBox(height: 2.h,),
                                        SizedBox(
                                          height: 10.h,
                                          child: ListView.separated(
                                            scrollDirection: Axis.horizontal,
                                            //padding: EdgeInsets.symmetric(horizontal: 2.w),
                                            physics: BouncingScrollPhysics(),
                                            separatorBuilder: (context, index) {
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
                                      ],
                                    ),
                                  SizedBox(height: 5.h,),
                                  Text(
                                    "Booking Summary",
                                    style: TextStyle(
                                      fontFamily: FontUtils.poppinsMedium,
                                      fontSize: Fontsizes.size14,
                                      color: ColorUtils.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total Amount",
                                        style: TextStyle(
                                          fontFamily: FontUtils.poppinsRegular,
                                          fontSize: Fontsizes.size13,
                                          color: ColorUtils.black,
                                        ),
                                      ),
                                      Text(
                                        "AED 1800",
                                        style: TextStyle(
                                          fontFamily: FontUtils.poppinsRegular,
                                          fontSize: Fontsizes.size13,
                                          color: ColorUtils.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "First Mile Stone Amount",
                                        style: TextStyle(
                                          fontFamily: FontUtils.poppinsRegular,
                                          fontSize: Fontsizes.size13,
                                          color: ColorUtils.black,
                                        ),
                                      ),
                                      Text(
                                        "AED 500",
                                        style: TextStyle(
                                          fontFamily: FontUtils.poppinsRegular,
                                          fontSize: Fontsizes.size13,
                                          color: ColorUtils.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total Amount Paid",
                                        style: TextStyle(
                                          fontFamily: FontUtils.poppinsSemiBold,
                                          fontSize: Fontsizes.size13,
                                          color: ColorUtils.black,
                                        ),
                                      ),
                                      Text(
                                        "AED 200",
                                        style: TextStyle(
                                          fontFamily: FontUtils.poppinsSemiBold,
                                          fontSize: Fontsizes.size13,
                                          color: ColorUtils.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  if(model.bookingValue == "Pending")
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: ColorUtils.red1,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4.w, vertical: 2.h),
                                      child: Text(
                                        "Your request is in process. You will be notified once agent starts working on it.",
                                        style: TextStyle(
                                            fontFamily: FontUtils.poppinsRegular,
                                            fontSize: 1.8.t,
                                            color: Colors.red),
                                      ),
                                    ),
                                  ),
                                  if(model.bookingValue == "Process")
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
                                              onPressed: () {

                                              },
                                              child: Text(
                                                "Approve",
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
                                                "Disapprove",
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
