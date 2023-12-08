import 'package:calaton_firebase_auth/data/model/user.dart' as prefix;
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/user/iuser.dart';
import '../../domain/user/iuser_repository.dart';

class UserRepository implements IUserRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  UserRepository();

  String verificationId = "";

  @override
  Future<void> logOut() async {
    return await _firebaseAuth.signOut();
  }

  @override
  Future<IUser?> singUp(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        return prefix.User(
            email: userCredential.user!.email ?? 'no email',
            id: userCredential.user!.uid);
      }
      return null;
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _firebaseAuth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        this.verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Future<void> sendOtp(String otpCode) async {
    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otpCode);
      await _firebaseAuth.signInWithCredential(phoneAuthCredential);
    } catch(e){
      print(e);
    }
  }
}
