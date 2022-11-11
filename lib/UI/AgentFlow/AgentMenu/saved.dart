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
import 'package:mandobi_mobile_app/Widgets/top_margin.dart';
import 'package:stacked/stacked.dart';


class SavedBookmark extends StatefulWidget {
  const SavedBookmark({Key? key}) : super(key: key);

  @override
  State<SavedBookmark> createState() => _SavedBookmarkState();
}

class _SavedBookmarkState extends State<SavedBookmark> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserMainViewModel>.reactive(
      viewModelBuilder: () => locator<UserMainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {},
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child:   SafeArea(
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
                        AppBarTwoItems(text: " Saved",),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 2.h,),
                        ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          physics: BouncingScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 1.h,);
                          },
                          shrinkWrap: true,
                          itemCount:  model.popularAgentNames.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                                // Navigator.push(context,
                                //     PageTransition(type: PageTransitionType.fade, child: AboutAgent()));
                              },
                              child: Card(
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
                                          Icon(Icons.bookmark , color: ColorUtils.lightBlue,)
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
        );
      },
    );



  }
}
