import 'package:calaton_firebase_auth/domain/user/iuser.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/storage/iremote_storage.dart';
import '../../../domain/user/iuser_repository.dart';
import '../../common/base_change_notifier.dart';
import '../../routing/inavigation_util.dart';

class LoginViewModel extends BaseChangeNotifier {
  final IUserRepository _userRepository;
  final INavigationUtil _navigationUtil;
  final IRemoteStorage _remoteStorage;

  LoginViewModel(
      {required IUserRepository userRepository,
      required IRemoteStorage remoteStorage,
      required INavigationUtil navigationUtil})
      : _userRepository = userRepository,
        _remoteStorage = remoteStorage,
        _navigationUtil = navigationUtil;
  String _emailValue = '';
  String _passwordValue = '';

  void updateEmailValue(String value) {
    _emailValue = value;
  }

  void updatePasswordValue(String value) {
    _passwordValue = value;
  }

  Future<void> onLoginViaEmailPressed() async {
    startLoading();
    IUser? user = await _userRepository.singUp(_emailValue, _passwordValue);
    stopLoading();
  }

  Future<UserCredential> onLoginWithGooglePressed() async {
    startLoading();
    return await _userRepository.signInWithGoogle();
  }

  Future<void> addUsersToRemoteStorage() async {
    startLoading();
    return await _remoteStorage.create(_emailValue);
  }
}
