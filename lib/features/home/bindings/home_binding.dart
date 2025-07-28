import 'package:get/get.dart';
import 'package:venturo_core/features/home/controllers/home_controller.dart';
    
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
  