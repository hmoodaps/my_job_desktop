import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:my_job_desktop/components/components.dart';
import 'package:my_job_desktop/cubit/app_states.dart';
import 'package:my_job_desktop/cubit/cubit.dart';
import 'package:my_job_desktop/screens/update_employee.dart';

class AddEmployee extends StatelessWidget {
  AddEmployee({super.key});


  final emailController = TextEditingController();
  final passController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController travelCostController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController bsnController = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();
  final TextEditingController maritalStatusController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController departController = TextEditingController();
  final TextEditingController bankAccountIBANController = TextEditingController();
  final TextEditingController contractStartDateController = TextEditingController();
  final TextEditingController contractLastDateController = TextEditingController();
  final TextEditingController hourlyRateController = TextEditingController();
  final TextEditingController weeklyHoursController = TextEditingController();
  final TextEditingController taxesController = TextEditingController();
  final TextEditingController totalSalaryController = TextEditingController();
  final TextEditingController healthInsuranceController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    CubitClass cub = CubitClass.get(context);
    return BlocConsumer<CubitClass, AppState>(
      listener: (context, state) {
      },
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
          ),
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
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
               const SizedBox(height: 50,),
                Center(
                  child: InkWell(
                    onTap: (){
                          cub.addUser(
                            password: passController.text,
                            email: emailController.text, context: context,
                          ).then((e){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UpdateEmployee(model: e ,nameController: nameController,
                              dobController: dobController,
                              bsnController: bsnController,
                              idNumberController: idNumberController,
                              maritalStatusController: maritalStatusController,
                              positionController: positionController,
                              departController: departController,
                              bankAccountIBANController: bankAccountIBANController,
                              contractStartDateController: contractStartDateController,
                              contractLastDateController: contractLastDateController,
                              hourlyRateController: hourlyRateController,
                              weeklyHoursController: weeklyHoursController,
                              taxesController: taxesController,
                              totalSalaryController: totalSalaryController,
                              healthInsuranceController: healthInsuranceController,
                              addressController: addressController,
                              phoneNumberController: phoneNumberController,
                              emailController: emailController,
                              passController: passController, travelCostController:travelCostController ,
                            )));

                          });
                          },

                    child: Container(
                      height: 70,
                      width: 200,
                      decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(20)),
                      child: const Center(child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                        Text('Next'),
                        SizedBox(width: 8,),
                        Icon(IconlyBroken.arrow_right_2),
                      ],),),
                    ),
                  ),
                ),
              ],
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
    return Padding(
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
    );
  }
}
