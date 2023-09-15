import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:move_app/core/global/theme/app_color/app_colors_light.dart';

ThemeData getThemeDataLight() => ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColorsLight.primaryColor,
      primaryColorLight: AppColorsLight.primaryColor,
      primaryColorDark: AppColorsLight.primaryColor,
      canvasColor: AppColorsLight.primaryColor,
      scaffoldBackgroundColor: AppColorsLight.primaryColor,
      bottomAppBarColor: AppColorsLight.primaryColor,
      cardColor: AppColorsLight.primaryColor,
      dividerColor: AppColorsLight.primaryColor,
      focusColor: AppColorsLight.primaryColor,
      hoverColor: AppColorsLight.primaryColor,
      errorColor: AppColorsLight.primaryColor,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColorsLight.primaryColor,
        selectionColor: AppColorsLight.primaryColor[100],
        selectionHandleColor: AppColorsLight.primaryColor,
      ),
      appBarTheme: const AppBarTheme(
        color: AppColorsLight.primaryColor,
        iconTheme: IconThemeData(color: AppColorsLight.primaryColor),
        textTheme: TextTheme(
          headline6: TextStyle(
            color: AppColorsLight.primaryColor,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColorsLight.primaryColor,
        textTheme: ButtonTextTheme.primary,
      ),
      iconTheme: const IconThemeData(color: AppColorsLight.primaryColor),
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        headline2: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
      ),
      primaryTextTheme: const TextTheme(
        headline6:
            TextStyle(fontSize: 20.0, color: AppColorsLight.primaryColor),
      ),
      accentTextTheme: const TextTheme(
        bodyText2:
            TextStyle(fontSize: 16.0, color: AppColorsLight.primaryColor),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColorsLight.primaryColor)),
        fillColor: AppColorsLight.primaryColor[200],
        filled: true,
        labelStyle: const TextStyle(color: AppColorsLight.primaryColor),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColorsLight.primaryColor,
        inactiveTrackColor: AppColorsLight.primaryColor,
        thumbColor: AppColorsLight.primaryColor,
        overlayColor: AppColorsLight.primaryColor.withAlpha(100),
        valueIndicatorColor: AppColorsLight.primaryColor,
        valueIndicatorTextStyle: const TextStyle(
          color: AppColorsLight.primaryColor,
        ),
      ),
      tabBarTheme: const TabBarTheme(
        labelColor: AppColorsLight.primaryColor,
        unselectedLabelColor: AppColorsLight.primaryColor,
        labelStyle: TextStyle(fontSize: 16.0),
        unselectedLabelStyle: TextStyle(fontSize: 16.0),
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColorsLight.primaryColor,
              width: 2.0,
            ),
          ),
        ),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColorsLight.primaryColor,
          borderRadius: BorderRadius.circular(4.0),
        ),
        textStyle: const TextStyle(
          fontSize: 14.0,
          color: AppColorsLight.primaryColor,
        ),
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(
        borderColor: AppColorsLight.primaryColor,
        selectedBorderColor: AppColorsLight.primaryColor,
        borderRadius: BorderRadius.circular(8.0),
        color: AppColorsLight.primaryColor,
        selectedColor: AppColorsLight.primaryColor,
        fillColor: AppColorsLight.primaryColor,
        focusColor: AppColorsLight.primaryColor[100],
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColorsLight.primaryColor,
        disabledColor: AppColorsLight.primaryColor[400],
        selectedColor: AppColorsLight.primaryColor,
        labelStyle: const TextStyle(color: AppColorsLight.primaryColor),
        secondaryLabelStyle:
            const TextStyle(color: AppColorsLight.primaryColor),
        padding: const EdgeInsets.all(8.0),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColorsLight.primaryColor[800],
        contentTextStyle: const TextStyle(color: AppColorsLight.primaryColor),
        elevation: 4.0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: AppColorsLight.primaryColor,
          onPrimary: AppColorsLight.primaryColor,
          elevation: 4.0,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          primary: AppColorsLight.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          side: const BorderSide(color: AppColorsLight.primaryColor),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: AppColorsLight.primaryColor,
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
        backgroundColor: AppColorsLight.primaryColor,
        selectedItemColor: AppColorsLight.primaryColor,
        unselectedItemColor: AppColorsLight.primaryColor,
        selectedLabelStyle:
            TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 14.0),
      ),
      navigationRailTheme: const NavigationRailThemeData(
        backgroundColor: AppColorsLight.primaryColor,
        unselectedLabelTextStyle:
            TextStyle(fontSize: 14.0, color: AppColorsLight.primaryColor),
        selectedLabelTextStyle: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: AppColorsLight.primaryColor),
        selectedIconTheme: IconThemeData(color: AppColorsLight.primaryColor),
        unselectedIconTheme: IconThemeData(color: AppColorsLight.primaryColor),
        elevation: 4.0,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: AppColorsLight.primaryColor,
          backgroundColor: AppColorsLight.transparent,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
