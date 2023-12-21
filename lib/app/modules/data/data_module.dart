import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:treinamento/app/modules/data/presenter/pages/data_page.dart';
import 'package:treinamento/app/modules/data/presenter/stores/data_store.dart';
import 'package:tupy_framework/framework.dart';
import 'package:tupy_framework/services/connectivity/i_connectivity.dart';
import 'package:tupy_framework/services/connectivity/implementations/connectivity_plus.dart';
import 'package:tupy_framework/services/database/i_database.dart';
import 'package:tupy_framework/services/http/i_auth_http_client.dart';
import 'package:tupy_framework/services/http/i_http_client.dart';
import 'package:tupy_framework/services/http/impl/auth_http_client.dart';
import 'package:tupy_framework/services/http/impl/authenticated_http_client.dart';
import 'package:tupy_framework/services/http/impl/http_client.dart';
import 'package:tupy_framework/services/local_storage/i_local_storage.dart';
import 'package:tupy_framework/services/local_storage/shared_preferences/local_storage_shared_preferences.dart';

import '../../domain/routes/app_routes.dart';


class DataModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<DataStore>(
          (i) => DataStore(
            localStorage: i.get(),
            authUseCase: i.get(),
            // appointmentUseCase: i.get(),
            connectivityService: i.get(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.initialRoute,
          child: (_, ___) => DataPage(
            store: Modular.get(),
          ),
        ),
      ];
}
