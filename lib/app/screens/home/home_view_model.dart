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

  Future<void> onLogOutButtonPressed() async {
    await _userRepository.logOut();
    // dispose викликається сам по собі, коли його викликаєш ти - то триггіриш розірвання котракту з скріном та підкапотні еррори
    // ти можеш його овверрайтити, але викликатися він повинен системою
    // dispose();
  }
}
