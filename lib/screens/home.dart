import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_job_desktop/components/components.dart';
import 'package:my_job_desktop/cubit/app_states.dart';
import 'package:my_job_desktop/cubit/cubit.dart';
import 'package:my_job_desktop/screens/login.dart';
import 'package:my_job_desktop/screens/programmer.dart';

import 'employees_manage.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    CubitClass cub = CubitClass.get(context);
    return BlocConsumer<CubitClass, AppState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: const Color(0xFF00008B),
            body: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Color(0xFF000066),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(1000),
                      bottomRight: Radius.circular(1000),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Color(0xFF0000B5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(1000),
                        bottomLeft: Radius.circular(1000),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'H i   S i r   . .  ',
                            style: TextStyle(
                                fontFamily: 'hisir',
                                fontSize: 120,
                                color: Color(0xFFAFEEEE),
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: (){
                              navigatorTo(context, const EmployeesManage());
                            },
                            child: Container(
                              width: 500,
                              height: 70,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF00CED11),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: const Center(
                                child: Text(
                                  'Employee Info Manage',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          InkWell(
                            onTap: (){
                              print('WIDTH : ${MediaQuery.of(context).size.width} \nhegit: ${MediaQuery.of(context).size.height}');

                            },
                            child: Container(
                              width: 500,
                              height: 70,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF00CED1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: const Center(
                                child: Text(
                                  'Firebase Information',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            width: 500,
                            height: 70,
                            decoration: const BoxDecoration(
                                color: Color(0xFF00CED1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Center(
                              child: Text(
                                'Company Information',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),

                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap:(){
                  cub.signOut(context);
                },
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                width: 120,
                                height: 40,
                                decoration: const BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                                child: const Center(
                                  child: Text(
                                    'Sign Out',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              navigatorTo(context, const Programmer());
                            },

                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: 100,
                                height: 30,
                                decoration: const BoxDecoration(
                                    color: Color(0xFF00CED1),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                                child: const Center(
                                  child: Text(
                                    'Programmer Info',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ));
      },
      listener: (context, state) {
        if (state is LoggingOut) {
          showDialog(context: context, builder: (context)=>const Center(child: CircularProgressIndicator())) ;
        }
        if (state is LoggedOut) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
        }
        if (state is LogoutError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
    );
  }
}
