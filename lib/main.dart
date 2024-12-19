import 'package:flutter/material.dart';
import 'package:teste_apod/app/modules/app_page.dart';
import 'package:teste_apod/app/modules/error_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    runApp(ErrorPage());
  };

  runApp(const AppPage());
}
