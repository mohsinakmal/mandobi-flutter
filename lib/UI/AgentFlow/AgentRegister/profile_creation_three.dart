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
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:stacked/stacked.dart';

class AgentProfileCreationThree extends StatefulWidget {
  const AgentProfileCreationThree({Key? key}) : super(key: key);

  @override
  State<AgentProfileCreationThree> createState() => _AgentProfileCreationThreeState();
}

class _AgentProfileCreationThreeState extends State<AgentProfileCreationThree> with TickerProviderStateMixin {

  late AnimationController controller;
  String _character = "Passport Renewal";

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
                                            Text("80%",
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
                                Text(
                                  "Categories",
                                  style: TextStyle(
                                    fontFamily: FontUtils.poppinsSemiBold,
                                    fontSize: Fontsizes.size14,
                                    color: ColorUtils.black,
                                  ),
                                ),
                                SizedBox(height: 2.h,),
                                SizedBox(
                                  height: 25.h,
                                  child: ListView.separated(
                                    physics: BouncingScrollPhysics(),
                                    separatorBuilder: (context, index) {
                                      return SizedBox(width: 0.w,);
                                    },
                                    shrinkWrap: true,
                                    itemCount: model.categoriesText.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: (){
                                          model.selectedCategoryIndex = index;
                                          model.notifyListeners();
                                        },
                                        child: Column(
                                          children: [
                                            SizedBox(height: 2.h,),
                                            Container(
                                              width: 25.w,
                                              height: 18.h,
                                              margin: EdgeInsets.only(left: 3.5.w),
                                              padding: EdgeInsets.only(top: 3.h),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                                  border: Border.all(color: model.selectedCategoryIndex == index ? ColorUtils.lightBlue : Colors.white),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey.withOpacity(0.5),
                                                      spreadRadius: 5,
                                                      blurRadius: 7,
                                                      offset: Offset(0, 3),
                                                    ),
                                                  ]
                                              ),
                                              //margin: EdgeInsets.symmetric(horizontal: 2.w),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset(model.categoriesImages[index],
                                                    height: 10.i,
                                                    width: 10.i,
                                                  ),
                                                  SizedBox(height: 2.h,),
                                                  Text(model.categoriesText[index],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily: FontUtils.poppinsRegular,
                                                        fontSize: 1.6.t,
                                                        color: ColorUtils.black
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },),
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Select Services",
                                      style: TextStyle(
                                        fontFamily: FontUtils.poppinsSemiBold,
                                        fontSize: Fontsizes.size14,
                                        color: ColorUtils.black,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 4.w),
                                      child: Text(
                                        "+ Add Service",
                                        style: TextStyle(
                                          fontFamily: FontUtils.poppinsMedium,
                                          fontSize: Fontsizes.size11,
                                          color: ColorUtils.blue3,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ListView.separated(
                            padding:
                            EdgeInsets.symmetric(horizontal: 3.w),
                            //padding: EdgeInsets.symmetric(horizontal: 4.w),
                            physics: BouncingScrollPhysics(),
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 0.h,
                              );
                            },
                            shrinkWrap: true,
                            itemCount: model.selectedCategoryIndex != 4 ? 4 : 1,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                },
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 0.4.h),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6)),
                                        color: ColorUtils.lightGreen2,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: ColorUtils.white,
                                            borderRadius: BorderRadius
                                                .all(Radius.circular(6)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0, 3),
                                              ),
                                            ]),
                                        //margin: EdgeInsets.symmetric(horizontal: 2.w),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3.w,
                                              vertical: 1.5.h),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Radio(value: "Passport Renewal",
                                                      groupValue: _character,
                                                      activeColor: ColorUtils.lightGreen2,
                                                      onChanged: (String? value){
                                                    setState(() {
                                                      _character = value!;
                                                    });
                                                  }),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Passport Renewal",
                                                        style: TextStyle(
                                                            fontFamily: FontUtils
                                                                .poppinsMedium,
                                                            fontSize:
                                                            Fontsizes.size14,
                                                            color:
                                                            ColorUtils.black),
                                                      ),
                                                      Text(
                                                        "AED 200",
                                                        style: TextStyle(
                                                            fontFamily: FontUtils
                                                                .poppinsSemiBold,
                                                            fontSize:
                                                            Fontsizes.size15,
                                                            color:
                                                            ColorUtils.lightGreen2),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: ColorUtils
                                                      .lightGreen2,
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(
                                                          7)),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets
                                                      .symmetric(
                                                      horizontal: 3.w,
                                                      vertical: 1.35.h),
                                                  child: SvgPicture.asset(ImageUtils.editIcon),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 5.h,),
                          HorizontalMargin(
                            widget: Column(
                              children: [
                                Text(
                                  "1 Service Selected",
                                  style: TextStyle(
                                    fontFamily: FontUtils.poppinsRegular,
                                    fontSize: Fontsizes.size14,
                                    color: ColorUtils.silver11,
                                  ),
                                ),
                                SizedBox(height: 1.h,),
                                CustomButtonOne(
                                  onButtonPressed: (){
                                  },
                                  textValue: "Done",
                                ),
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
