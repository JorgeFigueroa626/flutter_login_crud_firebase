
import 'dart:io';

import 'package:my_app_login/main.dart';
import 'package:my_app_login/src/data_source/firebase_data_source.dart';
import 'package:my_app_login/src/model/my_user.dart';
import 'package:my_app_login/src/repository/my_user_repository.dart';

class MyUserRepositoryImp extends MyUserRepository{
  final FirebaseDataSource _fDataSource = getIt();

  @override
  Stream<Iterable<MyUser>> getMyUsers() {
    return _fDataSource.getMyUsers();
  }

  @override
  Future<void> saveMyUser(MyUser myUser, File? image) {
    return _fDataSource.saveMyUser(myUser, image);
  }

  @override
  Future<void> deleteMyUser(MyUser myUser) {
    return _fDataSource.deleteMyUser(myUser);
  }

  @override
  String newId() {
    return _fDataSource.newId();
  }





}