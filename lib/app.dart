import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/configs/pages/page.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/configs/themes/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Screen Util Init berdasarkan ukuran iphone xr
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GestureDetector(
          onTap: () => Get.focusScope?.unfocus(),
          child: GetMaterialApp(
            title: 'Venturo Core',
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.homeRoute,
            theme: themeLight,
            defaultTransition: Transition.native,
            getPages: Pages.pages,
          ),
        );
      },
    );
  }
}
