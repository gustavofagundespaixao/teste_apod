import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:teste_apod/app/core/pages/app_pages.dart';
import 'package:teste_apod/app/core/theme/app_theme.dart';
import 'package:teste_apod/app/modules/app_bindings.dart';
import 'app_controller.dart';

class AppPage extends GetView<AppController> {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tesis - Portal do aluno',
      getPages: AppPages.pages,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('pt', 'BR'),
      supportedLocales: const [Locale('pt', 'BR')],
      initialBinding: AppBindings(),
      darkTheme: AppTheme.themeDark(),
      theme: AppTheme.themeLight(),
      themeMode: ThemeMode.dark,
    );
  }
}
