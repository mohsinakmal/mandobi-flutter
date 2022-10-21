import 'package:flutter/material.dart';
import 'package:mandobi_mobile_app/App/locator.dart';
import 'package:mandobi_mobile_app/UI/Agents/agents.dart';
import 'package:mandobi_mobile_app/UI/Home/agent.dart';
import 'package:mandobi_mobile_app/UI/Home/home_screen.dart';
import 'package:mandobi_mobile_app/UI/Home/tas_heel.dart';
import 'package:mandobi_mobile_app/UI/Menu/change_password.dart';
import 'package:mandobi_mobile_app/UI/Menu/menu.dart';
import 'package:mandobi_mobile_app/UI/Menu/privacy_policy.dart';
import 'package:mandobi_mobile_app/UI/Menu/terms_of_use.dart';
import 'package:mandobi_mobile_app/UI/MyBooking/my_bookings.dart';
import 'package:mandobi_mobile_app/Utils/color_utils.dart';
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
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    size: 30,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 30,
                    height: 30,
                    child: Icon(
                        Icons.calendar_today,
                    ),
                  ),
                  label: 'My Booking',
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 30,
                    height: 30,
                    child: Icon(
                        Icons.people_outline
                    ),
                  ),
                  label: 'Agents',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    width: 30,
                    height: 30,
                    child: Icon(
                        Icons.menu
                    ),
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
          body =  AboutAgent();
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
