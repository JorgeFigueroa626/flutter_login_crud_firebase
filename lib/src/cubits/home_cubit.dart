

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app_login/main.dart';
import 'package:my_app_login/src/model/my_user.dart';
import 'package:my_app_login/src/repository/my_user_repository.dart';

class HomeCubit extends Cubit<HomeState>{
  final MyUserRepository _userRepository = getIt();
  StreamSubscription? _streamSubscription;

  HomeCubit() : super(const HomeState());

  Future<void> init() async {
    _streamSubscription = _userRepository.getMyUsers().listen(myUserListen);
  }

  void myUserListen(Iterable<MyUser> myUsers) async{
    emit(HomeState(
      isLoading: false,
      myUsers: myUsers,
    ));
  }

  @override
  Future<void> close(){
    _streamSubscription?.cancel();
    return super.close();
  }
}

class HomeState extends Equatable{
  final bool isLoading;
  final Iterable<MyUser> myUsers;

  const HomeState({
    this.isLoading = true,
    this.myUsers = const [],
  });

  @override
  List<Object?> get props => [isLoading, myUsers];

}