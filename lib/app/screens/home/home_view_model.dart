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
    print('onLogOutButtonPressed');
    await _userRepository.logOut();
    notifyListeners();
  }

  Future<bool> isSignedIn() async {
    print('isSignedIn ran');
    final bool isSignedIn = await _userRepository.isSignedIn();
    print('isSignedIn: $isSignedIn');
    if (isSignedIn == true) {
      return true;
    } else {
      return false;
    }
  }
}
