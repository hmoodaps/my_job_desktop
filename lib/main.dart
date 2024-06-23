import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'common/backend/auth_service.dart';
import 'common/cubit/app_states.dart';
import 'common/cubit/cubit.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.top
  ]);

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitClass(),
      child: BlocConsumer<CubitClass, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            CubitClass cub = CubitClass.get(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: cub.toggleLightAndDark(context),
              home: const Auth(),

            );
          }),
    );
  }
}
