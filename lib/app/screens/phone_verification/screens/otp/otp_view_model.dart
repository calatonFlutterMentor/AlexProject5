import 'package:calaton_firebase_auth/app/common/base_change_notifier.dart';
import 'package:calaton_firebase_auth/app/routing/route_constants.dart';

import '../../../../../domain/user/iuser_repository.dart';
import '../../../../routing/inavigation_util.dart';

class OtpViewModel extends BaseChangeNotifier {
  final IUserRepository _userRepository;
  final INavigationUtil _navigationUtil;
  final String _verificationCode;

  String _firstNumber = "";
  String _secondNumber = "";
  String _thirdNumber = "";
  String _fourthNumber = "";
  String _fifthNumber = "";
  String _sixthNumber = "";

  OtpViewModel(
      {required IUserRepository userRepository,
      required INavigationUtil navigationUtil,
      required String verificationCode})
      : _userRepository = userRepository,
        _navigationUtil = navigationUtil,
        _verificationCode = verificationCode;

  void updateFirstNumber(String value) {
    _firstNumber = value;
  }

  void updateSecondNumber(String value) {
    _secondNumber = value;
  }

  void updateThirdNumber(String value) {
    _thirdNumber = value;
  }

  void updateFourthNumber(String value) {
    _fourthNumber = value;
  }

  void updateFifthNumber(String value) {
    _fifthNumber = value;
  }

  void updateSixthNumber(String value) {
    _sixthNumber = value;
  }

  Future<void> sendOtpCode() async {
    startLoading();
    if (_firstNumber.isNotEmpty &&
        _secondNumber.isNotEmpty &&
        _thirdNumber.isNotEmpty &&
        _fourthNumber.isNotEmpty &&
        _fifthNumber.isNotEmpty &&
        _sixthNumber.isNotEmpty) {
      final String otpCode =
          "$_firstNumber$_secondNumber$_thirdNumber$_fourthNumber$_fifthNumber$_sixthNumber"
              .trim();
      print(otpCode);
      await _userRepository.sendOtp(otpCode, _verificationCode);
      // _navigationUtil.navigateToAndMakeRoot(RouteConstants.login);
    }
    stopLoading();
  }
}
