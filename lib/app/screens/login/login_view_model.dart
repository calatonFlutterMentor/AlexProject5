import 'package:calaton_firebase_auth/app/routing/route_constants.dart';
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

  void updateEmailValue(String value) {
    _emailValue = value;
  }

  void updatePasswordValue(String value) {
    _passwordValue = value;
  }

  void updatePhone(String value) {
    _phoneNumber = value;
  }

  Future<void> onLogInButtonPressed() async {
    startLoading();
    IUser? user = await _userRepository.singUp(_emailValue, _passwordValue);
    if (_phoneNumber.isNotEmpty) {
      await _userRepository.verifyPhoneNumber(_phoneNumber);
    }
    stopLoading();
    // _navigationUtil.navigateToAndMakeRoot(RouteConstants.home);
  }
}
