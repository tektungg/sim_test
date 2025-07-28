import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/home/bindings/home_binding.dart';
import 'package:venturo_core/features/home/screen/ui/home_screen.dart';

abstract class Pages {
  static final pages = [
  GetPage(
      name: Routes.homeRoute,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}