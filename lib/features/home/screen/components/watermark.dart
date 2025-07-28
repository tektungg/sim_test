import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Watermark extends StatelessWidget {
  const Watermark({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
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
    );
  }
}
