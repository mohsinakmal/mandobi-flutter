import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentHome/agent_home_screen.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentProfile/agent_edit_profile.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentProfile/agent_my_profile.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentRegister/create_service.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentRegister/profile_creation_add_education.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentRegister/profile_creation_experience.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentRegister/profile_creation_one.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentRegister/profile_creation_three.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentRegister/profile_creation_two.dart';
import 'package:mandobi_mobile_app/UI/AgentFlow/AgentRegister/profile_creation_edit_service.dart';
import 'package:mandobi_mobile_app/UI/UserFlow/Home/home_screen.dart';
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

