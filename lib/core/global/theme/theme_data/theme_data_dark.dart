import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:move_app/core/global/theme/app_color/app_colors_dark.dart';

ThemeData getThemeDataDark() => ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColorsDark.primaryColor,
  primaryColorLight: AppColorsDark.primaryColor,
  primaryColorDark: AppColorsDark.primaryColor,
  canvasColor: AppColorsDark.primaryColor,
  scaffoldBackgroundColor: AppColorsDark.backgroundColor,
  bottomAppBarColor: AppColorsDark.primaryColor,

  cardColor: AppColorsDark.primaryColor,
  dividerColor: AppColorsDark.primaryColor,
  focusColor: AppColorsDark.primaryColor,
  hoverColor: AppColorsDark.primaryColor,
  errorColor: AppColorsDark.primaryColor,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColorsDark.primaryColor,
    selectionColor: AppColorsDark.primaryColor,
    selectionHandleColor: AppColorsDark.primaryColor,
  ),
  appBarTheme: const AppBarTheme(
    color: AppColorsDark.appBarColor,
    iconTheme: IconThemeData(color: AppColorsDark.appBarColor),
    textTheme:  TextTheme(
      headline6: TextStyle(
        color: AppColorsDark.appBarColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ), systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColorsDark.primaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
  iconTheme: const IconThemeData(color: AppColorsDark.primaryColor),
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: AppColorsDark.primaryColor, // Set the text color to white
  ),
  primaryTextTheme: const TextTheme(
    headline6: TextStyle(fontSize: 20.0, color: AppColorsDark.primaryColor),
  ),
  accentTextTheme: const TextTheme(
    bodyText2: TextStyle(fontSize: 16.0, color: AppColorsDark.primaryColor),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColorsDark.primaryColor)),
    fillColor: AppColorsDark.primaryColor,
    filled: true,
    labelStyle: TextStyle(color: AppColorsDark.primaryColor),
  ),
  sliderTheme: SliderThemeData(
    activeTrackColor: AppColorsDark.primaryColor,
    inactiveTrackColor: AppColorsDark.primaryColor,
    thumbColor: AppColorsDark.primaryColor,
    overlayColor: AppColorsDark.primaryColor.withAlpha(100),
    valueIndicatorColor: AppColorsDark.primaryColor,
    valueIndicatorTextStyle: const  TextStyle(
      color: AppColorsDark.primaryColor,
    ),
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: AppColorsDark.primaryColor,
    unselectedLabelColor: AppColorsDark.primaryColor,
    labelStyle: TextStyle(fontSize: 16.0),
    unselectedLabelStyle: TextStyle(fontSize: 16.0),
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: AppColorsDark.primaryColor,
          width: 2.0,
        ),
      ),
    ),
  ),
  tooltipTheme: TooltipThemeData(
    decoration: BoxDecoration(
      color: AppColorsDark.primaryColor,
      borderRadius: BorderRadius.circular(4.0),
    ),
    textStyle: const TextStyle(
      fontSize: 14.0,
      color: AppColorsDark.primaryColor,
    ),
  ),
  toggleButtonsTheme: ToggleButtonsThemeData(
    borderColor: AppColorsDark.primaryColor,
    selectedBorderColor: AppColorsDark.primaryColor,
    borderRadius: BorderRadius.circular(8.0),
    color: AppColorsDark.primaryColor,
    selectedColor: AppColorsDark.primaryColor,
    fillColor: AppColorsDark.primaryColor,
    focusColor: AppColorsDark.primaryColor,
  ),
  chipTheme: const ChipThemeData(
    backgroundColor: AppColorsDark.primaryColor,
    disabledColor: AppColorsDark.primaryColor,
    selectedColor: AppColorsDark.primaryColor,
    labelStyle: TextStyle(color: AppColorsDark.primaryColor),
    secondaryLabelStyle: TextStyle(color: AppColorsDark.primaryColor),
    padding: EdgeInsets.all(8.0),
  ),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: AppColorsDark.primaryColor,
    contentTextStyle: TextStyle(color: AppColorsDark.primaryColor),
    elevation: 4.0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: AppColorsDark.primaryColor,
      onPrimary: AppColorsDark.primaryColor,
      elevation: 4.0,
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      primary: AppColorsDark.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      side: const BorderSide(color: AppColorsDark.primaryColor),
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
    ),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: AppColorsDark.primaryColor,
    titleTextStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    contentTextStyle: TextStyle(fontSize: 16.0),
  ),
  scrollbarTheme: ScrollbarThemeData(
    isAlwaysShown: false,
    thickness: MaterialStateProperty.all(6.0),
    radius: const Radius.circular(3.0),
    showTrackOnHover: true,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColorsDark.primaryColor,
    selectedItemColor: AppColorsDark.primaryColor,
    unselectedItemColor: AppColorsDark.primaryColor,
    selectedLabelStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
    unselectedLabelStyle: TextStyle(fontSize: 14.0),
  ),
  navigationRailTheme: const NavigationRailThemeData(
    backgroundColor: AppColorsDark.primaryColor,
    unselectedLabelTextStyle: TextStyle(fontSize: 14.0, color: AppColorsDark.primaryColor),
    selectedLabelTextStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: AppColorsDark.primaryColor),
    selectedIconTheme: IconThemeData(color: AppColorsDark.primaryColor),
    unselectedIconTheme: IconThemeData(color: AppColorsDark.primaryColor),
    elevation: 4.0,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: AppColorsDark.primaryColor,
      backgroundColor: AppColorsDark.transparent,
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
    ),
  ),
);
