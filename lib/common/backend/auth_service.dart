import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../screens/home.dart';
import '../../screens/login.dart';
import '../../screens/welcome.dart';
import '../cubit/app_states.dart';
import '../cubit/cubit.dart';




class Auth extends StatelessWidget {
  const Auth ({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitClass, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData ) {
              return const Home();
            }
              return LoginPage();

          },
        );
      },
    );
  }
}

