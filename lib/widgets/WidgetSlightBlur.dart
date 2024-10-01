import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class WidgetSlightBlur extends StatelessWidget {
  const WidgetSlightBlur({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.black,
            Colors.black12,
            Colors.black.withAlpha(0),
          ],
        ),
      ),
    );
  }
}
