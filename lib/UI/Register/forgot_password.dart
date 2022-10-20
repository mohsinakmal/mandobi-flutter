import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/user_registration_model.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_one.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:stacked/stacked.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserRegistrationModel>.reactive(
      viewModelBuilder: () => locator<UserRegistrationModel>(),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: context.getPadding().top,
                        ),
                        TopMargin(),
                        Center(
                          child: Text("Forgot Password",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: FontUtils.poppinsRegular,
                                fontSize: 2.t,
                                color: ColorUtils.darkBlue
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Image.asset(ImageUtils.bell,
                          width: 50.i,
                          height: 50.i,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text("Select which contact details should we use to reset your password",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 0.25.h,
                              fontFamily: FontUtils.poppinsRegular,
                              fontSize: 1.9.t,
                              color: ColorUtils.grey
                          ),
                        ),
                        SizedBox(height: 4.h,),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: ColorUtils.black.withOpacity(0.2)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorUtils.blue4,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(17.0),
                                    child: SvgPicture.asset(
                                        ImageUtils.sms,
                                      width: 5.i,
                                      height: 5.i,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4.w,),
                                Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("via SMS",
                                        style: TextStyle(
                                            fontFamily: FontUtils.poppinsRegular,
                                            fontSize: 1.7.t,
                                            color: ColorUtils.grey
                                        ),
                                      ),
                                      SizedBox(height: 0.5.h,),
                                      Text("+1 111 ******999",
                                        style: TextStyle(
                                            fontFamily: FontUtils.poppinsRegular,
                                            fontSize: 1.85.t,
                                            color: ColorUtils.black1
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 2.5.h,),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: ColorUtils.black.withOpacity(0.2)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorUtils.blue4,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(17.0),
                                    child: Image.asset(ImageUtils.emailBlue,
                                      width: 5.i,
                                      height: 5.i,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4.w,),
                                Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("via Email",
                                        style: TextStyle(
                                            fontFamily: FontUtils.poppinsRegular,
                                            fontSize: 1.7.t,
                                            color: ColorUtils.grey
                                        ),
                                      ),
                                      SizedBox(height: 0.5.h,),
                                      Text("m.jam****@email.com",
                                        style: TextStyle(
                                            fontFamily: FontUtils.poppinsRegular,
                                            fontSize: 1.85.t,
                                            color: ColorUtils.black1
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 6.h,),
                        CustomButtonOne(
                          onButtonPressed: (){},
                          textValue: "Continue",
                        ),
                        SizedBox(height: 4.h,),
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
