import 'package:calaton_firebase_auth/domain/user/iuser.dart';

import '../../../domain/user/iuser_repository.dart';
import '../../common/base_change_notifier.dart';
import '../../routing/inavigation_util.dart';

class LoginViewModel extends BaseChangeNotifier {
  final IUserRepository _userRepository;
  final INavigationUtil _navigationUtil;

  LoginViewModel(
      {required IUserRepository userRepository,
      required INavigationUtil navigationUtil})
      : _userRepository = userRepository,
        _navigationUtil = navigationUtil;
  String _emailValue = '';
  String _passwordValue = '';
  String _phoneNumber = '';
  String _codeFromSms = '';

  void updateEmailValue(String value) {
    _emailValue = value;
  }

  void updatePasswordValue(String value) {
    _passwordValue = value;
  }

  void updatePhone(String value) {
    _phoneNumber = value;
  }

  void updateCodeFromSms(String value) {
    _codeFromSms = value;
  }

  Future<void> onLoginViaEmailPressed() async {
    startLoading();
    IUser? user = await _userRepository.singUp(_emailValue, _passwordValue);
    stopLoading();
  }

  Future<void> onLoginViaPhonePressed() async {
    startLoading();
    if (_phoneNumber.isNotEmpty) {
      await _userRepository.verifyPhoneNumber(_phoneNumber);
    }
    stopLoading();
  }

  Future<void> sendOtpCode() async {
    startLoading();
    if (_codeFromSms.isNotEmpty) {
      await _userRepository.sendOtp(_codeFromSms);
    }
    stopLoading();
  }
}
