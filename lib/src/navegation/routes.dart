import 'package:flutter/material.dart';
import 'package:my_app_login/src/ui/edit_my_user_screen.dart';
import 'package:my_app_login/src/ui/home_creen.dart';
import 'package:my_app_login/src/ui/intro_creen.dart';
import 'package:my_app_login/src/ui/spash_creen.dart';

class Routes{
  static const splash = '/';
  static const intro = '/intro';
  static const home = '/home';
  static const editUser = '/editUser';

  static Route routes(RouteSettings settings){

    MaterialPageRoute buildRoute(Widget widget){
    return MaterialPageRoute(builder: (_) => widget, settings: settings);
  }

  switch (settings.name){
    case splash:
      return buildRoute(const SplashScreen());
    case intro:
      return buildRoute(const IntroScreen());
    case home:
      return buildRoute(const HomeScreen());
    case editUser:
      return buildRoute(const EditMyUserScreen());
    default:
      throw Exception ('Route does not exists');


  }
  }
}