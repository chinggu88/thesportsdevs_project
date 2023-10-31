import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm_project/constant/logger.dart';
import 'package:hrm_project/firebase_options.dart';
import 'package:hrm_project/riverpod/view/main_view.dart';

void main() async {
  // firebase init
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
