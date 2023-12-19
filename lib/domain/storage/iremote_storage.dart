
abstract interface class IRemoteStorage {
  Future<void> create(dynamic data);

  Future<dynamic> fetchUsers(dynamic data);

  Future<dynamic> update();

  Future<void> remove();
}