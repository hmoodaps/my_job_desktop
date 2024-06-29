import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:shimmer_effect/shimmer_effect.dart';
import '../components/components.dart';
import '../cubit/app_states.dart';
import '../cubit/cubit.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  void _showLoginDialog(BuildContext context, String msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          msg,
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Ok',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    CubitClass cub = CubitClass.get(context);
    return BlocConsumer<CubitClass, AppState>(
      listener: (context, state) {
        if (state is Login) {
          showDialog(
            context: context,
            builder: (context) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state is LoginFailed) {
          Navigator.pop(context);
          _showLoginDialog(context, 'Sorry, you don\'t have permissions to be here');
        } else if (state is LoginSuccess) {
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
          _showLoginDialog(context, 'Welcome Sir, You Have All Permissions');
        }else if(state is LoginError){
          Navigator.pop(context);
          _showLoginDialog(context, 'Sorry \nWe think there is an error\nin your info');

        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color(0xFF000066),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(500),
                    bottomRight: Radius.circular(1),
                  ),
                ),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 7.2,
                            child: const Center(
                              child: Text(
                                'Login',
                                style: TextStyle(fontFamily: 'rocky', fontSize: 50),
                              ),
                            ),
                          ),
                          const SizedBox(height: 70),
                          defaultTextFormField(
                            textColorIfFieldEnable: cub.isDark ? Colors.white : Colors.black,
                            labelText: 'Email Address',
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            prefixIcon: const Icon(IconlyBroken.message, color: Color(0xFF7FFFD4)),
                            defaultBorderColor: const Color(0xFF7FFFD4),
                            focusedBorderColor: defaultPurpleColor,
                            borderColorOnNotFocus: const Color(0xFF7FFFD4),
                            maxLength: 50,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(50.0),
                              topLeft: Radius.circular(50.0),
                            ),
                            borderRadiusOnFocus: const BorderRadius.only(
                              bottomRight: Radius.circular(50.0),
                              bottomLeft: Radius.circular(50.0),
                            ),
                            borderRadiusOnNotFocus: const BorderRadius.only(
                              topRight: Radius.circular(50.0),
                              topLeft: Radius.circular(50.0),
                            ),
                            controller: emailController,
                            validatorFunction: (String? value) {
                              if (value!.isEmpty) {
                                return 'This field is required';
                              }
                              return null;
                            },
                            context: context,
                          ),
                          const SizedBox(height: 30),
                          defaultTextFormField(
                            textColorIfFieldEnable: cub.isDark ? Colors.white : Colors.black,
                            labelText: 'Password',
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            prefixIcon: const Icon(IconlyBroken.lock, color: Color(0xFF7FFFD4)),
                            defaultBorderColor: const Color(0xFF7FFFD4),
                            focusedBorderColor: defaultPurpleColor,
                            borderColorOnNotFocus: const Color(0xFF7FFFD4),
                            maxLength: 50,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(50.0),
                              bottomRight: Radius.circular(50.0),
                            ),
                            borderRadiusOnFocus: const BorderRadius.only(
                              topRight: Radius.circular(50.0),
                              topLeft: Radius.circular(50.0),
                            ),
                            borderRadiusOnNotFocus: const BorderRadius.only(
                              bottomLeft: Radius.circular(50.0),
                              bottomRight: Radius.circular(50.0),
                            ),
                            controller: passController,
                            validatorFunction: (value) {
                              if (value!.isEmpty) {
                                return 'This field is required';
                              }
                              return null;
                            },
                            context: context,
                          ),
                          const SizedBox(height: 50),
                          Center(
                            child: Container(
                              height: 70,
                              width: 270,
                              decoration: BoxDecoration(
                                color: cub.isDark ? Colors.white : Colors.black,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(200),
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(200),
                                ),
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    cub.login(
                                      context: context,
                                      email: emailController.text,
                                      password: passController.text,
                                    );
                                  }
                                },
                                child: ShimmerEffect(
                                  baseColor: const Color(0xFF40E0D0),
                                  highlightColor: defaultPurpleColor,
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(200),
                                        topRight: Radius.circular(200),
                                        bottomRight: Radius.circular(20),
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.centerRight,
                                        end: Alignment.centerLeft,
                                        colors: [
                                          defaultPurpleColor,
                                          const Color(0xFF40E0D0),
                                        ],
                                      ),
                                    ),
                                    child: const SizedBox(
                                      height: 50,
                                      width: 250,
                                      child: Center(
                                        child: Text(
                                          'Login',
                                          style: TextStyle(fontSize: 25),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}