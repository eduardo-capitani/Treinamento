import 'package:treinamento/app/domain/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:tupy_framework/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'MES PEE',
      theme: AppTheme.getLightTheme,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}