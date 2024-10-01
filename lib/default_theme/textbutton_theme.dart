import 'package:flutter/material.dart';

class DefaultTextButtonTheme{
  final BuildContext context;
  DefaultTextButtonTheme({required this.context});

  TextButtonThemeData get buttonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent
      )
    );
  }

  TextButtonThemeData get white {
    return TextButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              )
          ),
          backgroundColor: WidgetStateProperty.all(Colors.white),
        )
    );
  }

  TextButtonThemeData get accent {
    return TextButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Theme.of(context).colorScheme.primary),
              )
          ),
          backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
        )
    );
  }
}