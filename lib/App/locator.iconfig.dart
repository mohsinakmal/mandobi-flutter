import 'package:get_it/get_it.dart';
import 'package:mandobi_mobile_app/ViewModels/agent_mainViewModel.dart';
import 'package:mandobi_mobile_app/ViewModels/agent_registration_model.dart';
import 'package:mandobi_mobile_app/ViewModels/user_mainViewModel.dart';
import 'package:mandobi_mobile_app/ViewModels/user_registration_model.dart';

Future<void> $initGetIt(GetIt g, {String? environment}) async{
  g.registerLazySingleton<UserMainViewModel>(() => UserMainViewModel());
  g.registerLazySingleton<UserRegistrationModel>(() => UserRegistrationModel());
  g.registerLazySingleton<AgentRegistrationModel>(() => AgentRegistrationModel());
  g.registerLazySingleton<AgentMainViewModel>(() => AgentMainViewModel());
}