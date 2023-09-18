import 'package:flutter/material.dart';
import 'package:move_app/core/global/theme/theme_data/theme_data_dark.dart';
import 'package:move_app/core/services/services_locator.dart';
import 'package:move_app/core/global/localization/app_strings.dart';
import 'package:move_app/tvs/data/datasourcec/tv_remote_data_source.dart';

import 'package:move_app/tvs/data/repository/tv_repository.dart';
import 'package:move_app/tvs/domain/entities/tv.dart';
import 'package:move_app/tvs/domain/repository/base_tv_repository.dart';
import 'package:move_app/tvs/domain/usecaus/get_tv_on_the_air_usecase.dart';
import 'package:move_app/tvs/presentation/screens/tv_screen.dart';

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
      home: const TvScreen(),
    );
  }
}
