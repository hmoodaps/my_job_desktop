import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_job_desktop/components/components.dart';
import 'package:my_job_desktop/cubit/app_states.dart';
import 'package:my_job_desktop/cubit/cubit.dart';
import 'package:my_job_desktop/screens/upload_contract.dart';
import 'package:my_job_desktop/screens/upload_identity.dart';
import 'package:my_job_desktop/screens/upload_qualification.dart';

import '../models/user_model.dart';

class UpdateEmployee extends StatelessWidget {
  final UserModel model;

  const UpdateEmployee(
      {super.key,
      required this.model,
      required this.nameController,
      required this.dobController,
      required this.bsnController,
      required this.idNumberController,
      required this.maritalStatusController,
      required this.positionController,
      required this.departController,
      required this.bankAccountIBANController,
      required this.contractStartDateController,
      required this.contractLastDateController,
      required this.hourlyRateController,
      required this.weeklyHoursController,
      required this.taxesController,
      required this.totalSalaryController,
      required this.healthInsuranceController,
      required this.addressController,
      required this.phoneNumberController,
      required this.emailController,
      required this.passController, required this.travelCostController});

  final TextEditingController nameController;
  final TextEditingController dobController;
  final TextEditingController bsnController;
  final TextEditingController idNumberController;
  final TextEditingController maritalStatusController;
  final TextEditingController positionController;
  final TextEditingController departController;
  final TextEditingController bankAccountIBANController;
  final TextEditingController contractStartDateController;
  final TextEditingController contractLastDateController;
  final TextEditingController hourlyRateController;
  final TextEditingController weeklyHoursController;
  final TextEditingController taxesController;
  final TextEditingController totalSalaryController;
  final TextEditingController healthInsuranceController;
  final TextEditingController travelCostController;
  final TextEditingController addressController;
  final TextEditingController phoneNumberController;
  final TextEditingController emailController;
  final TextEditingController passController;

  @override
  Widget build(BuildContext context) {
    String profilePhoto = '';
    CubitClass cub = CubitClass.get(context);
    return BlocConsumer<CubitClass, AppState>(
      listener: (context, state) {
        if (state is SalaryCalculated) {
          totalSalaryController.text = state.totalSalary.toStringAsFixed(2);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Update Details',
              style: TextStyle(fontSize: 22),
            ),
            centerTitle: false,
            actions: [
              TextButton(
                  onPressed: () {
                    String uid = model.uid!;
                    var firestore = FirebaseFirestore.instance;
                    firestore.collection('users').doc(uid).update({
                      'dailyTravelCost':travelCostController.text,
                      'name': nameController.text,
                      'bsn': bsnController.text,
                      'position': positionController.text,
                      'maritalStatus': maritalStatusController.text,
                      'bankAccountIBAN': bankAccountIBANController.text,
                      'idNumber': idNumberController.text,
                      'address': addressController.text,
                      'phoneNumber': phoneNumberController.text,
                      'dob': dobController.text,
                      // تحديث حقل تاريخ الميلاد
                      'depart': departController.text,
                      // تحديث حقل القسم
                      'contractStartDate': contractStartDateController.text,
                      // تحديث حقل بداية العقد
                      'contractLastDate': contractLastDateController.text,
                      // تحديث حقل نهاية العقد
                      'hourlyRate': hourlyRateController.text,
                      // تحديث حقل سعر الساعة
                      'weeklyHours': weeklyHoursController.text,
                      // تحديث حقل ساعات العمل الأسبوعية
                      'taxes': taxesController.text,
                      // تحديث حقل الضرائب
                      'totalSalary': totalSalaryController.text,
                      // تحديث حقل الراتب الإجمالي
                      'healthInsurance': healthInsuranceController.text,
                      // تحديث حقل التأمين الصحي
                    }).then((e) async { await cub.getAllUsers().then((e){
                      Navigator.pop(context);
                    });
                      });
                    // تحديث حقل الراتب الشهري
                  },
                  child: const Text(
                    'Update',
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  profilePhoto!='' ?  CircleAvatar(
                    backgroundImage: NetworkImage(
                        profilePhoto ),
                    radius: 70,
                    foregroundColor: Colors.blue,
                  ):const SizedBox(),
                  const SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          _defaultField(
                            labelColor:
                                cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: emailController,
                            labelText: 'Email',
                            prefixIcon: const Icon(
                              Icons.mail,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                          _defaultField(
                            labelColor:
                                cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: passController,
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
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {
                                navigatorTo(context,  UploadContract(model: model,));
                              },
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
                              onPressed: () {
                                    navigatorTo(context,  UploadIdentity(model:model));
                              },
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
                              onPressed: () {
                                cub.pickSingleFile(uid: model.uid!, field: 'profile photo').then((e){
                                  profilePhoto = e! ;
                                  FirebaseFirestore.instance.collection('users').doc(model.uid!).update({'profilePhoto':e});
                                });
                              },
                              height: 50,
                              color: Colors.blue,
                              child: const Row(
                                children: [
                                  Icon(Icons.photo),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Upload Profile photo'),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () async {
                                final DateTime? pickedDate =
                                    await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2010),
                                  lastDate: DateTime.now(),
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return Theme(
                                      data: ThemeData.light().copyWith(
                                        colorScheme: const ColorScheme.light(
                                          primary: Colors
                                              .blue, // تعيين لون الزر الرئيسي هنا
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );
                                if (pickedDate != null) {
                                  String date =
                                      '${pickedDate.year}/${pickedDate.month}/${pickedDate.day}';
                                  contractStartDateController.text = date;
                                }
                              },
                              height: 50,
                              color: Colors.blue,
                              child: const Row(
                                children: [
                                  Icon(Icons.calendar_today),
                                  SizedBox(width: 8),
                                  Text('Select Start Date'),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () async {
                                final DateTime? pickedDate =
                                    await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2050),
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return Theme(
                                      data: ThemeData.light().copyWith(
                                        colorScheme: const ColorScheme.light(
                                          primary: Colors
                                              .blue, // تعيين لون الزر الرئيسي هنا
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );
                                if (pickedDate != null) {
                                  String date =
                                      '${pickedDate.year}/${pickedDate.month}/${pickedDate.day}';
                                  contractLastDateController.text = date;
                                }
                              },
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
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                              onPressed: () async {
                                final DateTime? pickedDate =
                                    await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1960),
                                  lastDate: DateTime.now(),
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return Theme(
                                      data: ThemeData.light().copyWith(
                                        colorScheme: const ColorScheme.light(
                                          primary: Colors
                                              .blue, // تعيين لون الزر الرئيسي هنا
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );
                                if (pickedDate != null) {
                                  String date =
                                      '${pickedDate.year}/${pickedDate.month}/${pickedDate.day}';
                                  dobController.text = date;
                                }
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
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container(
                                    height: 100,
                                    width: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: InkWell(
                                              onTap: () {
                                                maritalStatusController.text =
                                                    'Married';
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8),
                                                width: double.infinity,
                                                child: const Text(
                                                  'Married',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: InkWell(
                                              onTap: () {
                                                maritalStatusController.text =
                                                    'Not Married';
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8),
                                                child: const Text(
                                                  'Not Married',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
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
                          departController.text.isEmpty
                              ? Expanded(
                            child: MaterialButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container(
                                    height: 500,
                                    width: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        _buildDepartmentOption('HR', context),
                                        _buildDepartmentOption('Finance', context),
                                        _buildDepartmentOption('IT', context),
                                        _buildDepartmentOption('Marketing', context),
                                        _buildDepartmentOption('Sales', context),
                                        _buildDepartmentOption('Customer Service', context),
                                        _buildDepartmentOption('Security', context),
                                        _buildDepartmentOption('Cleaning', context),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              height: 50,
                              color: Colors.blue,
                              child: const Row(
                                children: [
                                  Icon(Icons.business_center),
                                  SizedBox(width: 8),
                                  Text('Select Department'),
                                ],
                              ),
                            ),
                          )
                              :const SizedBox(),
                          const SizedBox(
                            width: 20,
                          ),
                          departController.text.isNotEmpty
                              ? Expanded(
                            child: MaterialButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container(
                                    height: 500,
                                    width: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: _buildPositionOptions(departController.text, positionController, context),
                                    ),
                                  ),
                                );
                              },
                              height: 50,
                              color: Colors.blue,
                              child: const Row(
                                children: [
                                  Icon(Icons.business_center),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Select Position'),
                                ],
                              ),
                            ),
                          )
                              : const SizedBox(),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {
                                navigatorTo(context,  UploadQualification(model : model));
                              },
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
                            labelColor:
                                cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: nameController,
                            labelText: 'Full Name',
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                          _defaultField(
                            readOnly: true,
                            labelColor:
                                cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: dobController,
                            labelText: 'Date of Birth',
                            prefixIcon: const Icon(
                              Icons.calendar_today,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                          _defaultField(
                            labelColor:
                                cub.isDark ? Colors.white : Colors.black,
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
                            labelColor:
                                cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: idNumberController,
                            labelText: 'ID Number',
                            prefixIcon: const Icon(
                              Icons.format_list_numbered,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                          _defaultField(
                            labelColor:
                                cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: addressController,
                            labelText: 'Address',
                            prefixIcon: const Icon(
                              Icons.home_filled,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                          _defaultField(
                            readOnly: true,
                            labelColor:
                                cub.isDark ? Colors.white : Colors.black,
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
                            readOnly: true,
                            labelColor:
                                cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: departController,
                            labelText: 'depart',
                            prefixIcon: const Icon(
                              Icons.work,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                          _defaultField(
                            readOnly: true,
                            labelColor:
                                cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: positionController,
                            labelText: 'Position',
                            prefixIcon: const Icon(
                              FontAwesomeIcons.helmetSafety,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                          _defaultField(
                            labelColor:
                                cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: bankAccountIBANController,
                            labelText: 'Bank Account IBAN',
                            prefixIcon: const Icon(
                              Icons.account_balance,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          _defaultField(
                            labelColor:
                                cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: phoneNumberController,
                            labelText: 'Phone Number',
                            prefixIcon: const Icon(
                              Icons.phone,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                          _defaultField(
                            readOnly: true,
                            labelColor:
                                cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: contractStartDateController,
                            labelText: 'Contract Start Date',
                            prefixIcon: const Icon(
                              Icons.calendar_today,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                          _defaultField(
                            readOnly: true,
                            labelColor:
                                cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: contractLastDateController,
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
                            labelColor:
                                cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: taxesController,
                            labelText: 'Taxes',
                            prefixIcon: const Icon(
                              Icons.attach_money,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                          _defaultField(
                            textInputType: TextInputType.number,
                            onChange: (value) {
                              double hourlyRate = double.tryParse(value) ?? 0.0;
                              double weeklyHours =
                                  double.tryParse(weeklyHoursController.text) ??
                                      0.0;
                              cub.calculateSalary(hourlyRate, weeklyHours);
                            },
                            labelColor:
                                cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: hourlyRateController,
                            labelText: 'Hourly Rate',
                            prefixIcon: const Icon(
                              Icons.attach_money,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                          _defaultField(
                            textInputType: TextInputType.number,
                            onChange: (value) {
                              double hourlyRate =
                                  double.tryParse(hourlyRateController.text) ??
                                      0.0;
                              double weeklyHours =
                                  double.tryParse(value) ?? 0.0;
                              cub.calculateSalary(hourlyRate, weeklyHours);
                            },
                            labelColor:
                                cub.isDark ? Colors.white : Colors.black,
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
                            textInputType: TextInputType.number,
                            readOnly: true,
                            labelColor:
                                cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: totalSalaryController,
                            labelText: 'Total Salary',
                            prefixIcon: const Icon(
                              Icons.account_balance_wallet,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                          _defaultField(
                            labelColor:
                                cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: healthInsuranceController,
                            labelText: 'Health Insurance',
                            prefixIcon: const Icon(
                              Icons.medical_services,
                              color: Color(0xFF7FFFD4),
                            ),
                          ),
                          _defaultField(
                            labelColor:
                                cub.isDark ? Colors.white : Colors.black,
                            context: context,
                            controller: travelCostController,
                            labelText: 'Daily Travil Cost',
                            prefixIcon: const Icon(
                              Icons.bus_alert_sharp,
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
    void Function(String)? onChange,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          onChanged: onChange,
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

  Widget _buildDepartmentOption(String department, BuildContext context) {
    return Expanded(
      child: Center(
        child: InkWell(
          onTap: () {
            departController.text = department;
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            width: double.infinity,
            child: Text(
              department,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPositionOptions(String department,
      TextEditingController positionController, BuildContext context) {
    List<String> positions;

    switch (department) {
      case 'HR':
        positions = [
          'Recruitment Manager',
          'Training and Development Manager',
          'Payroll and Benefits Officer',
        ];
        break;
      case 'Finance':
        positions = [
          'Financial Analyst',
          'Accountant',
          'Auditor',
        ];
        break;
      case 'IT':
        positions = [
          'IT Manager',
          'Software Engineer',
          'Network Administrator',
        ];
        break;
      case 'Marketing':
        positions = [
          'Marketing Manager',
          'Content Strategist',
          'SEO Specialist',
        ];
        break;
      case 'Sales':
        positions = [
          'Sales Manager',
          'Account Executive',
          'Sales Representative',
        ];
        break;
      case 'Customer Service':
        positions = [
          'Customer Service Manager',
          'Support Specialist',
          'Customer Service Representative',
        ];
        break;
      case 'Security':
        positions = [
          'Security Manager',
          'Security Supervisor',
          'Security Guard',
        ];
        break;
      case 'Cleaning':
        positions = [
          'Cleaning Supervisor',
          'Janitor',
          'Cleaning Staff',
        ];
        break;
      default:
        positions = ['Head of Department', 'Supervisor', 'Worker'];
    }

    return positions
        .map((position) => Expanded(
              child: Center(
                child: InkWell(
                  onTap: () {
                    positionController.text = position;
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    width: double.infinity,
                    child: Text(
                      position,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ))
        .toList();
  }
}
