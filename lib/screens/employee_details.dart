import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:my_job_desktop/cubit/app_states.dart';
import 'package:my_job_desktop/cubit/cubit.dart';

import '../models/user_model.dart';

class EmployeeDetails extends StatelessWidget {
  final UserModel model;

  const EmployeeDetails({super.key, required this.model});


  @override
  Widget build(BuildContext context) {
    CubitClass cub = CubitClass.get(context);
    return BlocConsumer<CubitClass, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            },icon: const Icon(IconlyBroken.arrow_left_2),
            ),

          ),
        );
      },
    );
  }

}