import 'dart:io';

import 'package:my_app_login/src/model/my_user.dart';

abstract class MyUserRepository{
  String newId();

  Stream<Iterable<MyUser>> getMyUsers();

  Future<void> saveMyUser(MyUser myUser, File? image);

  Future<void> deleteMyUser(MyUser myUser);
}