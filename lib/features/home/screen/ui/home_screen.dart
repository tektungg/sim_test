import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/home/controllers/home_controller.dart';
import 'package:venturo_core/features/home/screen/components/header.dart';
import 'package:venturo_core/features/home/screen/components/main_card.dart';
import 'package:venturo_core/features/home/screen/components/watermark.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Stack(
          children: [
            MainCard(),
            Header(),
            Watermark(),
          ],
        ),
      ),
    );
  }
}
