import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentMenu/bank_details.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentMenu/membership/membership_plans.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentMenu/services/services.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentProfile/agent_my_profile.dart';
import 'package:mandobi_mobile_app/UI/UserFlow/Menu/change_password.dart';
import 'package:mandobi_mobile_app/UI/UserFlow/Menu/dispute/disputes.dart';
import 'package:mandobi_mobile_app/UI/UserFlow/Menu/privacy_policy.dart';
import 'package:mandobi_mobile_app/UI/UserFlow/Menu/terms_of_use.dart';
import 'package:mandobi_mobile_app/UI/UserFlow/Profile/my_profile.dart';
import 'package:mandobi_mobile_app/UI/UserFlow/Register/login.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/user_mainViewModel.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class AgentMenu extends StatelessWidget {
  const AgentMenu({Key? key}) : super(key: key);

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
              body: SingleChildScrollView(
                child: Column(
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
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,
                                        PageTransition(type: PageTransitionType.fade, child:  AgentMyProfile()));
                                  },
                                  child: Row(
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
                                            "Ahmed Saud",
                                            style: TextStyle(
                                                fontFamily:
                                                    FontUtils.poppinsMedium,
                                                fontSize: 2.t,
                                                color: ColorUtils.black),
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  ImageUtils.locationPin),
                                              SizedBox(
                                                width: 1.w,
                                              ),
                                              Text(
                                                "Emara DB 1254 north area",
                                                style: TextStyle(
                                                    fontFamily:
                                                        FontUtils.poppinsRegular,
                                                    fontSize: 1.6.t,
                                                    color: ColorUtils.grey1),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            SizedBox(height: 4.h,),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Column(
                                children: [
                                  // InkWell(
                                  //   onTap: (){
                                  //     Navigator.push(context,
                                  //         PageTransition(type: PageTransitionType.fade, child:  SavedBookmark()));
                                  //   },
                                  //   child: Row(
                                  //     children: [
                                  //       Icon(Icons.bookmark_border,
                                  //       color: ColorUtils.lightBlue,
                                  //       ),
                                  //       SizedBox(width: 3.w,),
                                  //       Text("Saved",
                                  //         style: TextStyle(
                                  //             fontFamily: FontUtils.poppinsRegular,
                                  //             fontSize: Fontsizes.size16,
                                  //             color: ColorUtils.black
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  // SizedBox(height: 4.h,),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context,
                                          PageTransition(type: PageTransitionType.fade, child:  ChangePassword()));
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.lock_open_outlined,
                                          color: ColorUtils.lightBlue,
                                        ),
                                        SizedBox(width: 3.w,),
                                        Text("Change Password",
                                          style: TextStyle(
                                              fontFamily: FontUtils.poppinsRegular,
                                              fontSize: Fontsizes.size16,
                                              color: ColorUtils.black
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 4.h,),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context,
                                          PageTransition(type: PageTransitionType.fade, child:  Bank_Details()));
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.account_balance,
                                          color: ColorUtils.lightBlue,
                                        ),
                                        SizedBox(width: 3.w,),
                                        Text("Bank Details",
                                          style: TextStyle(
                                              fontFamily: FontUtils.poppinsRegular,
                                              fontSize: Fontsizes.size16,
                                              color: ColorUtils.black
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 4.h,),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context,
                                          PageTransition(type: PageTransitionType.fade, child:  Membership_Plans()));
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.workspace_premium,
                                          color: ColorUtils.lightBlue,
                                        ),
                                        SizedBox(width: 3.w,),
                                        Text("Membership Plans",
                                          style: TextStyle(
                                              fontFamily: FontUtils.poppinsRegular,
                                              fontSize: Fontsizes.size16,
                                              color: ColorUtils.black
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 4.h,),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context,
                                          PageTransition(type: PageTransitionType.fade, child:  Disputes()));
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.chat_outlined,
                                        color: ColorUtils.lightBlue,
                                        ),
                                        SizedBox(width: 3.w,),
                                        Text("Dispute",
                                          style: TextStyle(
                                              fontFamily: FontUtils.poppinsRegular,
                                              fontSize: Fontsizes.size16,
                                              color: ColorUtils.black
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 4.h,),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context,
                                          PageTransition(type: PageTransitionType.fade, child:  Agent_Services()));
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.payments_outlined,
                                          color: ColorUtils.lightBlue,
                                        ),
                                        SizedBox(width: 3.w,),
                                        Text("Services",
                                          style: TextStyle(
                                              fontFamily: FontUtils.poppinsRegular,
                                              fontSize: Fontsizes.size16,
                                              color: ColorUtils.black
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 4.h,),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context,
                                          PageTransition(type: PageTransitionType.fade, child:  TermsOfUse()));
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.note_alt_outlined,
                                          color: ColorUtils.lightBlue,
                                        ),
                                        SizedBox(width: 3.w,),
                                        Text("Terms & Conditions",
                                          style: TextStyle(
                                              fontFamily: FontUtils.poppinsRegular,
                                              fontSize: Fontsizes.size16,
                                              color: ColorUtils.black
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 4.h,),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context,
                                          PageTransition(type: PageTransitionType.fade, child:  PrivacyPolicy()));
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.privacy_tip_outlined,
                                          color: ColorUtils.lightBlue,
                                        ),
                                        SizedBox(width: 3.w,),
                                        Text("Privacy Policy",
                                          style: TextStyle(
                                              fontFamily: FontUtils.poppinsRegular,
                                              fontSize: Fontsizes.size16,
                                              color: ColorUtils.black
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 4.h,),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context,
                                          PageTransition(type: PageTransitionType.fade, child:  LoginScreen()));
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.logout,
                                          color: ColorUtils.lightBlue,
                                        ),
                                        SizedBox(width: 3.w,),
                                        Text("Logout",
                                          style: TextStyle(
                                              fontFamily: FontUtils.poppinsRegular,
                                              fontSize: Fontsizes.size16,
                                              color: ColorUtils.black
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
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
