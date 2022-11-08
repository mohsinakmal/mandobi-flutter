import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/agent_registration_model.dart';
import 'package:mandobi_mobile_app/Widgets/app_bar_two_items.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_one.dart';
import 'package:mandobi_mobile_app/Widgets/custom_label_text_field.dart';
import 'package:mandobi_mobile_app/Widgets/custom_text_field.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/text_field_spaces.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:stacked/stacked.dart';

class AgentProfileExperience extends StatefulWidget {
  const AgentProfileExperience({Key? key}) : super(key: key);

  @override
  State<AgentProfileExperience> createState() => _AgentProfileExperienceState();
}

class _AgentProfileExperienceState extends State<AgentProfileExperience> with TickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      value: 0.4,
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
                                            Text("40%",
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
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(8),
                                    color: ColorUtils.lightBlue5,
                                    border: Border.all(color: ColorUtils.black),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "+",
                                                style: TextStyle(
                                                  fontFamily: FontUtils.poppinsSemiBold,
                                                  fontSize: Fontsizes.size16,
                                                  color: ColorUtils.lightBlue,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' Experience',
                                                style: TextStyle(
                                                  fontFamily: FontUtils.poppinsSemiBold,
                                                  fontSize: Fontsizes.size16,
                                                  color: ColorUtils.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        TextFieldSpace(),
                                        Container(
                                          color: ColorUtils.white,
                                          child: TextField(
                                            style:  TextStyle(color: ColorUtils.black),
                                            keyboardType: TextInputType.text,
                                            decoration:  InputDecoration(
                                              //isDense: true,
                                              contentPadding: EdgeInsets.only(left: 5.w,top: 2.h, right: 2.w, bottom: 3.h),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: ColorUtils.black.withOpacity(0.5), width: 1),
                                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                borderSide: BorderSide(color: ColorUtils.lightBlue, width: 1.5),
                                              ),
                                              hintText: "Company",
                                              hintStyle: TextStyle(color: ColorUtils.black.withOpacity(0.5)),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 1.h,),
                                        Container(
                                          color: ColorUtils.white,
                                          child: TextField(
                                            style:  TextStyle(color: ColorUtils.black),
                                            keyboardType: TextInputType.text,
                                            decoration:  InputDecoration(
                                              //isDense: true,
                                              contentPadding: EdgeInsets.only(left: 5.w,top: 2.h, right: 2.w, bottom: 3.h),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: ColorUtils.black.withOpacity(0.5), width: 1),
                                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                borderSide: BorderSide(color: ColorUtils.lightBlue, width: 1.5),
                                              ),
                                              hintText: "Designation",
                                              hintStyle: TextStyle(color: ColorUtils.black.withOpacity(0.5)),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 1.h,),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                color: ColorUtils.white,
                                                child: TextField(
                                                  style:  TextStyle(color: ColorUtils.black),
                                                  keyboardType: TextInputType.number,
                                                  decoration:  InputDecoration(
                                                    contentPadding: EdgeInsets.only(left: 5.w,top: 2.h, right: 2.w, bottom: 3.h),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: ColorUtils.black.withOpacity(0.5), width: 1),
                                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                      borderSide: BorderSide(color: ColorUtils.lightBlue, width: 1.5),
                                                    ),
                                                    hintText: "Year",
                                                    hintStyle: TextStyle(color: ColorUtils.black.withOpacity(0.5)),
                                                    prefixIcon: Icon(
                                                      Icons.calendar_today,
                                                      color: ColorUtils.silver10,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                                              child: Text("To",
                                                style: TextStyle(
                                                    fontFamily: FontUtils.poppinsRegular,
                                                    fontSize: Fontsizes.size12,
                                                    color: ColorUtils.silver10
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                color: ColorUtils.white,
                                                child: TextField(
                                                  style:  TextStyle(color: ColorUtils.black),
                                                  keyboardType: TextInputType.number,
                                                  decoration:  InputDecoration(
                                                    contentPadding: EdgeInsets.only(left: 5.w,top: 2.h, right: 2.w, bottom: 3.h),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: ColorUtils.black.withOpacity(0.5), width: 1),
                                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                      borderSide: BorderSide(color: ColorUtils.lightBlue, width: 1.5),
                                                    ),
                                                    hintText: "Year",
                                                    hintStyle: TextStyle(color: ColorUtils.black.withOpacity(0.5)),
                                                    prefixIcon: Icon(
                                                      Icons.calendar_today,
                                                      color: ColorUtils.silver10,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        TextFieldSpace(),
                                        Container(
                                          height: 15.h,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              color: ColorUtils.white,
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: ColorUtils.silver6)
                                          ),
                                          child: Center(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.attach_file),
                                                SizedBox(height: 0.5.h,),
                                                Text(
                                                  "Upload Attachments",
                                                  style: TextStyle(
                                                      fontFamily: FontUtils.poppinsRegular,
                                                      fontSize: Fontsizes.size10,
                                                      color: ColorUtils.black.withOpacity(0.5)
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 4.h,),
                                        CustomButtonOne(
                                          textValue: "Add",
                                          onButtonPressed: (){

                                          },
                                        ),
                                        SizedBox(height: 2.h,),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3.h,),
                                TextField(
                                  style:  TextStyle(color: ColorUtils.black),
                                  keyboardType: TextInputType.text,
                                  decoration:  InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 5.w,top: 2.h, right: 2.w, bottom: 3.h),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: ColorUtils.black.withOpacity(0.5), width: 1),
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      borderSide: BorderSide(color: ColorUtils.lightBlue, width: 1.5),
                                    ),
                                    hintText: "Education",
                                    hintStyle: TextStyle(
                                        color: ColorUtils.black,
                                      fontFamily: FontUtils.poppinsSemiBold,
                                      fontSize: Fontsizes.size16,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.add,
                                      color: ColorUtils.blue1,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4.h,),
                                Text("Emirated ID",
                                  style: TextStyle(
                                    color: ColorUtils.black,
                                    fontFamily: FontUtils.poppinsSemiBold,
                                    fontSize: Fontsizes.size16,
                                  ),
                                ),
                                TextFieldSpace(),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        height: 15.h,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: ColorUtils.lightBlue5,
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: ColorUtils.silver6)
                                        ),
                                        child: Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(Icons.attach_file),
                                              SizedBox(height: 0.5.h,),
                                              Text(
                                                "Upload Attachments",
                                                style: TextStyle(
                                                    fontFamily: FontUtils.poppinsRegular,
                                                    fontSize: Fontsizes.size10,
                                                    color: ColorUtils.black.withOpacity(0.5)
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 3.w,),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 15.h,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: ColorUtils.lightBlue5,
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: ColorUtils.silver6)
                                        ),
                                        child: Center(
                                          child: Icon(Icons.add),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4.h,),
                                CustomButtonOne(
                                  textValue: "Next",
                                  onButtonPressed: (){
                                  },
                                ),
                                TextFieldSpace(),
                              ],
                            ),
                          ),
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
