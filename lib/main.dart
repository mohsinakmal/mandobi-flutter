import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mandobi_mobile_app/UI/Home/home_screen.dart';
import 'package:mandobi_mobile_app/UI/OnBoarding/onBoarding_one.dart';
import 'package:mandobi_mobile_app/UI/OnBoarding/onBoarding_two.dart';
import 'package:mandobi_mobile_app/UI/Profile/edit_profile.dart';
import 'package:mandobi_mobile_app/UI/Profile/my_profile.dart';
import 'package:mandobi_mobile_app/UI/Register/create_new_password.dart';
import 'package:mandobi_mobile_app/UI/Register/forgot_password.dart';
import 'package:mandobi_mobile_app/UI/Register/forgot_password_otp.dart';
import 'package:mandobi_mobile_app/UI/Register/login.dart';
import 'package:mandobi_mobile_app/UI/Register/register_account.dart';
import 'package:mandobi_mobile_app/UI/splash.dart';
import 'package:mandobi_mobile_app/Utils/size_config.dart';
import 'package:mandobi_mobile_app/Widgets/bottom_navigation_bar.dart';
import 'package:stacked_services/stacked_services.dart';

import 'App/locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await configure();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    navigatorKey: StackedService.navigatorKey,
    home:  MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return SplashScreen();
          },
        );
      },
    );
  }
}

