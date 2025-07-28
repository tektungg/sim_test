import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:venturo_core/constants/asset_constant.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Logo Polisi
        Padding(
          padding: EdgeInsets.only(left: 27.w, top: 7.h),
          child: SvgPicture.asset(
            AssetConstants.icPolisi,
            height: 40.13.h,
            width: 41.12.w,
          ),
        ),
        // Teks "INDONESIA"
        Padding(
          padding: EdgeInsets.only(left: 90.w, top: 7.h),
          child: Text(
            "INDONESIA",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFF0F0F1),
            ),
          ),
        ),
        // Teks "DRIVER LICENSE"
        Padding(
          padding: EdgeInsets.only(left: 240.w, top: 16.h),
          child: Text(
            "DRIVER LICENSE",
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFF0F0F1),
            ),
          ),
        ),
        // Teks "SURAT IZIN MENGEMUDI"
        Padding(
          padding: EdgeInsets.only(left: 90.w, top: 30.h),
          child: Text(
            "SURAT IZIN MENGEMUDI",
            style: TextStyle(
              fontSize: 9.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFE62129),
            ),
          ),
        ),
      ],
    );
  }
}
