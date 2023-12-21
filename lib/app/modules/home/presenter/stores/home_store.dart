import 'package:flutter_triple/flutter_triple.dart';
import 'package:treinamento/app/domain/routes/app_routes.dart';
import 'package:treinamento/app/domain/utils/app_constants.dart';
import 'package:tupy_framework/navigation/app_navigation.dart';
import 'package:tupy_framework/entities/feature_menu.dart';
import 'package:tupy_framework/modules/login/domain/usecases/authentication/i_auth_usecase.dart';
import 'package:tupy_framework/modules/login/presenter/pages/login_page.dart';
import 'package:tupy_framework/services/local_storage/i_local_storage.dart';


class HomeState {
  List<FeatureMenuEntity> menus;

  HomeState({
    this.menus = const [],
  });
}

class HomeStore extends Store<HomeState> {
  final ILocalStorage localStorage;
  final IAuthUseCase authnUseCase;

  HomeStore({
    required this.localStorage,
    required this.authnUseCase,
  }) : super(HomeState());


  void init() async {
    checkIfUserIsLogged();
  }

  void checkIfUserIsLogged() async {
    try {
      final useOfflineMode = await localStorage.getUseOfflineMode();
      // final synced = await hasSync();
      // if (!synced) {
      //   AppNavigation.pushReplacement(AppRoutes.data);
      //   return;
      // }
      AppNavigation.pushReplacement(AppRoutes.menu);
    } catch (e) {
      redirectToLogin();
    }
  }

  Future<bool> hasSync() async {
    DateTime? lastSync = await getLastSync();
    if (lastSync == null) {
      return false;
    }
    return true;
  }

  Future<DateTime?> getLastSync() async {
    String? lastSync =
    await localStorage.get(AppConstants.LOCAL_STORAGE_LAST_SYNC_KEY);
    if (lastSync == null) {
      return null;
    }
    return DateTime.parse(lastSync);
  }

  void redirectToLogin() {
    AppNavigation.pushReplacement(AppRoutes.login, arguments: LoginPageArgs());
  }
}
