import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/user_mainViewModel.dart';
import 'package:mandobi_mobile_app/Widgets/app_bar_two_items.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/receiveMsg.dart';
import 'package:mandobi_mobile_app/Widgets/sendMsg.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:stacked/stacked.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
                children: [
                  HorizontalMargin(
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: context.getPadding().top,
                        ),
                        TopMargin(),
                        AppBarTwoItems(
                          text: "Chat",
                        ),
                        SizedBox(height: 1.h,),
                        Row(
                          children: [
                            // InkWell(
                            //   onTap: (){
                            //     Navigator.of(context).pop();
                            //   },
                            //   child: Container(
                            //       decoration: BoxDecoration(
                            //         shape: BoxShape.circle,
                            //         color: ColorUtils.lightBlue.withOpacity(0.1),
                            //       ),
                            //       padding: EdgeInsets.all(16),
                            //       child: SvgPicture.asset(ImageUtils.blueArrow)
                            //   ),
                            // ),
                            // SizedBox(width: 2.w,),
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
                                    Text("Cris Miller",
                                      style: TextStyle(
                                          fontFamily: FontUtils.poppinsRegular,
                                          fontSize: Fontsizes.size15,
                                          color: ColorUtils.darkBlue
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(11),
                                        color: ColorUtils.lightGreen4
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 2.5.w,vertical: 0.25.h),
                                        child: Text("Online",
                                          style: TextStyle(
                                              fontFamily: FontUtils.poppinsRegular,
                                              fontSize: Fontsizes.size10,
                                              color: ColorUtils.white
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: HorizontalMargin(
                        widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(ImageUtils.horizontalLine),
                                SizedBox(width: 3.w,),
                                Text("Today",
                                  style: TextStyle(
                                      fontFamily: FontUtils.poppinsRegular,
                                      fontSize: Fontsizes.size12,
                                      color: ColorUtils.lightBlue7
                                  ),
                                ),
                                SizedBox(width: 3.w,),
                                SvgPicture.asset(ImageUtils.horizontalLine),
                              ],
                            ),
                            SizedBox(height: 20,),
                            SendMsg(context , "Sed id ne cogitari quidem potest quale sit, ut non repugnet ipsum sibi. Scientiam pollicentur."),
                            SizedBox(height: 20,),
                            ReceiveMsg(context , "Expectoque , quod quaerebam, respondeas Serpere anguiculos, nare anaticulas"),
                            SizedBox(height: 20,),
                            SendMsg(context , "Sed id ne cogitari quidem potest quale sit, ut non repugnet ipsum sibi. Scientiam pollicentur."),
                            SizedBox(height: 20,),
                            ReceiveMsg(context , "Expectoque , quod quaerebam, respondeas Serpere anguiculos, nare anaticulas"),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: HorizontalMargin(
                      widget: Container(
                        height: 70,
                        // padding: EdgeInsets.only(
                        //     left: 4.w,
                        //     right: 4.w,
                        //     top: 6.h
                        // ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                //width: 200.0,
                                margin: EdgeInsets.only(
                                  //left: SizeConfig.widthMultiplier * 4.5,
                                  right: 2.w,
                                  //top: SizeConfig.heightMultiplier * 3,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30.0),
                                    ),
                                    border: Border.all(color: ColorUtils.silver)
                                ),
                                child: Container(
                                  //color: Colors.amber,
                                  margin:
                                  EdgeInsets.symmetric(horizontal: 3.w,),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 1.w,),
                                      Expanded(
                                        child: Container(
                                          child: TextField(
                                            onTap: () {},
                                            enabled: true,
                                            //readOnly: true,
                                            //focusNode: model.searchFocus,
                                            decoration: InputDecoration(
                                              hintText: "Type here...",
                                              hintStyle: TextStyle(
                                                fontFamily: FontUtils.poppinsRegular,
                                                color: ColorUtils.black.withOpacity(0.5),
                                                fontSize: Fontsizes.size14,
                                              ),
                                              border: InputBorder.none,
                                              isDense: true,
                                              contentPadding: EdgeInsets.symmetric(
                                                  vertical: 2.h),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          //color: ColorUtils.text_red,
                                          borderRadius: BorderRadius.all(Radius.circular(15)),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(Icons.attach_file,
                                            color: ColorUtils.silver,
                                            ),
                                            SizedBox(width: 1.w,),
                                            GestureDetector(
                                              onTap: () async{},
                                              child: Container(
                                                //margin: EdgeInsets.only(bottom: 2.2.h),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: ColorUtils.lightBlue,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Icon(Icons.send,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              // Icon(
                                              //   Icons.arrow_forward_ios,
                                              // ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
