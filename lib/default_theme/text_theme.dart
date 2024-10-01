import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultText {
  final BuildContext context;

  DefaultText(this.context);

  TextTheme getTextTheme() {
    return TextTheme(
      displayLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 21),
      ),
      bodyMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 21 / 1.618),
      ),
      bodySmall: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 21 / 1.618,
          color: Theme.of(context).colorScheme.onPrimary.withAlpha(125),
        ),
      ),
    );
  }
}