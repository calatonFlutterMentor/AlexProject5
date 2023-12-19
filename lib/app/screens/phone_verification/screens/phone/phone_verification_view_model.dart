import 'package:calaton_firebase_auth/app/common/base_change_notifier.dart';
import 'package:calaton_firebase_auth/app/routing/route_constants.dart';

import '../../../../../domain/user/iuser_auth_repository.dart';
import '../../../../routing/inavigation_util.dart';

class PhoneVerificationViewModel extends BaseChangeNotifier {
  final IUserAuthRepository _userRepository;
  final INavigationUtil _navigationUtil;

  PhoneVerificationViewModel(
      {required IUserAuthRepository userRepository,
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
      await _userRepository.verifyPhoneNumber(_phoneNumber, updateVerificationId);
      print(_phoneNumber);
    }
    stopLoading();
  }

  void updateVerificationId(String verificationId){
    _navigationUtil.navigateTo(RouteConstants.otpCode, data: verificationId);
  }
}
