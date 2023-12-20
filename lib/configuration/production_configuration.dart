import 'package:tupy_framework/configuration/app_config.dart';

class ProductionConfiguration extends AppConfig {
  ProductionConfiguration()
      : super(
          type: AppType.production,
          values:
              AppValues(apiUrl: 'https://portal1-qas.tupy.com.br/ApontamentoRefugoMob/rest'),
        );
}
