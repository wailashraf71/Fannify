import 'package:easy_localization/easy_localization.dart';
import 'package:fannify/ui/app.dart';
import 'package:fannify/ui/components/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

void main() {
  Get.config(defaultTransition: Transition.cupertino);
  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [Locale('en', 'US'), Locale('ar', 'IQ')],
    path: 'assets/languages',
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fannify',
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      theme: mainThemeLight(context),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        EasyLocalization.of(context).delegate,
      ],
      supportedLocales: EasyLocalization.of(context).supportedLocales,
      locale: EasyLocalization.of(context).locale,
      home: App(),
    );
  }
}
