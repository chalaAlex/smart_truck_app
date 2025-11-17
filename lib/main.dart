import 'package:flutter/material.dart';
import 'package:easy_logistics/app/app.dart';
import 'package:easy_logistics/app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(
      // EasyLocalization(
      // supportedLocales: [Locale('en'), Locale('om'), Locale('am')],
      // // path: 'assets/translations',
      // fallbackLocale: Locale('en'),
      // // assetLoader: CodegenLoader(),
      //  ),
       MyApp()
  );
}
