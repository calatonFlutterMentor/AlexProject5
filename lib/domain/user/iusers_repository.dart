 import 'package:calaton_firebase_auth/domain/storage/iremote_storage.dart';


 abstract interface class IUsersRepository implements IRemoteStorage{
   Future<void> create(dynamic data);

   Future<List<dynamic>> fetchUsers(collection);

   Future<dynamic> update();

   Future<void> remove();
}