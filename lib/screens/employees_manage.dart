import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:my_job_desktop/components/components.dart';
import 'package:my_job_desktop/screens/employee_details.dart';
import '../cubit/app_states.dart';
import '../cubit/cubit.dart';
import '../models/user_model.dart';
import 'add_employee.dart';

class EmployeesManage extends StatelessWidget {
  const EmployeesManage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocConsumer<CubitClass, AppState>(
        listener: (context, state) {},
        builder: (BuildContext context, AppState state) {
          CubitClass cub = CubitClass.get(context);

          return Scaffold(
            body: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(IconlyBroken.arrow_left)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 8,
                          height: 50,
                          child: MaterialButton(
                            onPressed: () {
                              navigatorTo(context, AddEmployee());
                            },
                            color: Colors.blue,
                            child: const Row(
                              children: [
                                Icon(IconlyBroken.add_user),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Add Employee'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 8,
                          height: 50,
                          child: MaterialButton(
                            onPressed: () {},
                            color: Colors.blue,
                            child: const Row(
                              children: [
                                Icon(IconlyBroken.send),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('Send Group Note')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[700],
                              border: const OutlineInputBorder(),
                              labelText: 'Search',
                              labelStyle: TextStyle(
                                  color:
                                      cub.isDark ? Colors.blue : Colors.black),
                              suffixIcon: Icon(IconlyBroken.search,
                                  color:
                                      cub.isDark ? Colors.blue : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Employees',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      DropdownButton<String>(
                        value: cub.selectedCategory,
                        items: <String>['All', 'Cleaners', 'Security', 'Others']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                value,
                                style: TextStyle(
                                    color: cub.isDark
                                        ? Colors.blueAccent
                                        : Colors.black),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            cub.updateCategory(newValue);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: _employeeGrid(cub),
                ),
              ],
            ),
          );
        },
      );
    });
  }

  Widget _employeeGrid(CubitClass cub) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = (constraints.maxWidth / 200).floor();
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1.0,
          ),
          itemCount: cub.allUsers.length,
          itemBuilder: (context, index) {
            return _employeeItem(context, index, cub);
          },
        );
      },
    );
  }

  Widget _employeeItem(context, int index, CubitClass cub) {
    UserModel model = cub.allUsers[index];
    return GestureDetector(
      onTap: () {
        navigatorTo(context, EmployeeDetails(model: model));
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.blue,
            backgroundImage: NetworkImage(model.profilePhoto ?? ''),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            model.name ?? '',
            style: const TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
