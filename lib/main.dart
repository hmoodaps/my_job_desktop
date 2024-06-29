import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_job_desktop/backend/auth_service.dart';
import 'package:my_job_desktop/screens/login.dart';
import 'package:window_manager/window_manager.dart';
import 'cubit/app_states.dart';
import 'cubit/cubit.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await WindowManager.instance.setMinimumSize(const Size(1500, 800));
  await WindowManager.instance.setMaximumSize(const Size(1500, 800));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitClass()..getAllUsers(),
      child: BlocConsumer<CubitClass, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            CubitClass cub = CubitClass.get(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: cub.toggleLightAndDark(context),
              home:   const  Auth(),
            );
          }),
    );
  }
}
