
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:my_app_login/main.dart';
import 'package:my_app_login/src/app.dart';
import 'package:my_app_login/src/cubits/auth_cubit.dart';
import 'package:my_app_login/src/repository/auth_repository.dart';
import 'package:my_app_login/src/repository/my_user_repository.dart';
import 'package:my_app_login/src/ui/home_creen.dart';
import 'package:my_app_login/src/ui/intro_creen.dart';
import 'package:my_app_login/src/ui/spash_creen.dart';

class _MockAuthRepo extends Mock implements AuthRepository {}

class _MockMyUserRepo extends Mock implements MyUserRepository {}

Stream<String> get loggedUserStream => Stream.fromIterable(['someUserID']);

void main() {
  late _MockAuthRepo mockRepo;
  late _MockMyUserRepo mockUserRepo;

  setUp(() async {
    await getIt.reset();

    mockRepo = _MockAuthRepo();
    mockUserRepo = _MockMyUserRepo();
    
    when(() => mockUserRepo.getMyUsers())
      .thenAnswer((_) => Stream.fromIterable([]));
    
    getIt.registerSingleton<AuthRepository>(mockRepo);
    getIt.registerSingleton<MyUserRepository>(mockUserRepo);
  });

  Widget getMyApp(){
    return BlocProvider(
      create: (_) => AuthCubit()..init(),
      child: const MyApp(),
    );
  }

  testWidgets(
      'Intro screen will be  shown after splash when the user is not logged in',
          (WidgetTester tester) async {
          final stream = Stream.fromIterable([null]);
          when(() => mockRepo.onAuthStateChanged).thenAnswer((_) => stream);

          await tester.pumpWidget(getMyApp());
          await tester.pump();
          expect(find.byType(SplashScreen), findsOneWidget);

          await tester.pumpAndSettle();
          expect(find.byType(IntroScreen), findsOneWidget);
          });

  testWidgets(
      'Home screen will be shown after splash when the user is logged in',
          (WidgetTester tester) async {
        when(() => mockRepo.onAuthStateChanged).thenAnswer((_) => loggedUserStream);

        await tester.pumpWidget(getMyApp());
        await tester.pump();
        expect(find.byType(SplashScreen), findsOneWidget);

        await tester.pumpAndSettle();
        expect(find.byType(HomeScreen), findsOneWidget);
          });

  testWidgets(
      'Pressing logout will return to the IntroScreen',
          (WidgetTester tester) async {
        when(() => mockRepo.onAuthStateChanged).thenAnswer((_) => loggedUserStream);
        when(() => mockRepo.signOut()).thenAnswer((_) async{});

        await tester.pumpWidget(getMyApp());
        await tester.pumpAndSettle();

        expect(find.byType(HomeScreen), findsOneWidget);

        await tester.tap(find.byKey(const Key('Logout')));
        await tester.pumpAndSettle();

        expect(find.byType(IntroScreen), findsOneWidget);
          });
}