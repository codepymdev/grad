import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.TOKEN.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.TOKEN.toString());
  }

  Future<bool> saveMe(Map<String, dynamic>? data) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.ME.toString(), data);
    return true;
  }

  Map<String, dynamic>? getMe() {
    final box = GetStorage();
    return box.read(CacheManagerKey.ME.toString());
  }

  Future<void> removeMe() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.ME.toString());
  }
}
enum CacheManagerKey {
  TOKEN,
  ME,
}
