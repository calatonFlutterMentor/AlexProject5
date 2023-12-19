import 'package:calaton_firebase_auth/domain/user/iuser.dart';
import 'package:flutter/material.dart';

import '../common/widgets/main_button.dart';
import 'home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.viewModel}) : super(key: key);

  final HomeViewModel viewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.viewModel.fetchUsersList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
                shrinkWrap: true,
                itemCount: widget.viewModel.userList.isNotEmpty ? widget.viewModel.userList.length : 0,
                itemBuilder: (context, index) {
                  IUser user = widget.viewModel.userList[index];
                  return Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1)),
                      child: Column(
                        children: [
                           Text(
                            "Email - ${user.email}",
                            style:  const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Id - ${user.id}",
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: MainButton(
                  onPressedFunction: () {
                    widget.viewModel.onLogOutButtonPressed();
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
