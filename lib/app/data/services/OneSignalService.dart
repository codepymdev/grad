import 'dart:developer';

import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalService {
  Future<void> initExternalUser({
    required externalUserId,
    required externalUserIdAuthHash,
  }) async {
    await OneSignal.shared
        .setExternalUserId(externalUserId, externalUserIdAuthHash)
        .then((results) {
      log(results.toString());
    }).catchError((error) {
      log(error.toString());
    });
  }
}
