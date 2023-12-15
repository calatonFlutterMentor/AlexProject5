import 'dart:async';

import 'package:calaton_firebase_auth/app/routing/inavigation_util.dart';
import 'package:calaton_firebase_auth/domain/user/iuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../domain/storage/iremote_storage.dart';
import '../../../domain/user/iuser_repository.dart';
import '../../common/base_change_notifier.dart';
import '../../services/auth_service.dart';
import '../../services/remote_storage_service.dart';

class HomeViewModel extends BaseChangeNotifier {
  final IUserRepository _userRepository;
  final INavigationUtil _navigationUtil;
  final AuthService _authService;
  final IRemoteStorage _remoteStorage;
  final RemoteStorageService _remoteStorageService;

  HomeViewModel(
      {required INavigationUtil navigationUtil,
      required IUserRepository userRepository,
      required IRemoteStorage remoteStorage,
      required RemoteStorageService remoteStorageService,
      required AuthService authService})
      : _navigationUtil = navigationUtil,
        _authService = authService,
        _remoteStorage = remoteStorage,
        _userRepository = userRepository,
        _remoteStorageService = remoteStorageService;
  Stream<QuerySnapshot> get remoteStorageStream => _remoteStorageService.addSubscription();
  Future<void> onLogOutButtonPressed() async {
    await _userRepository.logOut();
    // dispose викликається сам по собі, коли його викликаєш ти - то триггіриш розірвання котракту з скріном та підкапотні еррори
    // ти можеш його овверрайтити, але викликатися він повинен системою
    // dispose();
  }

  Stream<List<IUser>> buildUsersList() {
    print("buildUsersList");
    return _remoteStorage.read() as Stream<List<IUser>>;
  }

  @override
  void dispose() {
    _remoteStorageService.closeStreamController();
    _remoteStorageService.cancelSubscription();
    super.dispose();
  }
}
