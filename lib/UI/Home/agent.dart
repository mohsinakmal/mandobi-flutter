import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/user_mainViewModel.dart';
import 'package:mandobi_mobile_app/Widgets/back_arrow.dart';
import 'package:mandobi_mobile_app/Widgets/book_mark_circle.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_one.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:stacked/stacked.dart';

class AboutAgent extends StatefulWidget {
  const AboutAgent({Key? key}) : super(key: key);

  @override
  State<AboutAgent> createState() => _AboutAgentState();
}

class _AboutAgentState extends State<AboutAgent> with SingleTickerProviderStateMixin {

  /*bool servicesSelected = true;
  bool ratingSelectd = false;*/

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];

  int _activeIndex = 0;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: myTabs.length,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _tabController!.addListener(() {
      if (_tabController!.indexIsChanging) {
        setState(() {
          _activeIndex = _tabController!.index;
        });
      }
    });
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
                  children: [
                    HorizontalMargin(
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: context.getPadding().top,
                          ),
                          TopMargin(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BackArrow(),
                              Text("Agent",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: FontUtils.poppinsRegular,
                                    fontSize: 2.t,
                                    color: ColorUtils.darkBlue
                                ),
                              ),
                              BookMarkCircle()
                            ],
                          ),
                          SizedBox(height: 2.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                                          SvgPicture.asset(ImageUtils.plainSearchIcon),
                                          SizedBox(width: 1.w,),
                                          Text("Emara DB 1254 north area",
                                            style: TextStyle(
                                                fontFamily: FontUtils.poppinsRegular,
                                                fontSize: 1.6.t,
                                                color: ColorUtils.grey1
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 0.5.h,),
                                      Row(
                                        children: [
                                          SvgPicture.asset(ImageUtils.plainEmailIcon),
                                          SizedBox(width: 1.w,),
                                          Text("syedaliraza@email.com",
                                            style: TextStyle(
                                                fontFamily: FontUtils.poppinsRegular,
                                                fontSize: 1.6.t,
                                                color: ColorUtils.grey1
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 3.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(ImageUtils.bluePhoneIcon),
                                  SizedBox(width: 3.w,),
                                  Text("+9 123 123 1234",
                                    style: TextStyle(
                                        fontFamily: FontUtils.poppinsRegular,
                                        fontSize: Fontsizes.size14,
                                        color: ColorUtils.black
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(ImageUtils.clockIcon,
                                  width: 5.i,
                                    height: 5.i,
                                  ),
                                  SizedBox(width: 3.w,),
                                  Text("9AM to 5PM",
                                    style: TextStyle(
                                        fontFamily: FontUtils.poppinsRegular,
                                        fontSize: Fontsizes.size14,
                                        color: ColorUtils.black
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h,),
                          Text("Exprience",
                            style: TextStyle(
                                fontFamily: FontUtils.poppinsSemiBold,
                                fontSize: Fontsizes.size13,
                                color: ColorUtils.black
                            ),
                          ),
                          SizedBox(height: 3.h,),
                          ListView.separated(
                            padding: EdgeInsets.zero,
                            //padding: EdgeInsets.symmetric(horizontal: 4.w),
                            physics: BouncingScrollPhysics(),
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 1.h,);
                            },
                            shrinkWrap: true,
                            itemCount: model.agentPlace.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                },
                                child: Column(
                                  children: [
                                    SizedBox(height: 2.h,),
                                    Stack(
                                      //alignment: Alignment.bottomCenter,
                                      children: [
                                        Container(
                                          //padding: EdgeInsets.only(bottom: 9.5.h),
                                          height: MediaQuery.of(context).size.height * 0.135,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(6)),
                                            color: ColorUtils.lightBlue,
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: ColorUtils.white,
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
                                            /*boxShadow: [
                                              BoxShadow(blurRadius: 8.0),
                                              BoxShadow(spreadRadius: 5),
                                              BoxShadow(color: Colors.black, offset: Offset(0, -16)),
                                              BoxShadow(color: Colors.black, offset: Offset(0, 16)),
                                              BoxShadow(color: Colors.black, offset: Offset(-16, -16)),
                                              BoxShadow(color: Colors.black, offset: Offset(-16, 16)),
                                            ],*/
                                          ),
                                          //margin: EdgeInsets.symmetric(horizontal: 2.w),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 3.h),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.rectangle,
                                                        borderRadius: BorderRadius.circular(5),
                                                        color: ColorUtils.lightBlue.withOpacity(0.1),
                                                      ),
                                                      child: Padding(
                                                        padding:EdgeInsets.symmetric(horizontal: 4.5.w, vertical: 2.h),
                                                        child: SvgPicture.asset(ImageUtils.blueBriefCase),
                                                      ),
                                                    ),
                                                    SizedBox(width: 3.w,),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(model.agentPlace[index],
                                                          style: TextStyle(
                                                              fontFamily: FontUtils.poppinsSemiBold,
                                                              fontSize: Fontsizes.size13,
                                                              color: ColorUtils.black
                                                          ),
                                                        ),
                                                        SizedBox(height: 0.25.h,),
                                                        Text("Contractor",
                                                          style: TextStyle(
                                                              fontFamily: FontUtils.poppinsRegular,
                                                              fontSize: Fontsizes.size12,
                                                              color: ColorUtils.blue4
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Expanded(child:
                                                    Align(
                                                      alignment: Alignment.centerRight,
                                                      child: Text('2020-2021',
                                                        style: TextStyle(
                                                            fontFamily: FontUtils.poppinsSemiBold,
                                                            fontSize: Fontsizes.size13,
                                                            color: ColorUtils.black
                                                        ),
                                                      ),
                                                    ),)
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },),
                          SizedBox(height: 5.h,),
                          DefaultTabController(
                            initialIndex: 1,
                            length: 2,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: ColorUtils.lightBlue,),
                                  ),
                                  child: TabBar(
                                    indicatorPadding: EdgeInsets.zero,
                                    labelColor: Colors.transparent,
                                    controller: _tabController,
                                    labelPadding: EdgeInsets.zero,
                                    indicatorColor: Colors.transparent,
                                    tabs: [
                                      Tab(
                                        child:  Container(
                                          margin: EdgeInsets.only(left: 0.1.w, top: 0.2.h),
                                          decoration: BoxDecoration(
                                            borderRadius: _activeIndex == 0 ? BorderRadius.circular(25) : BorderRadius.circular(0),
                                            color: _activeIndex == 0
                                                ? Colors.lightBlue
                                                : Colors.transparent,
                                          ),
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: Center(
                                            child: Text(
                                              "Services",
                                              style: TextStyle(
                                                fontFamily: FontUtils.poppinsRegular,
                                                fontSize: Fontsizes.size14,
                                                color: _activeIndex == 0
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 0.1.w, top: 0.2.h),
                                          decoration: BoxDecoration(
                                            borderRadius: _activeIndex == 1 ? BorderRadius.circular(25) : BorderRadius.circular(0),
                                            color: _activeIndex == 1
                                                ? Colors.lightBlue
                                                : Colors.transparent,
                                          ),
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("Ratings",
                                                style: TextStyle(
                                                  fontFamily: FontUtils.poppinsRegular,
                                                  fontSize: Fontsizes.size15,
                                                  color: _activeIndex == 1
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                              ),
                                              SizedBox(width: 3.w,),
                                              SvgPicture.asset(ImageUtils.ratingStar,
                                                width: 3.i,
                                                height: 3.i,
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(width: 1.5.w,),
                                              Text("5.5",
                                                style: TextStyle(
                                                  fontFamily: FontUtils.poppinsRegular,
                                                  fontSize: Fontsizes.size10,
                                                  color: _activeIndex == 1
                                                      ? Colors.white
                                                      : Colors.black,
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
                        ],
                      ),
                    ),
                    Builder(builder: (_) {
                      if (_activeIndex == 0) {
                        return Column(
                          children: [
                            ListView.separated(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              //padding: EdgeInsets.symmetric(horizontal: 4.w),
                              physics: BouncingScrollPhysics(),
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 1.h,);
                              },
                              shrinkWrap: true,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: (){
                                  },
                                  child: Column(
                                    children: [
                                      SizedBox(height: 2.h,),
                                      Stack(
                                        //alignment: Alignment.bottomCenter,
                                        children: [
                                          Container(
                                            //padding: EdgeInsets.only(bottom: 9.5.h),
                                            height: MediaQuery.of(context).size.height * 0.098,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(6)),
                                              color: ColorUtils.lightBlue,
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: ColorUtils.white,
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
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 3.h),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("Passport Renewal",
                                                    style: TextStyle(
                                                        fontFamily: FontUtils.poppinsRegular,
                                                        fontSize: Fontsizes.size15,
                                                        color: ColorUtils.black
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: ColorUtils.lightGreen2,
                                                        borderRadius: BorderRadius.all(Radius.circular(7)),
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                                                      child: Text("AED 200",
                                                        style: TextStyle(
                                                            fontFamily: FontUtils.poppinsRegular,
                                                            fontSize: Fontsizes.size12,
                                                            color: ColorUtils.white
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },),
                            SizedBox(height: 2.h,),
                          ],
                        );//1st custom tabBarView
                      } else {
                        return Column(
                          children: [
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
                                  child: Column(
                                    children: [
                                      SizedBox(height: 2.h,),
                                      Card(
                                        elevation: 5,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            ListTile(
                                              leading: Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(color: ColorUtils.lightBlue)
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(3.0),
                                                  child: Image.asset(
                                                    ImageUtils.userPic,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              title: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("Anonymous",
                                                    style: TextStyle(
                                                        fontFamily: FontUtils.poppinsRegular,
                                                        fontSize: Fontsizes.size13,
                                                        color: ColorUtils.black
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment: Alignment.centerRight,
                                                      child: Image.asset(ImageUtils.ratingsGroup,
                                                        width: 20.i,
                                                        height: 20.i,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              subtitle: Text("5 of 5",
                                                style: TextStyle(
                                                    fontFamily: FontUtils.poppinsRegular,
                                                    fontSize: Fontsizes.size11,
                                                    color: ColorUtils.black.withOpacity(0.4),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left:6.w, bottom: 3.h),
                                              child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                                style: TextStyle(
                                                    fontFamily: FontUtils.poppinsRegular,
                                                    fontSize: Fontsizes.size10,
                                                    color: ColorUtils.silver1
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },),
                            SizedBox(height: 2.h,),
                          ],
                        );//2nd tabView
                      }
                    }),
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
