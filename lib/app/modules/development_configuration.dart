import 'package:tupy_framework/configuration/app_config.dart';

class DevelopmentConfiguration extends AppConfig {
  DevelopmentConfiguration() : super (
    type: AppType.development,
    values: AppValues(apiUrl: 'http://localhost:8888/ApontamentoRefugoMob/rest')
    );  
}