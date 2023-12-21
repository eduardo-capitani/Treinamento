import 'package:treinamento/app/modules/home/presenter/pages/home_page.dart';
import 'package:treinamento/app/modules/home/presenter/stores/home_store.dart';
import 'package:tupy_framework/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => HomeStore(
            localStorage: i(),
            authnUseCase: i(),
          ),
        ),
      ];

  @override
  List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => HomePage(
        store: Modular.get(),
      ),
    ),
  ];
}