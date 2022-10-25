import 'package:flutter/material.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/Menu/payment/add_payment_method.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/user_mainViewModel.dart';
import 'package:mandobi_mobile_app/Widgets/app_bar_two_items.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({Key? key}) : super(key: key);

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
                          text: "Card Details",
                        ),
                        SizedBox(height: 6.h,),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5),
                            color: ColorUtils.grey3
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                            child: Row(
                              children: [
                                Image.asset(ImageUtils.masterCard,
                                width: 10.i,
                                  height: 10.i,
                                ),
                                SizedBox(width: 4.w,),
                                Text("**** **** **** *987",
                                  style: TextStyle(
                                    fontFamily: FontUtils.poppinsMedium,
                                    fontSize: Fontsizes.size16,
                                    color: ColorUtils.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 3.h,),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5),
                              color: ColorUtils.white,
                            border: Border.all(color: ColorUtils.silver2.withOpacity(0.2))
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                            child: Row(
                              children: [
                                Image.asset(ImageUtils.visaCard,
                                  width: 10.i,
                                  height: 10.i,
                                ),
                                SizedBox(width: 4.w,),
                                Text("**** **** **** *987",
                                  style: TextStyle(
                                    fontFamily: FontUtils.poppinsMedium,
                                    fontSize: Fontsizes.size16,
                                    color: ColorUtils.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h,),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                PageTransition(type: PageTransitionType.fade, child:  AddPaymentMethod(paymentScreenTitle: "",)));
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
                      ],
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
