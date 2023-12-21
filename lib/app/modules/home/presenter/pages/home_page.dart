import 'package:flutter/material.dart';
import 'package:tupy_framework/entities/feature_menu.dart';
import 'package:tupy_framework/ui.dart';

import '../stores/home_store.dart';

class HomePage extends StatefulWidget {
  final HomeStore store;
  const HomePage({
    super.key,
    required this.store,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore get store => widget.store;

  final List<FeatureMenuEntity> menus = [];

  @override
  void initState() {
    super.initState();
    store.init();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 10,
        ),
      ),
    );
  }
}
