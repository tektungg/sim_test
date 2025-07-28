import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venturo_core/app.dart';
import 'package:venturo_core/flavors.dart';
import 'package:venturo_core/utils/services/api_service.dart';
import 'package:venturo_core/utils/services/applink_service.dart';
import 'package:venturo_core/utils/services/hive_service.dart';
import 'package:vpack/vpack.dart';
import 'utils/services/sentry_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /* Uncomment jika sudah membuat Firebase Options
   await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform); 
  */

  await _initServices();
}

Future<void> _initServices() async {
  await VPack.initialize();
  await F.init();

  await Get.putAsync(() => HiveService().initHive());
  /* Uncomment jika sudah membuat Firebase Options 
   await Get.putAsync(() => LocalNotificationService().initNotification());
   await Get.putAsync(() => FirebaseNotificationService().init());
  */
  await Get.putAsync(() => ApplinkService().initApplink());
  await Get.putAsync(() => ApiService().init());
  // await Get.putAsync(() => AmplitudeServices().init());

  await SentryFlutter.init(
    SentryService.instance.initializeConfiguration,
    appRunner: () => runApp(const MyApp()),
  );
}
