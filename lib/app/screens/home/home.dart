import 'package:calaton_firebase_auth/domain/user/iuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../common/widgets/main_button.dart';
import 'home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.viewModel}) : super(key: key);

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: viewModel.remoteStorageStream,
                builder: (context, snapshot) {
                  print("snapshot.data!.first.id - }");
                  print(snapshot.hasData);
                  if (snapshot.hasData) {
                    final users = snapshot.data!;
                    return Center(
                      child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        shrinkWrap: true,
                        itemCount: users.size,
                        itemBuilder: (context, index) {
                          print(users.size);
                          return Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1)),
                              child: Column(
                                children: [
                                  const Text(
                                    "Email -",
                                       // "${users.docs[index].get(users.docs[index].data())}",
                                    style:  TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    "Id - ${users.docs[index].id}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ));
                        },
                      ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: MainButton(
                  onPressedFunction: () {
                    viewModel.onLogOutButtonPressed();
                  },
                  text: "Log out",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
