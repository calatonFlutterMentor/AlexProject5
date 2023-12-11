import 'package:calaton_firebase_auth/app/services/auth_service.dart';
import 'package:calaton_firebase_auth/domain/auth/iauth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthRepo2 implements IAuthRepo {
  final AuthService authService;

  AuthRepo2({required this.authService});

  Stream<UserAuthState> get authState => authService.authState();

  @override
  Future<void> signInBackend(String? s) async {

  }
}
