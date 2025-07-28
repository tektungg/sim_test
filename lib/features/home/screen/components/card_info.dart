import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardInfo extends StatelessWidget {
  final String id;
  final String name;
  final String birthPlaceDate;
  final String bloodType;
  final String gender;
  final String address;
  final String job;
  final String issuedBy;

  const CardInfo({
    super.key,
    required this.id,
    required this.name,
    required this.birthPlaceDate,
    required this.bloodType,
    required this.gender,
    required this.address,
    required this.job,
    required this.issuedBy,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ID
        Text(
          id,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
            color: Colors.black,
          ),
        ),
        // Nama
        Text(
          "Nama/Name",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 7.sp, color: Colors.black),
        ),
        Text(
          name,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 9.sp, color: Colors.black),
        ),
        SizedBox(height: 2.h),
        // Tempat Tanggal Lahir
        Text(
          "Tempat, Tgl Lahir/Place, Date of Birth",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 7.sp, color: Colors.black),
        ),
        Text(
          birthPlaceDate,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 9.sp, color: Colors.black),
        ),
        SizedBox(height: 2.h),

        // Golongan Darah & Jenis Kelamin
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gol. Darah/Blood Type",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 7.sp,
                        color: Colors.black),
                  ),
                  Text(
                    bloodType,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 9.sp,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jenis Kelamin/Gender",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 7.sp,
                        color: Colors.black),
                  ),
                  Text(
                    gender,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 9.sp,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),

        // Alamat
        Text(
          "Alamat/Address",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 7.sp, color: Colors.black),
        ),
        Text(
          address,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 9.sp, color: Colors.black),
        ),
        SizedBox(height: 2.h),

        // Pekerjaan
        Text(
          "Pekerjaan/Occupation",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 7.sp, color: Colors.black),
        ),
        Text(
          job,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 9.sp, color: Colors.black),
        ),
        SizedBox(height: 2.h),

        // Diterbitkan Oleh
        Text(
          "Diterbitkan Oleh/Issued By",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 7.sp, color: Colors.black),
        ),
        Text(
          issuedBy,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 9.sp, color: Colors.black),
        ),
      ],
    );
  }
}
