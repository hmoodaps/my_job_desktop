import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/components.dart';
import 'app_states.dart';

class CubitClass extends Cubit<AppState> {
  CubitClass() : super(InitCubit());

  //to create instance from the cubit class====================================================================================
  static CubitClass get(context) => BlocProvider.of<CubitClass>(context);

  //toggle between light and dark mode depending on the device mode====================================================================================
  ThemeData? themeData = light;
  bool isDark = false;

  ThemeData? toggleLightAndDark(context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    brightness == Brightness.dark
        ? (themeData = dark, isDark = true)
        : (themeData = light, isDark = false);
    emit(ToggleLightAndDark());
    return themeData;
  }
}
