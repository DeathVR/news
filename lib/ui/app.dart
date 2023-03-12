import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/domain/bloc/news_bloc.dart';
import 'package:news/ui/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: FlexColorScheme.themedSystemNavigationBar(context,
          noAppBar: true,
          systemNavBarStyle: FlexSystemNavBarStyle.transparent,
          useDivider: true,
          systemNavigationBarDividerColor: const Color.fromRGBO(0, 0, 0, .3)),
      child: BlocProvider(
        create: (context) => NewsBloc()..add(const NewsLoadeEvent()),
        child: MaterialApp(
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
