import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app_login/src/cubits/auth_cubit.dart';
import 'package:my_app_login/src/navegation/routes.dart';
import 'package:my_app_login/src/ui/spash_creen.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
        listener: (context, state){
          if(state == AuthState.signedOut){
              _navigatorKey.currentState?.pushNamedAndRemoveUntil(Routes.intro, (r) => false);
          }else if(state == AuthState.signedIn){
            _navigatorKey.currentState?.pushNamedAndRemoveUntil(Routes.home, (r) => false);
          }
    },
        child: MaterialApp(
          navigatorKey: _navigatorKey,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: Routes.routes,
        ),
    );
  }
}
