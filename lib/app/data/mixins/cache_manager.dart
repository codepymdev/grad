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

  Future<Map<String, dynamic>> getNotificationSettings() async {
    final box = GetStorage();
    bool app = box.read(CacheManagerKey.APP_NOTIFICATION.toString()) ?? true;
    bool email =
        box.read(CacheManagerKey.EMAIL_NOTIFICATION.toString()) ?? true;
    bool sms = box.read(CacheManagerKey.SMS_NOTIFICATION.toString()) ?? true;
    bool announcement =
        box.read(CacheManagerKey.ANNOUNCEMENT.toString()) ?? true;

    return {
      "app": app,
      "announcement": announcement,
      "email": email,
      "sms": sms,
    };
  }

  Future<bool> updateNotificationSettings(type, val) async {
    final box = GetStorage();
    if (type == "app") {
      await box.write(CacheManagerKey.APP_NOTIFICATION.toString(), val);
    } else if (type == "sms") {
      await box.write(CacheManagerKey.SMS_NOTIFICATION.toString(), val);
    } else if (type == "email") {
      await box.write(CacheManagerKey.EMAIL_NOTIFICATION.toString(), val);
    } else if (type == "announcement") {
      await box.write(CacheManagerKey.ANNOUNCEMENT.toString(), val);
    }
    return true;
  }
}
enum CacheManagerKey {
  TOKEN,
  ME,
  SCHOOL,
  APP_NOTIFICATION,
  EMAIL_NOTIFICATION,
  SMS_NOTIFICATION,
  ANNOUNCEMENT,
}
