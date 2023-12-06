import 'dart:async';

import 'package:calaton_firebase_auth/app/routing/inavigation_util.dart';

import '../../../domain/user/iuser_repository.dart';
import '../../common/base_change_notifier.dart';
import '../../services/auth_service.dart';

class HomeViewModel extends BaseChangeNotifier {
  final IUserRepository _userRepository;
  final INavigationUtil _navigationUtil;
  final AuthService _authService;

  HomeViewModel(
      {required INavigationUtil navigationUtil,
      required IUserRepository userRepository,
      required AuthService authService})
      : _navigationUtil = navigationUtil,
        _authService = authService,
        _userRepository = userRepository;

  StreamSubscription<UserAuthState>? _authSubscription;

  Future<void> onLogOutButtonPressed() async {
    print('onLogOutButtonPressed');
    await _userRepository.logOut();
    notifyListeners();
   dispose();
  }
  @override
  void dispose()  {
    _authSubscription?.cancel();
    _authService.closeStreamController();
    super.dispose();
  }
// Future<bool> isSignedIn() async {
//   print('isSignedIn ran');
//   final bool isSignedIn = await _userRepository.isSignedIn();
//   print('isSignedIn: $isSignedIn');
//   if (isSignedIn == true) {
//     return true;
//   } else {
//     return false;
//   }
// }
}
