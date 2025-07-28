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
        child: Stack(
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                // =========================
                // KARTU UTAMA (CONTAINER)
                // =========================
                Container(
                  width: 353.w,
                  height: 226.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    children: [
                      // =========================
                      // HEADER MERAH KARTU
                      // =========================
                      Container(
                        height: 28.h,
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
                                // =========================
                                // BACKGROUND SVG BAWAH (icBg)
                                // =========================
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: SvgPicture.asset(
                                    AssetConstants.icBg,
                                    alignment: Alignment.bottomCenter,
                                    width: double.infinity,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                // =========================
                                // BACKGROUND SVG BAWAH 2 (icBg2)
                                // =========================
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: SvgPicture.asset(
                                    AssetConstants.icBg2,
                                    alignment: Alignment.bottomCenter,
                                    width: double.infinity,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                // =========================
                                // ICON MAP (icMap)
                                // =========================
                                Center(
                                  child: SvgPicture.asset(
                                    AssetConstants.icMap,
                                    colorFilter: const ColorFilter.mode(
                                      Color(0xFFBBBDBD),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                                // =========================
                                // LOGO POLANTAS (icPolantas)
                                // =========================
                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 16.h),
                                    child: SvgPicture.asset(
                                      AssetConstants.icPolantas,
                                    ),
                                  ),
                                ),
                                // =========================
                                // FOTO PEMILIK KARTU (photo)
                                // =========================
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 16.w, bottom: 16.h),
                                    child: Image.asset(
                                      AssetConstants.photo,
                                      width: 70.w,
                                      height: 95.w,
                                      fit: BoxFit.cover,
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
                // =========================
                // LOGO POLISI (icPolisi)
                // =========================
                Padding(
                  padding: EdgeInsets.only(left: 30.w, bottom: 180.h),
                  child: SvgPicture.asset(
                    AssetConstants.icPolisi,
                    height: 40.13.h,
                    width: 41.12.w,
                  ),
                ),
                // =========================
                // TEKS "INDONESIA"
                // =========================
                Padding(
                  padding: EdgeInsets.only(left: 90.w, bottom: 188.h),
                  child: Text(
                    "INDONESIA",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFF0F0F1),
                    ),
                  ),
                ),
                // =========================
                // TEKS "DRIVER LICENSE"
                // =========================
                Padding(
                  padding: EdgeInsets.only(left: 240.w, bottom: 185.h),
                  child: Text(
                    "DRIVER LICENSE",
                    style: TextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFF0F0F1),
                    ),
                  ),
                ),
                // =========================
                // TEKS "SURAT IZIN MENGEMUDI"
                // =========================
                Padding(
                  padding: EdgeInsets.only(left: 90.w, bottom: 158.h),
                  child: Text(
                    "SURAT IZIN MENGEMUDI",
                    style: TextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFE62129),
                    ),
                  ),
                ),
                // =========================
                // WATERMARK "PUTRA NEGARA"
                // =========================
                IgnorePointer(
                  child: SizedBox(
                    width: 353.w,
                    height: 226.h,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final width = constraints.maxWidth;
                        final height = constraints.maxHeight;
                        const watermark = 'PUTRA NEGARA';
                        const stepY = 50.0;
                        const stepX = 70.0;
                        List<Widget> watermarks = [];
                        for (double y = -height; y < height * 2; y += stepY) {
                          for (double x = -width; x < width * 2; x += stepX) {
                            watermarks.add(
                              Positioned(
                                left: x,
                                top: y,
                                child: Transform.rotate(
                                  angle: -0.4,
                                  child: const Opacity(
                                    opacity: 0.2,
                                    child: Text(
                                      watermark,
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        }
                        return Stack(children: watermarks);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
