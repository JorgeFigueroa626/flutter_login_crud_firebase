import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app_login/firebase_options.dart';
import 'package:my_app_login/src/app.dart';
import 'package:my_app_login/src/cubits/auth_cubit.dart';
import 'package:my_app_login/src/data_source/firebase_data_source.dart';
import 'package:my_app_login/src/model/my_user.dart';
import 'package:my_app_login/src/repository/auth_repository.dart';
import 'package:my_app_login/src/repository/implementation/auth_repository.dart';
import 'package:my_app_login/src/repository/implementation/my_user_repository.dart';
import 'package:my_app_login/src/repository/my_user_repository.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await injectDependencies();

  runApp(
    BlocProvider(
      create: (_) => AuthCubit()..init(),
     child: const MyApp(),
    ),
  );
}

Future<void> injectDependencies() async{
  getIt.registerLazySingleton(() => FirebaseDataSource());
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp());
  getIt.registerLazySingleton<MyUserRepository>(() => MyUserRepositoryImp());
}