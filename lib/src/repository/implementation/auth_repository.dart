
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app_login/src/repository/auth_repository.dart';

class AuthRepositoryImp extends AuthRepository{
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<String?> get onAuthStateChanged{
    return _firebaseAuth.authStateChanges().asyncMap((user) => user?.uid);
  }

  @override
  Future<void> signOut(){
    return _firebaseAuth.signOut();
  }
}