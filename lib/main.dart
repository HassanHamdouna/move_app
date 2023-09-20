import 'package:flutter/material.dart';
import 'package:move_app/app/screen/video_player_screen.dart';
import 'package:move_app/core/global/theme/theme_data/theme_data_dark.dart';
import 'package:move_app/core/services/services_locator.dart';
import 'package:move_app/core/global/localization/app_strings.dart';
import 'app/screen/bottom_navigation_bar_screen.dart';

void main() async {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: getThemeDataDark(),
      home: const VideoPlayerScreen(),
    );
  }
}
