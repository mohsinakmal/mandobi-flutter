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
import 'package:mandobi_mobile_app/Widgets/horizontal_page_margin.dart';
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:stacked/stacked.dart';

class AboutAgent extends StatelessWidget {
  const AboutAgent({Key? key}) : super(key: key);

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
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ListTile(
                                        leading: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(color: ColorUtils.lightBlue.withOpacity(0.1)),
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
                                            Text(model.popularAgentNames[index],
                                              style: TextStyle(
                                                  fontFamily: FontUtils.poppinsRegular,
                                                  fontSize: Fontsizes.size15,
                                                  color: ColorUtils.black
                                              ),
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
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
                                                          color: ColorUtils.black
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Image.asset(ImageUtils.bookMark,
                                              width: 3.i,
                                              height: 3.i,
                                            ),
                                          ],
                                        ),
                                        subtitle: Row(
                                          children: [
                                            Text("Contractor - TAWJEEH",
                                              style: TextStyle(
                                                  fontFamily: FontUtils.poppinsSemiBold,
                                                  fontSize: Fontsizes.size9,
                                                  color: ColorUtils.black
                                              ),
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
                              );
                            },),
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
