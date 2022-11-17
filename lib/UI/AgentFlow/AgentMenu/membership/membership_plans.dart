import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentMenu/payment/card_details.dart';
import 'package:mandobi_mobile_app/UI/UserFlow/Menu/payment/card_details.dart';
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

class Membership_Plans extends StatefulWidget {
  const Membership_Plans({Key? key}) : super(key: key);

  @override
  State<Membership_Plans> createState() => _Membership_PlansState();
}

class _Membership_PlansState extends State<Membership_Plans> {
  bool packages = true;
  bool history = false;
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 10.w,
                                child: Icon(Icons.arrow_back),
                              ),
                            ),
                            Text(
                              "Choose Your Plan",
                              style: TextStyle(
                                  fontFamily: FontUtils.poppinsRegular,
                                  fontSize: 2.t,
                                  color: ColorUtils.darkBlue),
                            ),
                            Text(" "),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2.h,),
                          HorizontalMargin(
                            widget: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(25.0)),
                                  border: Border.all(
                                      color: ColorUtils.lightBlue)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25.0)),
                                      ),
                                      child: AnimatedContainer(
                                        duration:
                                        Duration(milliseconds: 400),
                                        height: 6.5.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(25),
                                          color: packages == true
                                              ? ColorUtils.lightBlue
                                              : Colors.white,
                                          //border: Border.all(color: ColorUtils.lightBlue),
                                        ),
                                        child: MaterialButton(
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  25)),
                                          onPressed: () {
                                            setState(() {
                                              packages = true;
                                              history = false;
                                            });
                                          },
                                          child: Text(
                                            "Packages",
                                            style: TextStyle(
                                                fontFamily: FontUtils
                                                    .poppinsRegular,
                                                fontSize: Fontsizes.size14,
                                                color:
                                                packages == true
                                                    ? Colors.white
                                                    : Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25.0)),
                                      ),
                                      child: AnimatedContainer(
                                        duration: const Duration(
                                            milliseconds: 400),
                                        height: 6.5.h,
                                        //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(25),
                                          color: history == true
                                              ? ColorUtils.lightBlue
                                              : Colors.white,
                                        ),
                                        child: MaterialButton(
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  25)),
                                          onPressed: () {
                                            setState(() {
                                              history = true;
                                              packages = false;
                                            });
                                          },
                                          child: Text(
                                            "History",
                                            style: TextStyle(
                                                fontFamily: FontUtils
                                                    .poppinsRegular,
                                                fontSize:
                                                Fontsizes.size15,
                                                color: history ==
                                                    true
                                                    ? Colors.white
                                                    : Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if ( packages == true)
                            Column(
                              children: [
                                SizedBox(
                                  height: 3.h,
                                ),
                                HorizontalMargin(
                                  widget: Row(
                                    children: [
                                      Container(
                                        height:15.h,
                                        width: 40.w,

                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3), // changes position of shadow
                                            ),
                                          ]
                                        ),
                                        child: HorizontalMargin(
                                          widget: Column(
                                              children: [
                                                Row(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 15.0 , right: 10),
                                                        child: Container(
                                                          height: 3.h ,
                                                          width: 8.w,

                                                            decoration: BoxDecoration(
                                                                color: ColorUtils.lightBlue2,
                                                              borderRadius: BorderRadius.circular(2)
                                                            ),
                                                            child: Icon(Icons.person_outline , color: ColorUtils.lightBlue1,)
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 15.0),
                                                        child: Text("Standard"),
                                                      )
                                                    ],
                                                  ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Text("AED"  ,style: TextStyle(
                                                        fontFamily: FontUtils.poppinsRegular,
                                                        fontSize: Fontsizes.size10,
                                                        color: ColorUtils.silver1
                                                    ),),
                                                    Text("1500",style: TextStyle(
                                                        fontFamily: FontUtils.poppinsRegular,
                                                        fontSize: Fontsizes.size20,
                                                        color: ColorUtils.black,
                                                      fontWeight: FontWeight.bold
                                                    ),),
                                                    Text("  /yeas" , style: TextStyle(
                                                        fontFamily: FontUtils.poppinsRegular,
                                                        fontSize: Fontsizes.size10,
                                                        color: ColorUtils.silver1
                                                    ),)
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 0.2.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Text("(150.00/  Month)"  ,style: TextStyle(
                                                        fontFamily: FontUtils.poppinsRegular,
                                                        fontSize: Fontsizes.size10,
                                                        color: ColorUtils.silver1
                                                    ),),
                                                  ],
                                                ),

                                              ],
                                            ),
                                        ),

                                      ),
                                      SizedBox(width: 6.w,),
                                      Container(
                                        height:15.h,
                                        width: 40.w,

                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3), // changes position of shadow
                                            ),
                                          ]
                                        ),
                                        child: HorizontalMargin(
                                          widget: Column(
                                              children: [
                                                Row(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 15.0 , right: 10),
                                                        child: Container(
                                                          height: 3.h ,
                                                          width: 8.w,

                                                            decoration: BoxDecoration(
                                                                color: ColorUtils.lightBlue1,
                                                              borderRadius: BorderRadius.circular(2)
                                                            ),
                                                            child: Icon(Icons.star_border_outlined , color: Colors.yellow,)
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 15.0),
                                                        child: Text("Go Pro"),
                                                      )
                                                    ],
                                                  ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Text("AED"  ,style: TextStyle(
                                                        fontFamily: FontUtils.poppinsRegular,
                                                        fontSize: Fontsizes.size10,
                                                        color: ColorUtils.silver1
                                                    ),),
                                                    Text("3500",style: TextStyle(
                                                        fontFamily: FontUtils.poppinsRegular,
                                                        fontSize: Fontsizes.size20,
                                                        color: ColorUtils.black,
                                                      fontWeight: FontWeight.bold
                                                    ),),
                                                    Text("  /yeas" , style: TextStyle(
                                                        fontFamily: FontUtils.poppinsRegular,
                                                        fontSize: Fontsizes.size10,
                                                        color: ColorUtils.silver1
                                                    ),)
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 0.2.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Text("(150.00/  Month)"  ,style: TextStyle(
                                                        fontFamily: FontUtils.poppinsRegular,
                                                        fontSize: Fontsizes.size10,
                                                        color: ColorUtils.silver1
                                                    ),),
                                                  ],
                                                ),
                                                Container(
                                                  child: Text("valid till 23/03/2023",style: TextStyle(
                                                      fontFamily: FontUtils.poppinsRegular,
                                                      fontSize: Fontsizes.size10,
                                                      color: ColorUtils.silver1
                                                  ),),
                                                )

                                              ],
                                            ),
                                        ),

                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                HorizontalMargin(
                                  widget: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Features",
                                        style: TextStyle(
                                            fontFamily: FontUtils.poppinsSemiBold,
                                            fontSize: 1.7.t,
                                            color: ColorUtils.black
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          // Navigator.push(context,
                                          //     PageTransition(type: PageTransitionType.fade, child: Add_services()));
                                        },
                                        child: Container(
                                          width: 30.w,
                                          height: 3.h,
                                          child: Center(
                                            child: Text("GO PRO",
                                              style: TextStyle(
                                                  fontFamily: FontUtils.poppinsSemiBold,
                                                  fontSize: 1.5.t,
                                                  color: ColorUtils.black
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                HorizontalMargin(
                                  widget: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("1 Month Free",
                                        style: TextStyle(
                                            fontFamily: FontUtils.poppinsRegular,
                                            fontSize: 1.7.t,
                                            color: ColorUtils.black
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          // Navigator.push(context,
                                          //     PageTransition(type: PageTransitionType.fade, child: Add_services()));
                                        },
                                        child: Container(
                                          width: 30.w,
                                          height: 3.h,
                                          child: Center(
                                            child: Icon(Icons.done , color: ColorUtils.lightGreen1,)
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                HorizontalMargin(
                                  widget: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("No Service Limit",
                                        style: TextStyle(
                                            fontFamily: FontUtils.poppinsRegular,
                                            fontSize: 1.7.t,
                                            color: ColorUtils.black
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          // Navigator.push(context,
                                          //     PageTransition(type: PageTransitionType.fade, child: Add_services()));
                                        },
                                        child: Container(
                                          width: 30.w,
                                          height: 3.h,
                                          child: Center(
                                              child: Icon(Icons.done , color: ColorUtils.lightGreen1,)
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                HorizontalMargin(
                                  widget: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Featured Agent",
                                        style: TextStyle(
                                            fontFamily: FontUtils.poppinsRegular,
                                            fontSize: 1.7.t,
                                            color: ColorUtils.black
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          // Navigator.push(context,
                                          //     PageTransition(type: PageTransitionType.fade, child: Add_services()));
                                        },
                                        child: Container(
                                          width: 30.w,
                                          height: 3.h,
                                          child: Center(
                                              child: Icon(Icons.done , color: ColorUtils.lightGreen1,)
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: 30.h,
                                ),

                                HorizontalMargin(
                                  widget: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap:(){
                                          Navigator.push(context,
                                              PageTransition(type: PageTransitionType.fade, child:  AgentCardDetails()));
                                        },
                                        child: Container(
                                          height: 6.h,
                                          width: 40.w,
                                          decoration: BoxDecoration(
                                            color: ColorUtils.lightBlue.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(30)
                                          ),
                                          child:Center(child: Text("Monthly" , style: TextStyle(color: ColorUtils.lightBlue),)),
                                        ),
                                      ),
                                      InkWell(
                                        onTap:(){
                                          Navigator.push(context,
                                              PageTransition(type: PageTransitionType.fade, child:  AgentCardDetails()));
                                        },
                                        child: Container(
                                          height: 6.h,
                                          width: 40.w,
                                          decoration: BoxDecoration(
                                            color: ColorUtils.lightBlue.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(30)
                                          ),
                                          child:Center(child: Text("Yearly" , style: TextStyle(color: ColorUtils.lightBlue),)),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          if (history == true)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 2.h,
                                ),
                                ListView.separated(
                                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                                  physics: BouncingScrollPhysics(),
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: 1.h,);
                                  },
                                  shrinkWrap: true,
                                  itemCount: model.popularAgentNames.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: (){
                                      },
                                      child: Container(

                                        decoration: BoxDecoration(
                                            color: ColorUtils.silver,
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            ListTile(
                                              title: Row(
                                                children: [
                                                  Container(
                                                    width: 49.i ,
                                                    child: Text("Standard Yearly",
                                                      style: TextStyle(
                                                          fontFamily: FontUtils.poppinsSemiBold,
                                                          fontSize: Fontsizes.size15,
                                                          color: ColorUtils.black
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Center(
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Text("AED",
                                                            style: TextStyle(
                                                                fontFamily: FontUtils.poppinsRegular,
                                                                fontSize: Fontsizes.size10,
                                                                color: ColorUtils.grey
                                                            ),
                                                          ),
                                                          Text("1500",
                                                            style: TextStyle(
                                                                fontFamily: FontUtils.poppinsSemiBold,
                                                                fontSize: Fontsizes.size12,
                                                                color: ColorUtils.black
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  Container(
                                                    width: 50.i,
                                                    child: Text("valid till 23/03/2023",style: TextStyle(
                                                        fontFamily: FontUtils.poppinsRegular,
                                                        fontSize: Fontsizes.size10,
                                                        color: ColorUtils.silver1
                                                    ),),
                                                  ),
                                                  Expanded(
                                                    child: Center(
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          SvgPicture.asset(ImageUtils.clockIcon,
                                                            width: 3.i,
                                                            height: 3.i,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          SizedBox(width: 1.5.w,),
                                                          Text("9AM to 5PM",
                                                            style: TextStyle(
                                                                fontFamily: FontUtils.poppinsRegular,
                                                                fontSize: Fontsizes.size10,
                                                                color: ColorUtils.black
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },),
                                SizedBox(
                                  height: 2.h,
                                ),
                              ],
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
