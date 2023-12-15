import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class RemoteStorageService {
  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection('users').snapshots();
  StreamSubscription? _subscription;
  final StreamController<QuerySnapshot> _streamController =
  StreamController.broadcast();

  Stream<QuerySnapshot> addSubscription() {
    _subscription = _usersStream.listen((event) {
      _streamController.add(event);
    });
    return _streamController.stream;
  }
  void closeStreamController() {
    _streamController.close();
    print('_streamController in RemoteStorageService is closed- ${_streamController.isClosed}');
  }

  void cancelSubscription() {
    _subscription?.cancel();
  }
}