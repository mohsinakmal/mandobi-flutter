import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mandobi_mobile_app/App/locator.iconfig.dart';

final locator = GetIt.instance;
@injectableInit
Future<void> configure() => $initGetIt(locator);