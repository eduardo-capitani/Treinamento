import 'package:tupy_framework/configuration/app_config.dart';

class ProductionConfiguration extends AppConfig {
  ProductionConfiguration()
      : super(
          type: AppType.production,
          values:
              AppValues(apiUrl: 'http://portal1.tupy.com.br/ApontamentoRefugoMob/rest'),
        );
}
