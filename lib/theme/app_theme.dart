import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:morty_flutter/theme/typo.dart';

import 'color.dart';

ThemeData getThemeData({required BuildContext context, bool isDark = false}) {
  return ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.lato().fontFamily,
    textTheme: getTextTheme(context),
    colorScheme: isDark ? darkColors : lightColors,
    // ...etc
  );
}
