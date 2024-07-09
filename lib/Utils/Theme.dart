


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeApp{

  final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      primary:    Color.fromRGBO(201, 201, 201, 1),
      primaryContainer:  const Color.fromRGBO(233, 233, 233, 1),
      background: const Color.fromRGBO(243, 243, 243, 1.0),
    ),
    textTheme:  TextTheme(
      displaySmall: GoogleFonts.karma(fontSize: 20,color: Colors.black),
        displayMedium: GoogleFonts.karma(fontSize: 30,color: Colors.black),
      displayLarge: GoogleFonts.karma(fontSize: 40,color: Colors.black),
    ),
    useMaterial3: true,
  );

  final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        primary:   Color.fromRGBO(5, 12, 38, 1),
        primaryContainer:  const Color.fromRGBO(36, 35, 35, 1),
        background: const Color.fromRGBO(5, 12, 38, 1),
    ),
      textTheme:  TextTheme(
          displaySmall: GoogleFonts.karma(fontSize: 20,color: Colors.white),
        displayMedium: GoogleFonts.karma(fontSize: 30,color: Colors.white),
        displayLarge: GoogleFonts.karma(fontSize: 40,color: Colors.white)
      ),
    useMaterial3: true,
  );



  static ValueNotifier<Brightness> theme=ValueNotifier(Brightness.light);

  static setTheme(){
    theme.value = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    changeStatusNavigationBar();
  }

  static changeStatusNavigationBar() {
    bool isDark = theme.value == Brightness.dark;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      statusBarBrightness: isDark ? Brightness.light : Brightness.dark,
      statusBarColor: isDark ? const Color(0xFF424242) : const Color(0xFF673AB7),
      systemNavigationBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: isDark ? const Color(0xFF303030) : const Color(0xFFFAFAFA),
    ));
  }


}