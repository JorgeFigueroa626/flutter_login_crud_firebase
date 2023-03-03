
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app_login/main.dart';
import 'package:my_app_login/src/repository/auth_repository.dart';

enum AuthState{
  initial,
  signedOut,
  signedIn,
}

class AuthCubit extends Cubit<AuthState>{
  final AuthRepository _authRepository = getIt();
  StreamSubscription? _authSubscription;

  AuthCubit() : super(AuthState.initial);

  Future<void> init() async{
    _authSubscription =
        _authRepository.onAuthStateChanged.listen(_authStateChanged);
  }
  ///PREGUNTA SI LA SESSION ESTA CERRADA O INICIADA, SINO ES NULO
  void _authStateChanged(String? userUID){
    userUID == null ? emit(AuthState.signedOut) : emit(AuthState.signedIn);
  }

  ///CERRAR LA SESSION
  Future<void> signOut() async{
    await _authRepository?.signOut();
    emit(AuthState.signedOut);
  }

  ///CANCELA LA SUBCRIPCION
  Future<void> close(){
    _authSubscription?.cancel();
    return super.close();
  }

}