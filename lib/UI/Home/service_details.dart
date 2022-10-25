import 'package:flutter/material.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/Home/passport_Renewal.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/extensions.dart';
import 'package:mandobi_mobile_app/Utils/font_sizes.dart';
import 'package:mandobi_mobile_app/Utils/font_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/user_mainViewModel.dart';
import 'package:mandobi_mobile_app/Widgets/app_bar_two_items.dart';
import 'package:mandobi_mobile_app/Widgets/custom_button_one.dart';
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({Key? key}) : super(key: key);

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
                        AppBarTwoItems(
                          text: "Service Details Page",
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 3.h,),
                          Image.asset(ImageUtils.passportService),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 1.5.h,),
                                Text(
                                  "Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum is simply dummy",
                                  style: TextStyle(
                                    height: 0.2.h,
                                      fontFamily: FontUtils.poppinsRegular,
                                      fontSize: Fontsizes.size10,
                                      color: ColorUtils.silver1),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  "Payment By Milestone",
                                  style: TextStyle(
                                    fontFamily: FontUtils.poppinsSemiBold,
                                    fontSize: Fontsizes.size13,
                                    color: ColorUtils.black,
                                  ),
                                ),
                                SizedBox(height: 2.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      ImageUtils.circle1,
                                      width: 22.5.i,
                                      height: 22.5.i,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.asset(ImageUtils.circleGrey2,
                                      width: 22.5.i,
                                      height: 22.5.i,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.asset(ImageUtils.circleGrey3,
                                      width: 22.5.i,
                                      height: 22.5.i,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  "Documents Required:",
                                  style: TextStyle(
                                    fontFamily: FontUtils.poppinsSemiBold,
                                    fontSize: Fontsizes.size13,
                                    color: ColorUtils.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 18.h,
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              physics: BouncingScrollPhysics(),
                              separatorBuilder: (context, index) {
                                return SizedBox(width: 0.w,);
                              },
                              shrinkWrap: true,
                              itemCount: model.documentImages.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: (){
                                  },
                                  child: Column(
                                    children: [
                                      SizedBox(height: 2.h,),
                                      Container(
                                        margin: EdgeInsets.only(left: 3.5.w),
                                        decoration: BoxDecoration(
                                          color: ColorUtils.white,
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                          border: Border.all(
                                            width: 1.5,
                                            color: ColorUtils.silver5,
                                            //color: model.selectedPopularServiceIndex == index ? ColorUtils.lightGreen : Colors.primaries[Random().nextInt(Colors.primaries.length)]
                                          ),
                                        ),
                                        //margin: EdgeInsets.symmetric(horizontal: 2.w),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                                          child: Image.asset(model.documentImages[index],
                                            width: 12.i,
                                            height: 12.i,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 3.h,),
                                      Text(
                                        model.documentNames[index],
                                        style: TextStyle(
                                          fontFamily: FontUtils.poppinsRegular,
                                          fontSize: Fontsizes.size10,
                                          color: ColorUtils.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },),
                          ),
                          SizedBox(height: 3.h,),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            child: CustomButtonOne(
                              onButtonPressed: (){
                                Navigator.push(context,
                                    PageTransition(type: PageTransitionType.fade, child:  PassportRenewal(screenTitle: "Service Details",)));
                              },
                              textValue: "Book Now",
                            ),
                          ),
                          SizedBox(height: 3.h,),
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
