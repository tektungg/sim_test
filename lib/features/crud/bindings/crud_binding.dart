import 'package:get/get.dart';
import 'package:venturo_core/features/crud/controllers/crud_controller.dart';

class CrudBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CrudController());
  }
}
