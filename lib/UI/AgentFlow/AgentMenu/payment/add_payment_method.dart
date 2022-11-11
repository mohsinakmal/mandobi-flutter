import 'package:flutter/material.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/UserFlow/Home/checkout.dart';
import 'package:mandobi_mobile_app/UI/UserFlow/Menu/payment/card_details.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/user_mainViewModel.dart';
import 'package:mandobi_mobile_app/Widgets/app_bar_two_items.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_one.dart';
import 'package:mandobi_mobile_app/Widgets/custom_text_field.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class AddPaymentMethod extends StatelessWidget {

  String? paymentScreenTitle;

  AddPaymentMethod({this.paymentScreenTitle, Key? key}) : super(key: key);

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
                          text: "Add Payment Method",
                        ),
                        SizedBox(height: 6.h,),
                        CustomTextField(
                          hintText: "Card Number",
                          prefixRequired: false,
                          suffixRequired: false,
                          textInputType: TextInputType.number,
                        ),
                        SizedBox(height: 2.5.h,),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                hintText: "MM/YY",
                                prefixRequired: false,
                                suffixRequired: false,
                                textInputType: TextInputType.number,
                              ),
                            ),
                            SizedBox(width: 3.w,),
                            Expanded(
                              child: CustomTextField(
                                hintText: "CVC/CVV",
                                prefixRequired: false,
                                suffixRequired: false,
                                textInputType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.5.h,),
                        CustomTextField(
                          hintText: "Card Holder Name",
                          prefixRequired: false,
                          suffixRequired: false,
                          textInputType: TextInputType.name,
                        ),
                        SizedBox(height: 2.5.h,),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorUtils.darkBlue2
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Icon(Icons.check,
                                size: 4.i,
                                color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 3.w,),
                            Text(
                              "Save Card",
                              style: TextStyle(
                                fontFamily: FontUtils.poppinsRegular,
                                fontSize: Fontsizes.size14,
                                color: ColorUtils.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6.h,),
                        CustomButtonOne(
                          textValue: "Save",
                          onButtonPressed: (){
                            if(paymentScreenTitle == "Checkout"){
                              Navigator.push(context,
                                  PageTransition(type: PageTransitionType.fade, child:  Checkout()));
                            }
                            else{
                              Navigator.push(context,
                                  PageTransition(type: PageTransitionType.fade, child:  CardDetails()));
                            }
                          },
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
