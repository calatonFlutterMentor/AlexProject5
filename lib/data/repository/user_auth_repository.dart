import 'package:calaton_firebase_auth/data/model/user.dart' as prefix;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../domain/user/iuser.dart';
import '../../domain/user/iuser_auth_repository.dart';

class UserAuthRepository implements IUserAuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  UserAuthRepository();

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
  Future<void> verifyPhoneNumber(String phoneNumber,
      Function(String verificationId) updateVerificationId) async {
    try {
      await _firebaseAuth
          .verifyPhoneNumber(
        timeout: const Duration(minutes: 1),
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          print(phoneNumber);
          await _firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          updateVerificationId(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print('time out');
        },
      )
          .onError((error, stackTrace) {
        print(error.toString());
      });
    } catch (error) {
      var a = 2;
      print(error);
    }
  }

  @override
  Future<void> sendOtp(String otpCode, String verificationId) async {
    try {
      print('otp:$otpCode');
      print('verificationId:$verificationId');
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otpCode);
      UserCredential? userCredential = await _firebaseAuth
          .signInWithCredential(phoneAuthCredential)
          .onError((error, stackTrace) {
        print('--------- ${error.toString()}');
        throw Exception();
      });
      print('authed user phone - ${userCredential.user?.phoneNumber}');
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await _firebaseAuth.signInWithCredential(credential);
  }
}
