import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:my_job_desktop/common/cubit/app_states.dart';
import 'package:my_job_desktop/common/cubit/cubit.dart';

class EmployeeDetails extends StatelessWidget {
  EmployeeDetails({super.key});

  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final bsnController = TextEditingController();
  final idNumberController = TextEditingController();
  final maritalStatusController = TextEditingController();
  final positionController = TextEditingController();
  final bankAccountIBANController = TextEditingController();
  final startDateController = TextEditingController();
  final contractEndDateController = TextEditingController();
  final hourlyRateController = TextEditingController();
  final weeklyHoursController = TextEditingController();
  final taxesController = TextEditingController();
  final totalSalaryController = TextEditingController();
  final healthInsuranceController = TextEditingController();
  final passwordController = TextEditingController();
  final salaryIncreaseLastMonthController = TextEditingController();
  final monthlySalaryController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final overtimeHoursLastWeekController = TextEditingController();
  final hoursMissedLastWeekController = TextEditingController();
  final daysMissedLastWeekController = TextEditingController();
  final totalSalaryLastMonthController = TextEditingController();
  final dailyTravelCostController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    CubitClass cub = CubitClass.get(context);
    return BlocConsumer<CubitClass, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(IconlyBroken.arrow_left),
            ),
            title: const Text(
              'Employee Details',
              style: TextStyle(fontSize: 22),
            ),
            centerTitle: false,
            actions: [
              TextButton(onPressed: (){}, child: const Text('Update' , style: TextStyle(color: Colors.blue),))
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://easy-feedback.de/wp-content/uploads/2022/10/Employee-Journey-What-it-is-and-how-to-improve-it.jpg'),
                    radius: 70,
                    foregroundColor: Colors.blue,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {},
                              height: 50,
                              color: Colors.blue,
                              child: const Row(
                                children: [
                                  Icon(IconlyBroken.chat),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Send Message'),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {},
                              height: 50,
                              color: Colors.blue,
                              child: const Row(
                                children: [
                                  Icon(Icons.insert_page_break_outlined),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Contract'),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {},
                              height: 50,
                              color: Colors.blue,
                              child: const Row(
                                children: [
                                  Icon(Icons.perm_identity),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Identity'),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {},
                              height: 50,
                              color: Colors.blue,
                              child: const Row(
                                children: [
                                  Icon(Icons.photo),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Change photo'),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {
                                DatePickerDialog(firstDate: DateTime(2010),lastDate: DateTime.now(),);
                              },
                              height: 50,
                              color: Colors.blue,
                              child: const Row(
                                children: [
                                  Icon(Icons.calendar_month),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Date Start'),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {},
                              height: 50,
                              color: Colors.blue,
                              child: const Row(
                                children: [
                                  Icon(Icons.date_range_outlined),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Contract Last Date'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {
                              },
                              height: 50,
                              color: Colors.blue,
                              child: const Row(
                                children: [
                                  Icon(Icons.calendar_month),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Date Of Birth'),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {},
                              height: 50,
                              color: Colors.blue,
                              child: const Row(
                                children: [
                                  Icon(Icons.family_restroom),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Marital Status'),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {},
                              height: 50,
                              color: Colors.blue,
                              child: const Row(
                                children: [
                                  Icon(Icons.business_center),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('position'),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {},
                              height: 50,
                              color: Colors.blue,
                              child: const Row(
                                children: [
                                  Icon(Icons.high_quality_sharp),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Qualification'),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {},
                              height: 50,
                              color: Colors.blue,
                              child: const Row(
                                children: [
                                  Icon(Icons.note_add_outlined),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Send Note'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          _defaultField(
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: nameController,
                            labelText: 'Full Name',
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                          _defaultField(
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: dobController,
                            labelText: 'Date of Birth',
                            prefixIcon: const Icon(
                              Icons.calendar_today,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                          _defaultField(
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: bsnController,
                            labelText: 'BSN',
                            prefixIcon: const Icon(
                              Icons.format_list_numbered,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          _defaultField(
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: idNumberController,
                            labelText: 'ID Number',
                            prefixIcon: const Icon(
                              Icons.format_list_numbered,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),       _defaultField(
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: addressController,
                            labelText: 'Address',
                            prefixIcon: const Icon(
                              Icons.home_filled,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                          _defaultField(
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: maritalStatusController,
                            labelText: 'Marital Status',
                            prefixIcon: const Icon(
                              Icons.family_restroom,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),

                        ],
                      ),
                      Row(
                        children: [
                          _defaultField(
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: positionController,
                            labelText: 'Position',
                            prefixIcon: const Icon(
                              Icons.work,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                          _defaultField(
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: bankAccountIBANController,
                            labelText: 'Bank Account IBAN',
                            prefixIcon: const Icon(
                              Icons.account_balance,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),    _defaultField(
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: emailController,
                            labelText: 'Email',
                            prefixIcon: const Icon(
                              Icons.mail,
                              color: Color(0xFF7FFFD4),
                            ),
                          ), _defaultField(
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: passwordController,
                            labelText: 'Password',
                            prefixIcon: const Icon(
                              Icons.key,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),

                        ],
                      ),
                      Row(
                        children: [
                          _defaultField(
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: phoneNumberController,
                            labelText: 'Phone Number',
                            prefixIcon: const Icon(
                              Icons.phone,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                          _defaultField(
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: startDateController,
                            labelText: 'Contract Start Date',
                            prefixIcon: const Icon(
                              Icons.calendar_today,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                          _defaultField(
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: contractEndDateController,
                            labelText: 'Contract End Date',
                            prefixIcon: const Icon(
                              Icons.calendar_today,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          _defaultField(
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: taxesController,
                            labelText: 'Taxes',
                            prefixIcon: const Icon(
                              Icons.attach_money,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                          _defaultField(
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: hourlyRateController,
                            labelText: 'Hourly Rate',
                            prefixIcon: const Icon(
                              Icons.attach_money,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                          _defaultField(
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: weeklyHoursController,
                            labelText: 'Weekly Hours',
                            prefixIcon: const Icon(
                              Icons.timer,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          _defaultField(
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: totalSalaryController,
                            labelText: 'Total Salary',
                            prefixIcon: const Icon(
                              Icons.account_balance_wallet,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                          _defaultField(
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: healthInsuranceController,
                            labelText: 'Health Insurance',
                            prefixIcon: const Icon(
                              Icons.medical_services,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                          _defaultField(
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: salaryIncreaseLastMonthController,
                            labelText: 'Salary Increase Last Month',
                            prefixIcon: const Icon(
                              Icons.attach_money,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          _defaultField(
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: monthlySalaryController,
                            labelText: 'Salary last month',
                            prefixIcon: const Icon(
                              Icons.attach_money,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                          _defaultField(
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: overtimeHoursLastWeekController,
                            labelText: 'Overtime Hours last week',
                            prefixIcon: const Icon(
                              Icons.timer,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                          _defaultField(
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: hoursMissedLastWeekController,
                            labelText: 'hours Missed Last week',
                            prefixIcon: const Icon(
                              Icons.timer,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          _defaultField(
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: daysMissedLastWeekController,
                            labelText: 'days Missed Last week',
                            prefixIcon: const Icon(
                              Icons.timer,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),

                          _defaultField(
                            labelColor: cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: dailyTravelCostController,
                            labelText: 'Daily Travel Cost',
                            prefixIcon: const Icon(
                              Icons.money,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),



                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _defaultField({
    required context,
    required TextEditingController controller,
    String labelText = 'labelText',
    double labelFontSize = 16,
    Color labelColor = Colors.black,
    Widget? prefixIcon,
    Widget? suffixIcon,
    Color focusedBorderColor = const Color(0xFF8A2BE2),
    Color borderColorOnNotFocus = const Color(0xFF7FFFD4),
    int? maxLength = 9999999999,
    String? Function(String?)? validatorFunction,
    bool obscureText = false,
    bool readOnly = false,
    bool enabled = true,
    Color textColorIfFieldNotEnable = Colors.black,
    Color textColorIfFieldEnable = Colors.white,
    TextInputType textInputType = TextInputType.text,
    textInputAction = TextInputAction.next,
    int maxLines = 1,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          maxLines: maxLines,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          enabled: enabled,
          style: TextStyle(
              color:
              enabled ? textColorIfFieldEnable : textColorIfFieldNotEnable),
          readOnly: readOnly,
          controller: controller,
          obscureText: obscureText,
          validator: validatorFunction,
          decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            labelText: labelText,
            labelStyle: TextStyle(
              fontSize: labelFontSize,
              color: labelColor,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: enabled ? borderColorOnNotFocus : borderColorOnNotFocus,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(50.0),
                topLeft: Radius.circular(50.0),
              ),
              borderSide: BorderSide(
                color: enabled ? focusedBorderColor : focusedBorderColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: enabled ? borderColorOnNotFocus : borderColorOnNotFocus,
              ),
            ),
          ),
          maxLength: maxLength,
          buildCounter: (BuildContext context,
              {int? currentLength, int? maxLength, bool? isFocused}) =>
          null,
        ),
      ),
    );
  }
}
