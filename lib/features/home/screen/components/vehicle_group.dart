import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/constants/asset_constant.dart';
import 'package:venturo_core/shared/styles/color_style.dart';

class VehicleGroup extends StatelessWidget {
  const VehicleGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Golongan SIM
        Text(
          'A',
          style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
              color: ColorStyle.text900,
              height: 1.h),
        ),
        // Gambar mobil
        Image.asset(
          AssetConstants.icMobil,
          width: 32.w,
          height: 20.h,
        ),
        // Teks deskripsi
        Text(
          'Mobil Penumpang Pribadi\nPassenger Car/Personal Goods',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 6.sp,
            color: ColorStyle.text900,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
