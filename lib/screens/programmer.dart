import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:my_job_desktop/common/cubit/app_states.dart';
import 'package:my_job_desktop/common/cubit/cubit.dart';

class Programmer extends StatelessWidget {
  const Programmer({super.key});

  @override
  Widget build(BuildContext context) {
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
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(

                      children: [
                        IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon: const Icon(IconlyBroken.arrow_left)),


                      ],
                    ),
                  ),
                ),
              ],
            ));
      },
      listener: (context, state) {},
    );
  }
}
