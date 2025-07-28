import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/crud/bindings/crud_binding.dart';
import 'package:venturo_core/features/crud/view/ui/crud_screen.dart';
import 'package:venturo_core/features/home/bindings/home_binding.dart';
import 'package:venturo_core/features/home/screen/ui/home_screen.dart';
import 'package:venturo_core/features/no_connection/view/ui/no_connection_screen.dart';
import 'package:venturo_core/features/splash/bindings/splash_binding.dart';
import 'package:venturo_core/features/splash/view/ui/splash_screen.dart';
import 'package:venturo_core/features/sign_in/bindings/sign_in_binding.dart';
import 'package:venturo_core/features/sign_in/screen/ui/sign_in_screen.dart';



abstract class Pages {
  static final pages = [
    GetPage(
      name: Routes.splashRoute,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.noConnection,
      page: () => const NoConnectionScreen(),
    ),
    GetPage(
      name: Routes.crudRoute,
      page: () => const CrudView(),
      binding: CrudBinding(),
    ),
  GetPage(
      name: Routes.signInRoute,
      page: () => const SignInScreen(),
      binding: SignInBinding(),
    ),
  GetPage(
      name: Routes.homeRoute,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}