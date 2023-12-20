enum AppType { production, stage, development }

class AppValues {
  final String apiUrl;
  final String authUrl;

  AppValues({
    required this.apiUrl,
    required this.authUrl,
  });
}

class AppConfig {
  final AppType type;
  final AppValues values;
  static late AppConfig _instance;

  AppConfig({
    required AppType type,
    required AppValues values,
  }) : this._internal(type, values);

  AppConfig._internal(this.type, this.values);

  factory AppConfig.instance() {
    return _instance;
  }

  static bool get isProduction => _instance.type == AppType.production;

  static bool get isStage => _instance.type == AppType.stage;

  static String get description {
    switch (_instance.type) {
      case AppType.stage:
        return 'Qualidade';
      case AppType.development:
        return 'Desenvolvimento';
      default:
        return 'Produção';
    }
  }
}