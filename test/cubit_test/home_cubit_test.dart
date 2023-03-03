
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app_login/main.dart';
import 'package:my_app_login/src/cubits/home_cubit.dart';
import 'package:my_app_login/src/model/my_user.dart';
import 'package:my_app_login/src/repository/my_user_repository.dart';

const _myUser1 = MyUser(id: '111', name: 'Juan', lastName: 'Sol', age: 25);
const _myUser2 = MyUser(id: '222', name: 'Jose', lastName: 'Luna', age: 30);

class MockMyUserRepo extends Mock implements MyUserRepository{}

 void main() {
    late MockMyUserRepo mockRepo;
    setUp(() async{
      await getIt.reset();
      mockRepo = MockMyUserRepo();
      getIt.registerSingleton<MyUserRepository>(mockRepo);
    });

    blocTest<HomeCubit, HomeState>(
        'Two users will be emitted correctly',
        build: (){
          when(() => mockRepo.getMyUsers()).thenAnswer((_){
            return Stream.fromIterable([
              [_myUser1,_myUser2]
            ]);
          });
          return HomeCubit();
        },
      act: (cubit) => cubit.init(),
      expect: () =>[
        const HomeState(
          isLoading: false,
          myUsers: [_myUser1,_myUser2],
        )
      ],
    );
  }
