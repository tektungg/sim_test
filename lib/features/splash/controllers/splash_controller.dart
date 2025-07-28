import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/utils/services/hive_service.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  void toDashboard() {
    Future.delayed(const Duration(seconds: 2), () {
      if (HiveService.getBearer() != null) {
        Get.offAllNamed(Routes.crudRoute);
      } else {
        Get.offNamed(Routes.signInRoute);
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    toDashboard();
  }
}
