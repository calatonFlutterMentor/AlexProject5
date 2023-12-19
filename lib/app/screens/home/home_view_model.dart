import 'dart:async';

import 'package:calaton_firebase_auth/app/routing/inavigation_util.dart';
import 'package:calaton_firebase_auth/domain/user/iuser.dart';
import 'package:calaton_firebase_auth/domain/user/iusers_repository.dart';
import '../../../data/repository/users_repository.dart';
import '../../../domain/user/iuser_auth_repository.dart';
import '../../common/base_change_notifier.dart';
import '../../services/auth_service.dart';

class HomeViewModel extends BaseChangeNotifier {
  final IUserAuthRepository _userRepository;
  final INavigationUtil _navigationUtil;
  final AuthService _authService;
  final UsersRepository _usersRepository;

  HomeViewModel(
      {required INavigationUtil navigationUtil,
      required IUserAuthRepository userRepository,
      required UsersRepository usersRepository,
      required AuthService authService})
      : _navigationUtil = navigationUtil,
        _authService = authService,
        _usersRepository = usersRepository,
        _userRepository = userRepository;

  Future<void> onLogOutButtonPressed() async {
    await _userRepository.logOut();
    // dispose викликається сам по собі, коли його викликаєш ти - то триггіриш розірвання котракту з скріном та підкапотні еррори
    // ти можеш його овверрайтити, але викликатися він повинен системою
    // dispose();
  }

  List<IUser> get userList => _userList;

  List<IUser> _userList = [];

  Future<void> fetchUsersList() async {
    print("buildUsersList");
    _usersRepository.fetchUsers().then((user) {
      print("buildUsersList -second  ${user.length}");
      _userList.addAll(user);
      notifyListeners();
    });
    print("buildUsersList -third -${_userList.length}");
  }
}
