import 'dart:async';

import 'package:calaton_firebase_auth/domain/storage/iremote_storage.dart';
import 'package:calaton_firebase_auth/domain/user/iuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user.dart';

class RemoteStorage implements IRemoteStorage {
  RemoteStorage();

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> create(email) async {
    final docUser = _firebaseFirestore.collection('users').doc();
    final user = User(
      email: email,
      id: docUser.id,
    );
    final json = user.toJson();
    return await docUser.set(json);
  }

  @override
  Stream<List<IUser>> read() {
    return _firebaseFirestore.collection('users').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
  }

  @override
  Future<void> remove() {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future update() {
    // TODO: implement update
    throw UnimplementedError();
  }
}

