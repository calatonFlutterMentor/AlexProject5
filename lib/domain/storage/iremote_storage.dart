import '../user/iuser.dart';

abstract interface class IRemoteStorage {
  Future<void> create(dynamic data);

  Stream<dynamic> read();

  Future<dynamic> update();

  Future<void> remove();
}