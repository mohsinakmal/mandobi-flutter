import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/Agents/agents.dart';
import 'package:mandobi_mobile_app/UI/Home/about_agent.dart';
import 'package:mandobi_mobile_app/UI/Home/home_screen.dart';
import 'package:mandobi_mobile_app/UI/Home/tas_heel.dart';
import 'package:mandobi_mobile_app/UI/Menu/change_password.dart';
import 'package:mandobi_mobile_app/UI/Menu/dispute/disputes.dart';
import 'package:mandobi_mobile_app/UI/Menu/menu.dart';
import 'package:mandobi_mobile_app/UI/Menu/privacy_policy.dart';
import 'package:mandobi_mobile_app/UI/Menu/terms_of_use.dart';
import 'package:mandobi_mobile_app/UI/MyBooking/my_bookings.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
import 'package:mandobi_mobile_app/Utils/image_utils.dart';
import 'package:mandobi_mobile_app/ViewModels/user_registration_model.dart';
import 'package:stacked/stacked.dart';

class MyBottomNavBar extends StatefulWidget {

  int? index;

  MyBottomNavBar({this.index,Key? key}) : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {

  int currentIndex = 0;
  Widget body =  HomeScreen();

  @override
  void initState() {
    currentIndex = widget.index ?? 0;
    onClick(currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserRegistrationModel>.reactive(
        onModelReady: (model)async {
        },
        viewModelBuilder: () => locator<UserRegistrationModel>(),
        disposeViewModel: false,
        builder: (context, model, child){
          return Scaffold(
            body: Container(
              child: body,
            ),
            bottomNavigationBar:
            BottomNavigationBar(
              backgroundColor: ColorUtils.darkBlue,
              type: BottomNavigationBarType.fixed,
              items:  <BottomNavigationBarItem>[
                 BottomNavigationBarItem(
                   icon: SvgPicture.asset(ImageUtils.bottomHome,
                   color: currentIndex == 0 ? ColorUtils.lightBlue : ColorUtils.white,
                   ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(ImageUtils.bottomBooking,
                    color: currentIndex == 1 ? ColorUtils.lightBlue : ColorUtils.white,
                  ),
                  label: 'My Booking',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(ImageUtils.bottomAgent,
                    color: currentIndex == 2 ? ColorUtils.lightBlue : ColorUtils.white,
                  ),
                  label: 'Agents',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(ImageUtils.bottomMenu,
                    color: currentIndex == 3 ? ColorUtils.lightBlue : ColorUtils.white,
                  ),
                  label: 'Menu',
                ),
              ],
              currentIndex: currentIndex,
              //fixedColor: ColorUtils.orangeColor,
              selectedItemColor: ColorUtils.lightBlue,
              unselectedItemColor: ColorUtils.white,
              //unselectedItemColor: ColorUtils.fieldIconColor,
              unselectedLabelStyle: TextStyle(
                color: ColorUtils.white,
              ),
              //backgroundColor: Colors.green,
              onTap: (index) {
                currentIndex = index;
                //MainView(index: 3,);
                onClick(currentIndex);
                setState(() {});
              },
            ),
          );
        }
    );
  }
  onClick(int selectedIndex){
    setState(() {
      var model = locator<UserRegistrationModel>();
      currentIndex = selectedIndex;
      switch(currentIndex){
        case 0:
          body =  HomeScreen();
          break;
        case 1:
          body = MyBookings();
          break;
        case 2:
          body =  Agents();
          break;
        case 3:
          body =  Menu();
          break;
      }
    });
  }
}
