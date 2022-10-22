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
  const BookingDetails({Key? key}) : super(key: key);

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
              body: SingleChildScrollView(
                child: HorizontalMargin(
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
                              borderRadius: BorderRadius.circular(13),
                              color: ColorUtils.golden,
                              // widget.passportStatus == "Pending"
                              //     ? ColorUtils.golden
                              //     : widget.passportStatus == "In Process"
                              //     ? ColorUtils.lightBlue1.withOpacity(0.13)
                              //     : widget.passportStatus == "Resolved"
                              //     ? ColorUtils.lightGreen1
                              //     .withOpacity(0.2)
                              //     : ColorUtils.red.withOpacity(0.2),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.5.w, vertical: 0.5.h),
                              child: Text(
                                "Pending",
                                //widget.passportStatus!,
                                style: TextStyle(
                                  fontFamily: FontUtils.poppinsRegular,
                                  fontSize: 1.6.t,
                                  color: ColorUtils.golden1,
                                  // widget.passportStatus == "Pending"
                                  //     ? ColorUtils.golden1
                                  //     : widget.passportStatus == "In Process"
                                  //     ? ColorUtils.lightBlue3
                                  //     : widget.passportStatus == "Resolved"
                                  //     ? ColorUtils.lightGreen1
                                  //     : ColorUtils.red,
                                ),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  ImageUtils.circle1,
                                  width: 20.i,
                                  height: 20.i,
                                  fit: BoxFit.cover,
                                ),
                                Image.asset(ImageUtils.circleGrey2,
                                  width: 20.i,
                                  height: 20.i,
                                  fit: BoxFit.cover,
                                ),
                                Image.asset(ImageUtils.circleGrey3,
                                  width: 20.i,
                                  height: 20.i,
                                  fit: BoxFit.cover,
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
          ),
        );
      },
    );
  }
}
