import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/user_model.dart';
import '../components/components.dart';
import 'app_states.dart';

class CubitClass extends Cubit<AppState> {
  CubitClass() : super(InitCubit());

  //to create instance from the cubit class====================================================================================
  static CubitClass get(context) => BlocProvider.of<CubitClass>(context);

  //toggle between light and dark mode depending on the device mode====================================================================================
  ThemeData? themeData = light;
  bool isDark = false;
  IconData darkAndLightIcon = Icons.dark_mode_outlined;
  bool isAdmin = false;

  bool isLogin = false;

  String? messageIfHeIsNotAdmin;


  ThemeData? toggleLightAndDark(context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    brightness == Brightness.dark
        ? (themeData = dark, isDark = true)
        : (themeData = light, isDark = false);
    emit(ToggleLightAndDark());
    return themeData;
  }
//login to firebase
  login({required String email, required String password , required BuildContext context}) async {
    try {
      emit(Login());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
            //check if the admin is login from the desktop
        if (FirebaseAuth.instance.currentUser!.uid ==
            'OJ0dhdwVB1UbfE3aFC0pobxGl412') {
          isLogin = true;
          isAdmin = true;
          emit(LoginSuccess());
          //if the login success but its not the admin
        } else if (FirebaseAuth.instance.currentUser!.uid !=
            'OJ0dhdwVB1UbfE3aFC0pobxGl412') {
          isLogin = true;
          isAdmin = false;
          emit(LoginFailed());
        }
      }).catchError((e) {
        if (kDebugMode) {
          print('error while long in \n $e');
          emit(LoginError());
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print('error while long in \n $e');
        emit(LoginError());

      }
    }
  }

  void addUser({
    required String password,
    required String email,
    required BuildContext context,
    required String? name,
    required String? bsn,
    required double? hourlyRate,
    required double? weeklyHours,
    required String? position,
    required DateTime? startDate,
    required String? idNumber,
    required DateTime? contractEndDate,
    double ? healthInsurance,
    double? taxes,
    double? hoursLastWeek,
    double? hoursMissedLastWeek,
    int ? daysMissedLastWeek,
    double? salaryLastMonth,
    String? maritalStatus,
    DateTime? dob,
    String? address,
    String? phoneNumber,
    String? bankAccountIBAN,
    double? overtimeHoursLastWeek,
    String? idPhoto,
    String? passportPhoto,
    String? profilePhoto,
    double? dailyTravelCost,
  }) {
    emit(AddUser());
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        String uid = value.user!.uid;
        createUser(
          uid: uid,
          password: password,
          email: email,
          name: name,
          bsn: bsn,
          hourlyRate: hourlyRate,
          weeklyHours: weeklyHours,
          position: position,
          startDate: startDate,
          idNumber: idNumber,
          contractEndDate: contractEndDate,
          healthInsurance: healthInsurance,
          taxes: taxes,
          hoursLastWeek: hoursLastWeek,
          hoursMissedLastWeek: hoursMissedLastWeek,
          daysMissedLastWeek: daysMissedLastWeek,
          salaryLastMonth: salaryLastMonth,
          maritalStatus: maritalStatus,
          dob: dob,
          address: address,
          phoneNumber: phoneNumber,
          bankAccountIBAN: bankAccountIBAN,
          overtimeHoursLastWeek: overtimeHoursLastWeek,
          idPhoto: idPhoto,
          passportPhoto: passportPhoto,
          profilePhoto: profilePhoto,
          dailyTravelCost: dailyTravelCost,
          context: context,
        );
      }).catchError((e) {
        Navigator.pop(context);
        if (kDebugMode) {
          print(e.toString());
        }
        emit(AddUserError(e.toString()));
      });
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (kDebugMode) {
        print(e.toString());
      }
      emit(AddUserError(e.toString()));
    }
  }

  void createUser({
    required String email,
    required BuildContext context,
    required String? name,
    required String? bsn,
    required double? hourlyRate,
    required double? weeklyHours,
    required String? position,
    required DateTime? startDate,
    required String? idNumber,
    required DateTime? contractEndDate,
    double ? healthInsurance,
    required String ? uid,
    required String ? password,
    double? taxes,
    double? hoursLastWeek,
    double? hoursMissedLastWeek,
    int ? daysMissedLastWeek,
    double? salaryLastMonth,
    String? maritalStatus,
    DateTime? dob,
    String? address,
    String? phoneNumber,
    String? bankAccountIBAN,
    double? overtimeHoursLastWeek,
    String? idPhoto,
    String? passportPhoto,
    String? profilePhoto,
    double? dailyTravelCost,
  }) async {
    emit(CreateUser());
    UserModel model = UserModel(
      uid: uid,
      password: password,
      name: name ?? 'no name yet',
      bsn: bsn ?? 'no BSN yet',
      hourlyRate: hourlyRate ?? 0.0,
      weeklyHours: weeklyHours ?? 0.0,
      taxes: taxes ?? 0.0,
      basicSalary: (hourlyRate! * (weeklyHours! / 5) * 22),
      hoursLastWeek: hoursLastWeek ?? 0.0,
      hoursMissedLastWeek: hoursMissedLastWeek ?? 0.0,
      daysMissedLastWeek: daysMissedLastWeek ?? 0,
      salaryLastMonth: salaryLastMonth ?? 0.0,
      maritalStatus: maritalStatus ?? 'unknown',
      position: position ?? 'unknown',
      dob: dob ?? DateTime(2000, 1, 1),
      startDate: startDate ?? DateTime(2000, 1, 1),
      address: address ?? 'no Address yet',
      phoneNumber: phoneNumber ?? 'no Phone Number yet',
      email: email,
      idNumber: idNumber ?? 'no ID Number yet',
      bankAccountIBAN: bankAccountIBAN ?? 'no IBAN yet',
      contractEndDate: contractEndDate ?? DateTime(2000, 1, 1),
      overtimeHoursLastWeek: overtimeHoursLastWeek ?? 0.0,
      healthInsurance: healthInsurance ?? 0.0,
      idPhoto: idPhoto ?? 'no ID Photo yet',
      passportPhoto: passportPhoto ?? 'no Passport Photo yet',
      profilePhoto: profilePhoto ?? 'no Profile Photo yet',
      dailyTravelCost: dailyTravelCost ?? 0.0,
    );
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set(model.toMap())
          .then((value) {
        getAllUsers();
        emit(CreateUserSuccess());
      }).catchError((e) {
        if (kDebugMode) {
          print(e.toString());
        }
        emit(CreateUserError(e.toString()));
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(CreateUserError(e.toString()));
    }
  }

  List<UserModel> allUsers = [];
  getAllUsers() async {
    allUsers.clear();
    await FirebaseFirestore.instance.collection('users').get().then((value) {
      for (var element in value.docs) {
        if (element.data()['uid'] != FirebaseAuth.instance.currentUser!.uid) {
          allUsers.add(UserModel.fromJson(element.data()));
          emit(SuccessGettingAllUser());
        }
      }
    }).catchError((error) {
      emit(ErrorGettingAllUser());
    });
  }
  Future<void> signOut(BuildContext context) async {
    emit(LoggingOut());
    await FirebaseAuth.instance.signOut().then((value) {
      isLogin = false;
      emit(LoggedOut());
    }).catchError((error) {
      emit(LogoutError(error.toString()));
    });
  }
  String selectedCategory = 'All'; // Default category

  void updateCategory(String category) {
    selectedCategory = category;
    emit(UpdateCategory(category));
  }

}
