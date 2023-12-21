class AppConstants {
  static String get CLIENT_ID => 'ApontamentoRefugoMob';
  static String get CLIENT_SECRET => 'd54e0f4e-80e4-4608-a146-d33c4ed6773f';
  static String get SCOPE => 'openid';
  static String get GRANT_TYPE_PASSWORD => 'password';
  static String get GRANT_TYPE_REFRESH => 'refresh_token';
  static String get LOCAL_STORAGE_TOKEN_KEY => 'token';
  static String get AUTHORIZATION_HEADER_KEY => 'Authorization';
  static RegExp get VALID_TOKEN_REGEX => RegExp(r'(^[\w-]*\.[\w-]*\.[\w-]*$)');
  static String DATABASE_NAME = 'tupy_database.sqlite';
  static String get PRODUCTION_HEADER => 'preferences_scrap';
  static String get EXTERNOCONSTANT => 'REFUGOEXTERNO';
  static String get INTERNOCONSTANT => 'REFUGOINTERNO';
  static String get LOCAL_STORAGE_LAST_SYNC_KEY => 'lastSync';
  static String get key => '+MbQeThWmZq4t7w!z%C*F-J@NcRfUjXn';
}