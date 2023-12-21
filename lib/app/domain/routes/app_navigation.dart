import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppNavigation {
  static pushReplacement(String path, {dynamic arguments}) {
    return Modular.to.navigate(path);
  }

  static pushNamed(String path, {Object? arguments, bool forRoot = false}) {
    return Modular.to.pushNamed(path, arguments: arguments, forRoot: forRoot);
  }

  static popAndPushNamed(String path,
      {Object? arguments, bool forRoot = false}) {
    return Modular.to
        .popAndPushNamed(path, arguments: arguments, forRoot: forRoot);
  }

  static pop<T extends Object?>([T? result]) {
    return Modular.to.pop(result);
  }

  static popUntil(String path) {
    return Modular.to.popUntil(ModalRoute.withName(path));
  }
}
