import 'package:calaton_firebase_auth/app/common/base_change_notifier.dart';
import 'package:calaton_firebase_auth/app/services/auth_service.dart';

class AppViewModel extends BaseChangeNotifier {
  final AuthService _authService;

  AppViewModel({required AuthService authService}) : _authService = authService;

  Stream<UserAuthState> get authStream => _authService.authState();

  @override
  void dispose() {
    _authService.closeStreamController();
    _authService.cancelSubscription();
    super.dispose();
  }
}
