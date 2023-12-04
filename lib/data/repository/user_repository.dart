import 'package:calaton_firebase_auth/data/model/user.dart' as prefix;
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/user/iuser.dart';
import '../../domain/user/iuser_repository.dart';


class UserRepository implements IUserRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  UserRepository();

  @override
  Future<void> logOut() async {
    return await _firebaseAuth.signOut();
  }

  @override
  Future<IUser?> singUp(String email, String password) async {
    try {
      var auth = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return prefix.User(email:'kek', id:"007");
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<bool> isSignedIn() async {
    var currentUser = _firebaseAuth.currentUser;
    if (currentUser == null) {
      print('user is null');
      return false;
    }
    if (currentUser.uid.isNotEmpty) {
      return true;
    } else {
      return false;
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
        String smsCode = '123456';
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);
        await _firebaseAuth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
