// This is our global ServiceLocator
import 'package:get_it/get_it.dart';
import 'package:grad/app/data/services/FlutterNotificationService.dart';
import 'package:grad/app/data/services/OneSignalService.dart';
import 'package:grad/app/data/services/StreamService.dart';

GetIt getIt = GetIt.instance;
Future<void> setupLocator() async {
  getIt.registerLazySingleton(() => StreamService());
  getIt.registerLazySingleton(() => FlutterNotificationService());
  getIt.registerLazySingleton(() => OneSignalService());
}
