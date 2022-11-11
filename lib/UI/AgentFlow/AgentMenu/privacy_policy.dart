import 'package:flutter/material.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/privacy_policy_text.dart';
import 'package:mandobi_mobile_app/Widgets/app_bar_two_items.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';


class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  AppBarTwoItems(text: "Privacy Policy",),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: HorizontalMargin(
                  widget: Column(
                    children: [
                      SizedBox(height: 4.h,),
                      PrivacyPolicyText(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
