import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:venturo_core/constants/asset_constant.dart';
import 'package:venturo_core/features/home/screen/components/card_info.dart';
import 'package:venturo_core/features/home/screen/components/qr_code';
import 'package:venturo_core/features/home/screen/components/vehicle_group.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353.w,
      height: 226.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          // HEADER MERAH KARTU
          Container(
            height: 30.h,
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
                    // BACKGROUND SVG BAWAH (icBg)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                        AssetConstants.icBg,
                        alignment: Alignment.bottomCenter,
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    // BACKGROUND SVG BAWAH 2 (icBg2)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                        AssetConstants.icBg2,
                        alignment: Alignment.bottomCenter,
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    // ICON MAP (icMap)
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 60.w),
                        child: SvgPicture.asset(
                          AssetConstants.icMap,
                          colorFilter: const ColorFilter.mode(
                            Color(0xFFBBBDBD),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    // LOGO POLANTAS (icPolantas)
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.h),
                        child: SvgPicture.asset(
                          AssetConstants.icPolantas,
                        ),
                      ),
                    ),
                    // FOTO PEMILIK KARTU (photo)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w, bottom: 16.h),
                        child: Image.asset(
                          AssetConstants.photo,
                          width: 70.w,
                          height: 95.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // TANDA TANGAN (icSign)
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w, bottom: 18.h),
                        child: Image.asset(
                          AssetConstants.icSign,
                          width: 70.w,
                          height: 30.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 18.w, top: 2.h),
                        child: const VehicleGroup(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 8.w, bottom: 8.h),
                        child: const QrCode(),
                      ),
                    ),
                    // CARD INFO
                    Positioned(
                      left: 90.w,
                      top: 10.h,
                      right: 24.w,
                      child: const CardInfo(
                        id: "3175095801131001",
                        name: "PUTRA NEGARA",
                        birthPlaceDate: "JAKARTA 17 AGUSTUS 1975",
                        bloodType: "O",
                        gender: "PRIA",
                        address:
                            "MT HARYONO ST, RT.4/RW.2, CIKOKO,\nPANCORAN JAKARTA SELATAN",
                        job: "POLRI",
                        issuedBy: "METRO JAYA",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
