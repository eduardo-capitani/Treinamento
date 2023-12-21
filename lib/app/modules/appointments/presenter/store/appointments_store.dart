import 'package:flutter/material.dart';

class AppointmentsStore extends ValueNotifier<List<List<String>>> {
  static final instance = AppointmentsStore();

  AppointmentsStore() : super([]);

  setItens(List<String> itens) {
    value = [...value, itens];
  }
}
