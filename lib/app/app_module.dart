import 'package:treinamento/app/domain/routes/app_routes.dart';
import 'package:treinamento/app/modules/appointments/appointments_page_module.dart';
import 'package:treinamento/app/modules/home/home_module.dart';
import 'package:tupy_framework/flutter_modular.dart';
import 'package:tupy_framework/http.dart';
import 'package:tupy_framework/modules/camera/camera_module.dart';
import 'package:tupy_framework/modules/core/core_module.dart';
import 'package:tupy_framework/modules/image_editing/edit_image_module.dart';
import 'package:tupy_framework/modules/initial/initial_module.dart';
import 'package:tupy_framework/modules/login/login_module.dart';
import 'package:tupy_framework/services/http/i_auth_http_client.dart';
import 'package:tupy_framework/services/http/i_http_client.dart';
import 'package:tupy_framework/services/http/impl/auth_http_client.dart';
import 'package:tupy_framework/services/http/impl/authenticated_http_client.dart';
import 'package:tupy_framework/services/http/impl/http_client.dart';
import 'package:tupy_framework/services/local_storage/i_local_storage.dart';
import 'package:tupy_framework/services/local_storage/shared_preferences/local_storage_shared_preferences.dart';
import 'package:tupy_framework/tupy_framework.dart';

import 'modules/data/data_module.dart';
class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<BaseClient>(
          export: true,
          (i) => AuthenticatedHttpClient(localStorage: i()),
        ),
        Bind.lazySingleton<IHttpClient>(
          export: true,
          (i) => HttpClient(
            localStorage: i(),
            baseUrl: Framework().appConfig.values.apiUrl,
            httpClient: i(),
          ),
        ),
        Bind.lazySingleton<IAuthHttpClient>(
          export: true,
          (i) => AuthHttpClient(
            authBaseUrl: Framework().authConfig.authUrl,
          ),
        ),
        Bind.lazySingleton<ILocalStorage>(
          export: true,
          (i) => const LocalStorageSharedPreferences(),
        ),
        Bind.lazySingleton<ILocalStorage>(
          export: true,
          (i) => const LocalStorageSharedPreferences(),
        ),
        Bind.lazySingleton<IConnectivityService>(
            (i) => ConnectivityPlusService()),
        Bind.lazySingleton<ILocalStorage>(
            (i) => const LocalStorageSharedPreferences()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(AppRoutes.initialRoute, module: InitialModule()),
        ModuleRoute(AppRoutes.login, module: LoginModule()),
        ModuleRoute(AppRoutes.home, module: HomeModule()),
        ModuleRoute(AppRoutes.data, module: DataModule()),
        ModuleRoute(AppRoutes.menu, module: AppointmentsPageModule())
      ];

  @override
  List<Module> get imports => [
        CoreModule(),
      ];
}
