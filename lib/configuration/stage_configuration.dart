import 'package:tupy_framework/configuration/app_config.dart';

class StageConfiguration extends AppConfig {
  StageConfiguration()
      : super(
          type: AppType.stage,
          values:
              AppValues(apiUrl: 'https://portal1-qas.tupy.com.br/ApontamentoRefugoMob/rest'),
        );
}
