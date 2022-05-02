// This is our global ServiceLocator
import 'package:get_it/get_it.dart';
import 'package:grad/app/data/services/StreamService.dart';

GetIt getIt = GetIt.instance;
Future<void> setupLocator() async {
  getIt.registerLazySingleton(() => StreamService());
}
