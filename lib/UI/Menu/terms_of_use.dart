import 'package:flutter/material.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/terms_of_use_text.dart';
import 'package:mandobi_mobile_app/Widgets/app_bar_two_items.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                AppBarTwoItems(text: "Terms Of Use",),
                SizedBox(height: 2.h,),
                Text(
                  "Welcome to Mandobi",
                  style: TextStyle(
                      fontFamily:
                      FontUtils.poppinsMedium,
                      fontSize: Fontsizes.size17,
                      color: ColorUtils.black),
                ),
                SizedBox(height: 4.h,),
                TermsOfUseText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
