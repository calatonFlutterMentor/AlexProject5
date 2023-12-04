import 'package:flutter/material.dart';

import '../common/widgets/main_button.dart';
import 'home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.viewModel});

  final HomeViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: MainButton(
                  onPressedFunction: () {
                    viewModel.onLogOutButtonPressed();
                  },
                  text: "Log out",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}