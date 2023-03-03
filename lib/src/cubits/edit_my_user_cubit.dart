
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app_login/main.dart';
import 'package:my_app_login/src/model/my_user.dart';
import 'package:my_app_login/src/repository/my_user_repository.dart';


///CREAMOS UNA CLASE PARA EDITAR EL USUARIO
class EditMyUserCubit extends Cubit<EditMyUserState>{
  final MyUserRepository _userRepository = getIt();

  MyUser? _toEdit;

  EditMyUserCubit(this._toEdit) : super(const EditMyUserState());

  void setImage(File? imageFile) async {
    emit(state.copyWith(pickedImage: imageFile));
  }

  Future<void> saveMyUser(
      String name,
      String lastName,
      int age,
      ) async {
    emit(state.copyWith(isLoading: true));

    final uid = _toEdit?.id ?? _userRepository.newId();
    _toEdit = MyUser(
        id: uid,
        name: name,
        lastName: lastName,
        age: age,
        image: _toEdit?.image);

    await _userRepository.saveMyUser(_toEdit!, state.pickedImage);
    emit(state.copyWith(isDone: true));
  }

  Future<void> deleteMyUser() async{
    emit(state.copyWith(isLoading: true));
    if (_toEdit != null) {
      await _userRepository.deleteMyUser(_toEdit!);
    }
    emit(state.copyWith(isDone: true));
  }

}


class EditMyUserState extends Equatable{
  final File? pickedImage;
  final bool isLoading;

  final bool isDone;

  const EditMyUserState({
    this.pickedImage,
   this.isLoading = false,
   this.isDone = false,

  });

  @override
  List<Object?> get props => [pickedImage?.path, isLoading, isDone];

  EditMyUserState copyWith({
    File? pickedImage,
    bool? isLoading,
    bool? isDone,
  }){
    return EditMyUserState(
      pickedImage: pickedImage ?? this.pickedImage,
      isLoading: isLoading ?? this.isLoading,
      isDone: isDone ?? this.isDone,
    );
  }

}