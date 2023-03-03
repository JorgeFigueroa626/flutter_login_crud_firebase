

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app_login/main.dart';
import 'package:my_app_login/src/model/my_user.dart';
import 'package:my_app_login/src/repository/my_user_repository.dart';
import 'package:my_app_login/src/ui/home_creen.dart';

const _myUser1 = MyUser(id: '111', name: 'Yoyo', lastName: 'Soles', age: 23);
const _myUser2 = MyUser(id: '222', name: 'Jorh', lastName: 'Lunares', age: 10);

class _MockMyUserRepo extends Mock implements MyUserRepository {}

void main() {
  late _MockMyUserRepo mockRepo;

  setUp(() async {
    await getIt.reset();
    mockRepo = _MockMyUserRepo();
    getIt.registerSingleton<MyUserRepository>(mockRepo);
  });

  Widget getMaterialApp(){
    return const MaterialApp(
      home: HomeScreen(),
    );
  }

  testWidgets(
      'Empty list when repository returns 0 users',
          (WidgetTester tester) async {
        when(() => mockRepo.getMyUsers()).thenAnswer((_) {
          return Stream.fromIterable([]);
        });

        await tester.pumpWidget(getMaterialApp());
        await tester.pumpAndSettle();

        expect(find.byType(Card), findsNothing);
      });

  testWidgets(
      'Two items in the list when repository returns 2 users',
          (WidgetTester tester) async {
        when(() => mockRepo.getMyUsers()).thenAnswer((_) {
          return Stream.fromIterable([[_myUser1, _myUser2]]);
        });

        await tester.pumpWidget(getMaterialApp());
        await tester.pumpAndSettle();

        expect(find.byType(Card), findsNWidgets(2));
      });
}
