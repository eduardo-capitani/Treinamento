import 'dart:developer';

import 'package:treinamento/app/app_module.dart';
import 'package:treinamento/app/domain/utils/app_constants.dart';
import 'package:treinamento/app/modules/development_configuration.dart';
import 'package:treinamento/configuration/production_configuration.dart';
import 'package:flutter/material.dart';
import 'package:tupy_framework/configuration/app_config.dart';
import 'package:tupy_framework/tupy_framework.dart';
import 'package:tupy_framework/ui.dart';
import 'configuration/stage_configuration.dart';

void main() async {
  const appEnv = String.fromEnvironment('APP_ENV', defaultValue: 'stage');
  log('====>> APP_ENV: $appEnv');
  AppConfig appConfig;
  switch (appEnv) {
    case 'stage':
      appConfig = StageConfiguration();
      break;
    case 'dev':
      appConfig = DevelopmentConfiguration();
      break;
    default:
      appConfig = ProductionConfiguration();
  }
  await Framework.ensureInitialized(
      appTitle: 'Treinamento',
      appConfig: appConfig,
      authConfig: AuthConfig(
          authUrl:
              'https://portal1.tupy.com.br/auth/realms/PRD_PORTAL/protocol/openid-connect/token',
          clientId: AppConstants.CLIENT_ID,
          clientSecret: AppConstants.CLIENT_SECRET,
          scope: AppConstants.SCOPE,
          grantTypePassword: AppConstants.GRANT_TYPE_PASSWORD,
          grantTypeRefreshToken: AppConstants.GRANT_TYPE_REFRESH));

  runApp(
    FrameworkMainWidget(
      appModule: AppModule(),
      theme: AppTheme.light(useMaterial3: false),
    ),
  );
}
