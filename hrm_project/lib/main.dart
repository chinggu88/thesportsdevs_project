import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm_project/app_utils.dart';
import 'package:hrm_project/views/main_view.dart';
import 'package:hrm_project/views/second_view.dart';

import 'controllers/next_home_match_controller.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyApp();
}

class _MyApp extends ConsumerState {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Animations Masterclass',
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.light(
              primary: Colors.blue,
            )),
        home: const MainView());
  }
}
