import 'package:flutter/material.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/user_registration_model.dart';
import 'package:mandobi_mobile_app/Widgets/app_bar_two_items.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_one.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class Bank_Details extends StatefulWidget {
  const Bank_Details({Key? key}) : super(key: key);

  @override
  State<Bank_Details> createState() => _Bank_DetailsState();
}

class _Bank_DetailsState extends State<Bank_Details> {
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
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.white,
              body: Container(
                child: Column(
                  children: [
                    HorizontalMargin(
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: context.getPadding().top,
                              ),
                              TopMargin(),
                              AppBarTwoItems(text: "Enter Bank Details",),
                              SizedBox(
                                height: 3.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: TextFormField(
                                  //controller: model.createNewPasswordController,
                                  style: const TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.h),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: ColorUtils.black.withOpacity(0.5), width: 1),
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                    focusedBorder:  OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      borderSide: BorderSide(color: ColorUtils.lightBlue, width: 1.5),
                                    ),
                                    hintText: "00639363963037",
                                    labelText: "Account Number",
                                    hintStyle:  TextStyle(color: ColorUtils.black.withOpacity(0.5)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.5.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: TextFormField(
                                  //controller: model.createNewConfirmPasswordController,
                                  style: const TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.h),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: ColorUtils.black.withOpacity(0.5), width: 1),
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                    focusedBorder:  OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      borderSide: BorderSide(color: ColorUtils.lightBlue, width: 1.5),
                                    ),
                                    hintText: "8978 8987 8979 8798 ",
                                    labelText: "Routing Number",
                                    hintStyle:  TextStyle(color: ColorUtils.black.withOpacity(0.5)),

                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0 , left: 10 ,bottom: 20),
                                child: Text(
                                  "Upload Documents(If any)",
                                  style: TextStyle(
                                      fontFamily: FontUtils.poppinsRegular,
                                      fontSize: 1.5.t,
                                      color: ColorUtils.darkBlue,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
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
                              SizedBox(
                                height: 3.5.h,
                              ),
                              CustomButtonOne(
                                onButtonPressed: () {
                                  // Navigator.push(
                                  //     context,
                                  //     PageTransition(
                                  //         type: PageTransitionType.fade,
                                  //         child: OnBoardingTwo()));
                                },
                                textValue: "Save",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
