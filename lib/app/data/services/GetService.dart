// This is our global ServiceLocator
import 'package:Grad/app/data/services/FlutterNotificationService.dart';
import 'package:Grad/app/data/services/OneSignalService.dart';
import 'package:Grad/app/data/services/StreamService.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
Future<void> setupLocator() async {
  getIt.registerLazySingleton(() => StreamService());
  getIt.registerLazySingleton(() => FlutterNotificationService());
  getIt.registerLazySingleton(() => OneSignalService());
}
