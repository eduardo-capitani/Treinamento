import 'package:tupy_framework/errors/network_error.dart';
import 'package:tupy_framework/errors/unauthenticated_error.dart';
import 'package:tupy_framework/flutter_tripple.dart';
import 'package:tupy_framework/localization/localization.dart';
import 'package:tupy_framework/modules/login/domain/usecases/authentication/i_auth_usecase.dart';
import 'package:tupy_framework/modules/login/presenter/pages/login_page.dart';
import 'package:tupy_framework/services/local_storage/i_local_storage.dart';
import 'package:tupy_framework/tupy_framework.dart';



import '../../../../domain/routes/app_routes.dart';
import '../../../../domain/utils/app_constants.dart';
import '../../domain/entities/data.dart';

class DataState {
  List<DataEntity> data;

  DataState({required this.data});
}

class DataStore extends Store<DataState> {
  final IConnectivityService connectivityService;
  final IAuthUseCase authUseCase;
  final ILocalStorage localStorage;
  late DateTime lastSync;

  DataStore({
    // required this.appointmentUseCase,
    required this.localStorage,
    required this.connectivityService,
    required this.authUseCase,
  }) : super(
          DataState(data: []),
        );

  get completeLoadData => state.data.every((element) => element.completed);

  get errorLoadData => state.data.any((element) => element.error != null);

  void init() async {
    lastSync = DateTime.now();
    state.data.addAll([
      DataEntity(
        label: 'data.appointment'.translate(),
        load: loadAppointment,
        completed: false,
      ),
    ]);
    tryLoadData();
  }

  void loadEmpty() {}

  void tryLoadData() async {
    bool isOnline = await connectivityService.isOnline();
    if (!isOnline) {
      setError(NoConnectionError(), force: true);
      return;
    }
    final isValidToken = await authUseCase.refreshToken();
    if (!isValidToken) {
      final result = await AppNavigation.pushNamed(
        AppRoutes.login,
        arguments: LoginPageArgs(
          isFastAuth: true,
        ),
      );
      if (result != true) {
        setError(UnauthenticatedError(), force: true);
        return;
      }
    }
    load();
  }

  void tryAgain() {
    update(state, force: true);
    tryLoadData();
  }

  void load() {
    for (var element in state.data) {
      element.load();
    }
  }

  void loadAppointment() async {
    // final result = await appointmentUseCase.syncDataFromOnlineToOffline()
    // result.fold(
    //   (error) {
    //     state.data[0] = state.data[0].copyWith(error: error.message);
    //   },
    //   (data) {
    //     state.data[0] = state.data[0].copyWith(completed: true);
    //   },
    // );
    update(state, force: true);
  }

  void loadSpecificData(DataEntity e) {
    final dataCopied = e.copyWith(completed: false, error: null);
    state.data[state.data.indexOf(e)] = dataCopied;
    update(state, force: true);
    dataCopied.load();
  }

  void tryOnlyErrorData() {
    final data = state.data.where((element) => element.error != null).toList();
    for (var element in data) {
      loadSpecificData(element);
    }
  }


  void handleClose() async {
    await localStorage.save(AppConstants.LOCAL_STORAGE_LAST_SYNC_KEY, lastSync);
    AppNavigation.pushReplacement(AppRoutes.initialRoute);
  }
}
