import 'package:calaton_firebase_auth/domain/user/iuser.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IUserRepository {
  Future<IUser?> singUp(String email, String password);

  Future<void> logOut();

  Future<void> verifyPhoneNumber(String phoneNumber);

  Future<void> sendOtp(String otpCode);

  Future<UserCredential> signInWithGoogle();
}
