import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentRegister/profile_creation_add_education.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentRegister/profile_creation_add_experience.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentRegister/profile_creation_three.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/agent_registration_model.dart';
import 'package:mandobi_mobile_app/Widgets/app_bar_two_items.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_one.dart';
import 'package:mandobi_mobile_app/Widgets/custom_label_text_field.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class AgentProfileCreationTwo extends StatefulWidget {

  bool? forEducation;

  AgentProfileCreationTwo({this.forEducation, Key? key}) : super(key: key);

  @override
  State<AgentProfileCreationTwo> createState() =>
      _AgentProfileCreationTwoState();
}

class _AgentProfileCreationTwoState extends State<AgentProfileCreationTwo>
    with TickerProviderStateMixin {
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
                                SizedBox(
                                  height: 2.h,
                                ),
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
                                      width: 2.w,
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
                                              fontSize: 2.t,
                                              color: ColorUtils.black),
                                        ),
                                        SizedBox(
                                          height: 0.5.h,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.1,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                      color: ColorUtils
                                                          .lightBlue)),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                                child: LinearProgressIndicator(
                                                  minHeight: 1.h,
                                                  backgroundColor:
                                                      ColorUtils.white,
                                                  color: ColorUtils.lightBlue,
                                                  value: controller.value,
                                                  semanticsLabel:
                                                      'Linear progress indicator',
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Text(
                                              widget.forEducation == true ?
                                              "40%" : "55%",
                                              style: TextStyle(
                                                  fontFamily:
                                                      FontUtils.poppinsRegular,
                                                  fontSize: Fontsizes.size12,
                                                  color: ColorUtils.lightBlue),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.forEducation == true ?
                                      "Add Education" : "Add Experience",
                                      style: TextStyle(
                                        fontFamily: FontUtils.poppinsSemiBold,
                                        fontSize: Fontsizes.size14,
                                        color: ColorUtils.black,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 4.w),
                                      child: Text(
                                        "+ Add",
                                        style: TextStyle(
                                          fontFamily: FontUtils.poppinsMedium,
                                          fontSize: Fontsizes.size11,
                                          color: ColorUtils.blue3,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                CustomLabelTextField(
                                  textInputType: TextInputType.text,
                                  labelText: "Company",
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                CustomLabelTextField(
                                  textInputType: TextInputType.text,
                                  labelText: "Designation",
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        style:
                                            TextStyle(color: ColorUtils.black),
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.auto,
                                          //isDense: true,
                                          suffixIconConstraints: BoxConstraints(
                                            minHeight: 10.i,
                                            minWidth: 10.i,
                                          ),
                                          contentPadding: EdgeInsets.only(
                                              left: 5.w,
                                              top: 3.h,
                                              right: 2.w,
                                              bottom: 3.h),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: ColorUtils.black
                                                    .withOpacity(0.5),
                                                width: 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: ColorUtils.lightBlue,
                                                width: 1.5),
                                          ),
                                          labelText: "Year From",
                                          labelStyle: TextStyle(
                                              color: ColorUtils.black
                                                  .withOpacity(0.5)),
                                          suffixIcon: Padding(
                                            padding:
                                                EdgeInsets.only(right: 4.w),
                                            child: SvgPicture.asset(
                                              ImageUtils.calenderIcon,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Expanded(
                                      child: TextField(
                                        style:
                                            TextStyle(color: ColorUtils.black),
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.auto,
                                          //isDense: true,
                                          suffixIconConstraints: BoxConstraints(
                                            minHeight: 10.i,
                                            minWidth: 10.i,
                                          ),
                                          contentPadding: EdgeInsets.only(
                                              left: 5.w,
                                              top: 3.h,
                                              right: 2.w,
                                              bottom: 3.h),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: ColorUtils.black
                                                    .withOpacity(0.5),
                                                width: 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: ColorUtils.lightBlue,
                                                width: 1.5),
                                          ),
                                          labelText: "Year To",
                                          labelStyle: TextStyle(
                                              color: ColorUtils.black
                                                  .withOpacity(0.5)),
                                          suffixIcon: Padding(
                                            padding:
                                                EdgeInsets.only(right: 4.w),
                                            child: SvgPicture.asset(
                                              ImageUtils.calenderIcon,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  "Upload Document",
                                  style: TextStyle(
                                    fontFamily: FontUtils.poppinsMedium,
                                    fontSize: Fontsizes.size14,
                                    color: ColorUtils.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                /*Row(
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
                                ),*/
                                Container(
                                  height: 15.h,
                                  width: 17.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: ColorUtils.lightBlue5,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: ColorUtils.silver6)),
                                  child: Center(
                                    child: Icon(Icons.add),
                                  ),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25.0)),
                                          border: Border.all(color: ColorUtils.lightBlue, width: 2),
                                        ),
                                        child: AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 400),
                                          height: 7.h,
                                          //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(35),
                                            color: ColorUtils.white,
                                          ),
                                          child: MaterialButton(
                                            padding: EdgeInsets.zero,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            onPressed: () {},
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  fontFamily:
                                                      FontUtils.poppinsRegular,
                                                  fontSize: 1.8.t,
                                                color: ColorUtils.lightBlue,),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 4.w,),
                                    Expanded(
                                      child: CustomButtonOne(
                                        onButtonPressed: () {
                                          if(widget.forEducation == true){
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type: PageTransitionType.fade,
                                                    child:
                                                    ProfileCreationAddEducation()));
                                          }
                                          else{
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type: PageTransitionType.fade,
                                                    child:
                                                    ProfileCreationAddExperience()));
                                          }
                                        },
                                        textValue: "Save",
                                      ),
                                    ),
                                  ],
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
