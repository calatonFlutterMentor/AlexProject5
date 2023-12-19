import '../../domain/user/iuser.dart';
import '../model/user.dart';
import '../remote_storage/remote_storage.dart';

class UsersRepository {
  final RemoteStorage _remoteStorage = RemoteStorage();

  Future<void> create(email) async {
    _remoteStorage.create(email);
  }

  Future<List<IUser>> fetchUsers() async {
    final List<dynamic> usersCollection = await _remoteStorage.fetchUsers("users");
    return  usersCollection.map((user){
      return User.fromJson(user.data() as Map<String, dynamic>);
    }).toList();
  }
}