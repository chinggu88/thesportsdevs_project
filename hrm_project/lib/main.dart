import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm_project/constant/logger.dart';
import 'package:hrm_project/riverpod/view/main_view.dart';

void main() {
  // runApp(ProviderScope(observers: [logger()], child: MyApp()));
  runApp(ProviderScope(
      observers: [logger()],
      child: MaterialApp(
          title: 'Flutter Animations Masterclass',
          theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.light(
                primary: Colors.blue,
              )),
          home: const MainView())));
}
