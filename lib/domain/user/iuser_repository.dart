import 'package:calaton_firebase_auth/domain/user/iuser.dart';

abstract class IUserRepository {
  Future<IUser?> singUp(String email, String password);

  Future<void> logOut();

  Future<bool> isSignedIn();

  Future<void> verifyPhoneNumber(String phoneNumber);
}
