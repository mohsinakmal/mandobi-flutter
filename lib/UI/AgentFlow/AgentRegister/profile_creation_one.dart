import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentRegister/profile_creation_two.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/agent_registration_model.dart';
import 'package:mandobi_mobile_app/Widgets/app_bar_two_items.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_one.dart';
import 'package:mandobi_mobile_app/Widgets/custom_text_field.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class AgentProfileCreationOne extends StatefulWidget {

  const AgentProfileCreationOne({Key? key}) : super(key: key);

  @override
  State<AgentProfileCreationOne> createState() => _AgentProfileCreationOneState();
}

class _AgentProfileCreationOneState extends State<AgentProfileCreationOne> with TickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      value: 0.2,
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {});
    });
    //controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AgentRegistrationModel>.reactive(
      viewModelBuilder: () => locator<AgentRegistrationModel>(),
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
                          text: "Profile Creation",
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HorizontalMargin(
                            widget: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 2.h,),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: ColorUtils.lightBlue)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Image.asset(ImageUtils.userPic,
                                          height: 15.i,
                                          width: 15.i,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 2.w,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Syed Ali Raza",
                                          style: TextStyle(
                                              fontFamily: FontUtils.poppinsMedium,
                                              fontSize: 2.t,
                                              color: ColorUtils.black
                                          ),
                                        ),
                                        SizedBox(height: 0.5.h,),
                                        Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width/2.1,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                border: Border.all(color: ColorUtils.lightBlue)
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                child: LinearProgressIndicator(
                                                  minHeight: 1.h,
                                                  backgroundColor: ColorUtils.white,
                                                  color: ColorUtils.lightBlue,
                                                  value: controller.value,
                                                  semanticsLabel: 'Linear progress indicator',
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 3.w,),
                                            Text("20%",
                                              style: TextStyle(
                                                  fontFamily: FontUtils.poppinsRegular,
                                                  fontSize: Fontsizes.size12,
                                                  color: ColorUtils.lightBlue
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2.h,),
                                CustomTextField(
                                  suffixRequired: false,
                                  prefixRequired: false,
                                  textInputType: TextInputType.text,
                                  hintText: "Title",
                                ),
                                SizedBox(height: 2.h,),
                                TextField(
                                  maxLines: 5,
                                  style:  TextStyle(color: ColorUtils.black),
                                  keyboardType: TextInputType.text,
                                  decoration:  InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: ColorUtils.black.withOpacity(0.5), width: 1),
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      borderSide: BorderSide(color: ColorUtils.lightBlue, width: 1.5),
                                    ),
                                    hintText: "About - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-lesopposed ",
                                    hintStyle: TextStyle(
                                        height: 0.2.h,
                                        fontFamily: FontUtils.poppinsRegular,
                                        fontSize: Fontsizes.size9,
                                        color: ColorUtils.silver10,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.h,),
                                CustomTextField(
                                  prefixRequired: false,
                                  suffixRequired: true,
                                  hintText: "Email",
                                  svgImage: ImageUtils.profileBlueEmail,
                                  suffixImageWidth: 10.i,
                                  suffixImageHeight: 10.i,
                                  textInputType: TextInputType.name,
                                ),
                                SizedBox(height: 2.h,),
                                IntlPhoneField(
                                  decoration: InputDecoration(
                                    counter: Text(""),
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    focusedBorder: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderSide: BorderSide(color: ColorUtils.lightBlue),
                                    ),
                                    labelText: 'Phone Number',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  initialCountryCode: 'PK',
                                  onChanged: (phone) {
                                    print(phone.completeNumber);
                                  },
                                ),
                                CustomTextField(
                                  suffixRequired: false,
                                  prefixRequired: false,
                                  textInputType: TextInputType.text,
                                  hintText: "Emara DB 1254 north area",
                                ),
                                SizedBox(height: 4.h,),
                                CustomButtonOne(
                                  onButtonPressed: (){
                                    Navigator.push(context,
                                        PageTransition(type: PageTransitionType.fade, child: AgentProfileCreationTwo()));
                                  },
                                  textValue: "Next",
                                ),
                              ],
                            ),
                          ),
                          // Bookings List
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
