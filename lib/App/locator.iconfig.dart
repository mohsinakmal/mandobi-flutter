import 'package:get_it/get_it.dart';
import 'package:mandobi_mobile_app/ViewModels/main_view_model.dart';

Future<void> $initGetIt(GetIt g, {String? environment}) async{
  g.registerLazySingleton<MainViewModel>(() => MainViewModel());
}