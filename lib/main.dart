import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_slicing_assignment/Controller/Bindings/bindings.dart';
import 'package:ui_slicing_assignment/Pages/home_navigator.dart';
import 'package:ui_slicing_assignment/default_theme/textbutton_theme.dart';

import 'default_theme/color_theme.dart';
import 'default_theme/text_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: colorTheme().darkThemeColors,
        textTheme: DefaultText(context).getTextTheme(),
        textButtonTheme: DefaultTextButtonTheme(context: context).buttonTheme
      ),
      initialRoute: '/home_navigator',
      getPages: [
        GetPage(name: '/home_navigator', page: () => home(), binding: myBindings()),
      ],
    );
  }
}
