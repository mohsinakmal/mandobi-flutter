import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/UserFlow/Menu/payment/add_payment_method.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/user_mainViewModel.dart';
import 'package:mandobi_mobile_app/Widgets/app_bar_two_items.dart';
import 'package:mandobi_mobile_app/Widgets/bottom_navigation_bar.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_one.dart';
import 'package:mandobi_mobile_app/Widgets/dialogBox.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

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
                          text: "Checkout",
                        ),
                        SizedBox(
                          height: 3.h,
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Booking Details",
                                  style: TextStyle(
                                      fontFamily: FontUtils.poppinsMedium,
                                      fontSize: Fontsizes.size16,
                                      color: ColorUtils.black),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  "Service Required",
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
                              height: 0.5.h,
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
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.5.h,
                            ),
                            Text(
                              "Select Payment Method",
                              style: TextStyle(
                                fontFamily: FontUtils.poppinsMedium,
                                fontSize: Fontsizes.size14,
                                color: ColorUtils.black,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: ColorUtils.silver4),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(ImageUtils.cardPayment,
                                        width: 7.i,
                                          height: 7.i,
                                        ),
                                        SizedBox(width: 1.5.w,),
                                        Text(
                                          "Pay Via Card",
                                          style: TextStyle(
                                            fontFamily: FontUtils.poppinsMedium,
                                            fontSize: Fontsizes.size10,
                                            color: ColorUtils.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 2.w,),
                                Expanded(
                                  child: Container(
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: ColorUtils.silver4),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(ImageUtils.appleBlackLogo,
                                        width: 7.i,
                                          height: 7.i,
                                        ),
                                        SizedBox(width: 1.w,),
                                        Text(
                                          "Pay Via Apple Pay",
                                          style: TextStyle(
                                            fontFamily: FontUtils.poppinsMedium,
                                            fontSize: Fontsizes.size10,
                                            color: ColorUtils.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context,
                                    PageTransition(type: PageTransitionType.fade, child:  AddPaymentMethod(paymentScreenTitle: "Checkout",)));
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.add,
                                    color: ColorUtils.lightBlue,
                                    size: 4.i,
                                  ),
                                  Text("Payment Method",
                                    style: TextStyle(
                                      fontFamily: FontUtils.poppinsSemiBold,
                                      fontSize: Fontsizes.size14,
                                      color: ColorUtils.lightBlue6,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
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
                                  "First Milestone Amount",
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
                              height: 4.h,
                            ),
                            CustomButtonOne(
                              textValue: "Submit",
                              onButtonPressed: (){
                                showDialog(context: context,
                                    builder: (context) {
                                  return MyCustomDialog(
                                    childWidget: Column(
                                      children: [
                                        Text(
                                          "Booking Successful",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: FontUtils
                                                  .poppinsMedium,
                                              fontSize:
                                              Fontsizes.size22,
                                              color: ColorUtils.black),
                                        ),
                                        SizedBox(height: 2.h,),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                                          child: Text(
                                            "Your Booking has been placed. You will receive confirmation in a while. ",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              height: 0.25.h,
                                                fontFamily: FontUtils
                                                    .poppinsRegular,
                                                fontSize:
                                                Fontsizes.size10,
                                                color: ColorUtils.silver1),
                                          ),
                                        ),
                                        SizedBox(height: 2.h,),
                                        Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      ),
                                      child: AnimatedContainer(
                                        duration: const Duration(milliseconds: 400),
                                        height: 6.5.h,
                                        //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          border: Border.all(color: ColorUtils.lightBlue,width: 2),
                                        ),
                                        child: MaterialButton(
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                          onPressed: (){
                                            Navigator.push(context,
                                                PageTransition(type: PageTransitionType.fade, child:  MyBottomNavBar(index: 1,)));
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                                            child: Text(
                                              "View Bookings",
                                              style: TextStyle(
                                                  fontFamily: FontUtils.poppinsRegular,
                                                  fontSize: Fontsizes.size14,
                                                  color: ColorUtils.lightBlue),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                        SizedBox(height: 2.h,),
                                      ],
                                    ),
                                  );
                                    },
                                );
                              },
                            ),
                            SizedBox(
                              height: 1.h,
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
