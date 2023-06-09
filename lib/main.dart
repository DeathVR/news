import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:news/ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ru'),
        Locale('uz'),
        Locale('en'),
      ],
      path: 'assets/transletion',
      saveLocale: true,
      fallbackLocale: const Locale('ru'),
      child: const MyApp(),
    ),
  );
}
