import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/user_model.dart';
import '../components/components.dart';
import '../models/basic_user_model.dart';
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
  login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      emit(Login());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        //check if the admin is login from the desktop
        if (FirebaseAuth.instance.currentUser!.uid ==
            '7sopgQyAVkQU5wDGx4DvNNnnmUs2') {
          isLogin = true;
          isAdmin = true;
          emit(LoginSuccess());
          //if the login success but its not the admin
        } else if (FirebaseAuth.instance.currentUser!.uid !=
            '7sopgQyAVkQU5wDGx4DvNNnnmUs2') {
          isLogin = true;
          isAdmin = false;
          emit(LoginFailed());
        }
      }).catchError((e) {
        if (kDebugMode) {
          print('2 error while long in \n ${e.toString()}');
          emit(LoginError(e.toString()));
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print(' 2 error while long in \n $e');
        emit(LoginError(e.toString()));
      }
    }
  }

  Future<UserModel> addUser({
    required String password,
    required String email,
    required BuildContext context,
  }) async {
    emit(AddUser());
    try {
      var userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel? model = await createUser(
        uid: userCredential.user?.uid,
        password: password,
        email: email,
      );
      BasicUserModel? basicUserModel = await createBasicUser(
        uid: userCredential.user?.uid,
        password: password,
        email: email,
      );

      return model;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(AddUserError(e.toString()));
      return UserModel(); // Return an empty UserModel or handle the error case
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(AddUserError(e.toString()));
      return UserModel(); // Return an empty UserModel or handle the error case
    }
  }

  Future<UserModel> createUser({
    required String email,
    required String? uid,
    required String? password,
  }) async {
    emit(CreateUser());
    UserModel model = UserModel(
      uid: uid,
      password: password,
      email: email,
    );
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set(model.toMap())
          .then((value) {
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
    return model;
  }
  Future<BasicUserModel> createBasicUser({
    required String email,
    required String? uid,
    required String? password,
  }) async {
    emit(CreateUser());
    BasicUserModel model = BasicUserModel(
      uid: uid,
      password: password,
      email: email,
    );
    try {
      await FirebaseFirestore.instance
          .collection('b.users')
          .doc(uid)
          .set(model.toMap())
          .then((value) {
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
    return model;
  }


  List<UserModel> allUsers = [];

  Future<void> getAllUsers() async {
    allUsers.clear();
    emit(GetAllUsers());
    try {
      var value = await FirebaseFirestore.instance.collection('users').get();
      for (var element in value.docs) {
        allUsers.add(UserModel.fromJson(element.data()));
      }
      print(allUsers.length.toString());
      emit(SuccessGettingAllUser()); // Emit success state after fetching
    } catch (error) {
      print('Error fetching users: $error');
      emit(ErrorGettingAllUser()); // Emit error state if fetching fails
    }
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

//Calculate Salary
  void calculateSalary(double hourlyRate, double weeklyHours) {
    double totalSalary = (hourlyRate * (weeklyHours / 5) * 22);
    emit(SalaryCalculated(totalSalary));
  }

  //pick file

  Future<String?> pickSingleFile({
    required String uid,
    required String field,
  }) async {
    emit(UploadFile());
    String? url;
    var result = await FilePicker.platform.pickFiles();
    print(result.toString());
    if (result != null) {
      url = await uploadFile(
          uid: uid, field: field, pickedFile: File(result.files.single.path!));
      emit(PickSingleFile());
    } else {
      emit(FilePickCancelled());
      return null;
    }
    return url;
  }

  Future<String?> pickPhoto({
    required String uid,
    required String field,
  }) async {
    emit(UploadPhoto());
    String? url;
    var result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    print(result.toString());
    if (result != null) {
      url = await uploadFile(
          uid: uid, field: field, pickedFile: File(result.files.single.path!));
      emit(PickSinglePhoto());
    } else {
      emit(PhotoPickCancelled());
      return null;
    }
    return url;
  }

  Future<String> uploadFile({
    required String uid,
    required String field,
    required File pickedFile,
  }) async {
    String? fileUrl;
    try {
      var snapshot = await FirebaseStorage.instance
          .ref(
              'users/$uid/$field/${Uri.file(pickedFile.path).pathSegments.last}')
          .putFile(pickedFile);

      var downloadUrl = await snapshot.ref.getDownloadURL();
      fileUrl = downloadUrl.toString();

      emit(UploadFileSuccess());
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(UploadFileFailed());
    }

    return fileUrl!;
  }

  Future<List<String>?> pickMultipleFiles({
    required String uid,
    required String field,
  }) async {
    emit(UploadFiles());
    List<String> urls = [];

    var result = await FilePicker.platform.pickFiles(allowMultiple: true);
    print(result.toString());

    if (result != null) {
      for (var file in result.files) {
        var url = await uploadFile(
            uid: uid, field: field, pickedFile: File(file.path!));
        urls.add(url);
      }
      emit(PickMultipleFiles());
    } else {
      emit(FilePickCancelled());
      return null;
    }

    return urls;
  }

  Future<void> deleteFile({
    required String downloadUrl,
  }) async {
    emit(DeleteFile());
    try {
      Reference ref = FirebaseStorage.instance.refFromURL(downloadUrl);
      await ref.delete();
      emit(DeleteFileSuccess());
    } catch (error) {
      if (kDebugMode) {
        print('Error deleting file: $error');
      }
      emit(DeleteFileFailed());
    }
  }
}
