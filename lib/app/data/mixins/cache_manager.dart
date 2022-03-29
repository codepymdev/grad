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

  Future<bool> saveSchool(String? school) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.SCHOOL.toString(), school);
    return true;
  }

  Map<String, dynamic>? getMe() {
    final box = GetStorage();
    return box.read(CacheManagerKey.ME.toString());
  }

  String? getSchool() {
    final box = GetStorage();
    return box.read(CacheManagerKey.SCHOOL.toString());
  }

  Future<void> removeMe() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.ME.toString());
  }

  Future<void> removeSchool() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.SCHOOL.toString());
  }

  Future<dynamic> getNotificationSettings() async {
    final box2 = GetStorage();
    await box2.remove(CacheManagerKey.NOTIFICATION.toString());

    final box = GetStorage();
    return box.read(CacheManagerKey.NOTIFICATION.toString());
  }

  Future<bool> updateNotificationSettings(data) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.NOTIFICATION.toString(), data);
    return true;
  }
}
enum CacheManagerKey {
  TOKEN,
  ME,
  SCHOOL,
  NOTIFICATION,
}
