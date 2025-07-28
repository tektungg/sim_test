import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:venturo_core/features/home/controllers/home_controller.dart';
import 'package:venturo_core/constants/asset_constant.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350.w,
          height: 250.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            children: [
              Container(
                height: 45.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFE62129),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF0F0F1),
                    ),
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SvgPicture.asset(
                            AssetConstants.icBg,
                            alignment: Alignment.bottomCenter,
                            width: double.infinity,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SvgPicture.asset(
                            AssetConstants.icBg2,
                            alignment: Alignment.bottomCenter,
                            width: double.infinity,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.w, bottom: 16.h),
                            child: Image.asset(
                              AssetConstants.photo,
                              width: 56.w,
                              height: 56.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Center(
                          child: SvgPicture.asset(
                            AssetConstants.icMap,
                            colorFilter: const ColorFilter.mode(
                              Color(0xFFBBBDBD),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
