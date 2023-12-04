import 'package:calaton_firebase_auth/app/routing/inavigation_util.dart';

import '../../../domain/user/iuser_repository.dart';
import '../../common/base_change_notifier.dart';

class HomeViewModel extends BaseChangeNotifier {
  final IUserRepository _userRepository;
  final INavigationUtil _navigationUtil;

  HomeViewModel(
      {required INavigationUtil navigationUtil,
      required IUserRepository userRepository})
      : _navigationUtil = navigationUtil,
        _userRepository = userRepository;

  Future<void> onLogOutButtonPressed() async {
    await _userRepository.logOut();
    notifyListeners();
  }

  Future<bool> isSignedIn() async {
    final bool isSignedIn = await _userRepository.isSignedIn();
    if (isSignedIn == true) {
      return true;
    } else {
      return false;
    }
  }
}
