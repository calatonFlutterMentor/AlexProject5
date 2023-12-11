import 'package:calaton_firebase_auth/app/common/base_change_notifier.dart';
import 'package:calaton_firebase_auth/app/routing/route_constants.dart';

import '../../../../../domain/user/iuser_repository.dart';
import '../../../../routing/inavigation_util.dart';

class PhoneVerificationViewModel extends BaseChangeNotifier {
  final IUserRepository _userRepository;
  final INavigationUtil _navigationUtil;

  PhoneVerificationViewModel(
      {required IUserRepository userRepository,
      required INavigationUtil navigationUtil})
      : _userRepository = userRepository,
        _navigationUtil = navigationUtil;
  String _phoneNumber = "";

  void updatePhoneNumber(String value) {
    _phoneNumber = value;
  }

  Future<void> onLoginViaPhonePressed() async {
    startLoading();
    if (_phoneNumber.isNotEmpty) {
      await _userRepository.verifyPhoneNumber(_phoneNumber);
      print(_phoneNumber);
      _navigationUtil.navigateTo(RouteConstants.otpCode);
    }
    stopLoading();
  }
}
