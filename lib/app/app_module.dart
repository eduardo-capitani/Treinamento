import 'package:treinamento/app/domain/routes/app_routes.dart';
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
class AppModule extends Module {
  @override
  List<Bind> get binds => [

      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(AppRoutes.initialRoute, module: InitialModule()),
        ModuleRoute(AppRoutes.login, module: LoginModule()),
      ];

  @override
  List<Module> get imports => [
        CoreModule(),
      ];
}
