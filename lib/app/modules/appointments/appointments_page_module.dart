import 'package:flutter_modular/flutter_modular.dart';
import 'package:treinamento/app/modules/appointments/presenter/pages/appointments_page.dart';

class AppointmentsPageModule extends Module {
  @override
  List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const AppointmentsPage(),
    ),
  ];
}
