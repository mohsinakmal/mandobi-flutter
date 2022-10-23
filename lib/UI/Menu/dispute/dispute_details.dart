import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/Menu/dispute/disputes.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/user_mainViewModel.dart';
import 'package:mandobi_mobile_app/Widgets/app_bar_two_items.dart';
import 'package:mandobi_mobile_app/Widgets/book_mark_circle.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_two.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class DisputeDetails extends StatefulWidget {
  final String? passportStatus;
  bool approvePressed = false;

  DisputeDetails({this.passportStatus, Key? key}) : super(key: key);

  @override
  State<DisputeDetails> createState() => _DisputeDetailsState();
}

class _DisputeDetailsState extends State<DisputeDetails> {
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
                          text: "Dispute Details",
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: HorizontalMargin(
                        widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                    color: widget.passportStatus == "Pending"
                                        ? ColorUtils.golden
                                        : widget.passportStatus == "In Process"
                                        ? ColorUtils.lightBlue1.withOpacity(0.13)
                                        : widget.passportStatus == "Resolved"
                                        ? ColorUtils.lightGreen1
                                        .withOpacity(0.2)
                                        : ColorUtils.red.withOpacity(0.2),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.5.w, vertical: 0.5.h),
                                    child: Text(
                                      widget.passportStatus!,
                                      style: TextStyle(
                                        fontFamily: FontUtils.poppinsRegular,
                                        fontSize: 1.6.t,
                                        color: widget.passportStatus == "Pending"
                                            ? ColorUtils.golden1
                                            : widget.passportStatus == "In Process"
                                            ? ColorUtils.lightBlue3
                                            : widget.passportStatus == "Resolved"
                                            ? ColorUtils.lightGreen1
                                            : ColorUtils.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
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
                                      horizontal: 4.w, vertical: 3.h),
                                  child: Column(
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
                                                    fontFamily:
                                                    FontUtils.poppinsRegular,
                                                    fontSize: Fontsizes.size11,
                                                    color: ColorUtils.black),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: BookMarkCircle(),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if (widget.passportStatus != "Cancelled")
                              SizedBox(
                                height: 8.h,
                              ),
                            if (widget.passportStatus == "Pending" ||
                                widget.passportStatus == "In Process")
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                                ),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 400),
                                  width: MediaQuery.of(context).size.width / 1,
                                  height: 6.5.h,
                                  //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: ColorUtils.red),
                                  ),
                                  child: MaterialButton(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25)),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return SimpleDialog(
                                            //titlePadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            //contentPadding: EdgeInsets.only(bottom: 3.h, top: 0.h),
                                            insetPadding:
                                            EdgeInsets.symmetric(horizontal: 4.w),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(3.i))),
                                            children: [
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    1,
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                      Alignment.centerRight,
                                                      child: InkWell(
                                                        onTap: (){
                                                          Navigator.pop(context);
                                                        },
                                                        child: Container(
                                                          margin: EdgeInsets.only(
                                                              right: 2.w),
                                                          decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            color: ColorUtils.red
                                                                .withOpacity(0.1),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets.all(
                                                                10.0),
                                                            child: SvgPicture.asset(
                                                                ImageUtils.redCross),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (widget.passportStatus ==
                                                        "Resolved")
                                                      Text(
                                                        "Your response has \nbeen recorded",
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            fontFamily: FontUtils
                                                                .poppinsMedium,
                                                            fontSize:
                                                            Fontsizes.size22,
                                                            color: ColorUtils.black),
                                                      ),
                                                    if (widget.passportStatus ==
                                                        "Pending" ||
                                                        widget.passportStatus ==
                                                            "In Process")
                                                      Text(
                                                        "Dispute \nCancellation",
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            fontFamily: FontUtils
                                                                .poppinsMedium,
                                                            fontSize:
                                                            Fontsizes.size22,
                                                            color: ColorUtils.black),
                                                      ),
                                                    SizedBox(
                                                      height: 2.h,
                                                    ),
                                                    Container(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal: 5.w),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          const BorderRadius.all(
                                                            Radius.circular(10.0),
                                                          ),
                                                        ),
                                                        child: TextField(
                                                          maxLines: 5,
                                                          style: TextStyle(
                                                              color:
                                                              ColorUtils.black),
                                                          decoration: InputDecoration(
                                                            //isDense: true,
                                                            contentPadding:
                                                            EdgeInsets.only(
                                                                left: 5.w,
                                                                top: 2.5.h,
                                                                right: 2.w,
                                                                bottom: 2.5.h),
                                                            enabledBorder:
                                                            OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: ColorUtils
                                                                      .black
                                                                      .withOpacity(
                                                                      0.5),
                                                                  width: 1),
                                                              borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      10.0)),
                                                            ),
                                                            focusedBorder:
                                                            OutlineInputBorder(
                                                              borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      10.0)),
                                                              borderSide: BorderSide(
                                                                  color: ColorUtils
                                                                      .lightBlue,
                                                                  width: 1.5),
                                                            ),
                                                            hintText: "Reason",
                                                            hintStyle: TextStyle(
                                                                color: ColorUtils
                                                                    .black
                                                                    .withOpacity(
                                                                    0.5)),
                                                          ),
                                                        )),
                                                    SizedBox(
                                                      height: 3.h,
                                                    ),
                                                    Container(
                                                      decoration: const BoxDecoration(
                                                        shape: BoxShape.rectangle,
                                                        borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                30.0)),
                                                      ),
                                                      child: AnimatedContainer(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal: 7.w),
                                                        duration: const Duration(
                                                            milliseconds: 400),
                                                        height: 6.5.h,
                                                        //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                          color: ColorUtils.lightBlue,
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
                                                            Navigator.push(
                                                                context,
                                                                PageTransition(
                                                                    type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                    child:
                                                                    Disputes()));
                                                          },
                                                          child: Text(
                                                            "Submit",
                                                            style: TextStyle(
                                                                fontFamily: FontUtils
                                                                    .poppinsRegular,
                                                                fontSize: 1.8.t,
                                                                color: Colors.white),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Text(
                                      widget.passportStatus == "Pending"
                                          ? "Cancel Dispute"
                                          : "Cancel",
                                      style: TextStyle(
                                          fontFamily: FontUtils.poppinsRegular,
                                          fontSize: 1.8.t,
                                          color: Colors.red),
                                    ),
                                  ),
                                ),
                              ),
                            if (widget.passportStatus == "Resolved" &&
                                widget.approvePressed == false)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
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
                                          color: ColorUtils.lightBlue3,
                                        ),
                                        child: MaterialButton(
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(25)),
                                          onPressed: () {
                                            widget.approvePressed == true;
                                            setState(() {

                                            });
                                          },
                                          child: Text(
                                            "Approve",
                                            style: TextStyle(
                                                fontFamily: FontUtils.poppinsRegular,
                                                fontSize: 1.8.t,
                                                color: Colors.white),
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
                                          border: Border.all(color: ColorUtils.red),
                                        ),
                                        child: MaterialButton(
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(25)),
                                          onPressed: () {},
                                          child: Text(
                                            "Disapprove",
                                            style: TextStyle(
                                                fontFamily: FontUtils.poppinsRegular,
                                                fontSize: 1.8.t,
                                                color: Colors.red),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            if (widget.passportStatus == "Resolved" &&
                                widget.approvePressed == true)
                              Column(
                                children: [
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: ColorUtils.red1,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4.w, vertical: 2.h),
                                      child: Text(
                                        "Awaiting admin's & Client's approval",
                                        style: TextStyle(
                                            fontFamily: FontUtils.poppinsRegular,
                                            fontSize: 1.8.t,
                                            color: Colors.red),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            if (widget.passportStatus == "Cancelled")
                              Column(
                                children: [
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Container(
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
