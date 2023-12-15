import 'package:flutter/material.dart';
import '../common/widgets/input_field.dart';
import '../common/widgets/main_button.dart';
import 'login_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.viewModel});

  final LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final formKeyEmail = GlobalKey<FormState>();
    final formKeyPassword = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Register below with your details!',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formKeyEmail,
                    child: InputField(
                      keyBoardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value != null && value.length < 2) {
                          return "Enter correct email";
                        } else {
                          return null;
                        }
                      },
                      hintText: "email",
                      onValueChanged: viewModel.updateEmailValue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Form(
                    key: formKeyPassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: InputField(
                      keyBoardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value != null && value.length < 2) {
                          return "Enter correct email";
                        } else {
                          return null;
                        }
                      },
                      hintText: "password",
                      onValueChanged: viewModel.updatePasswordValue,
                    ),
                  ),
                ),
                MainButton(
                  text: "Login via email password",
                  onPressedFunction: () async {
                    final isEmailValid = formKeyEmail.currentState!.validate();
                    final isPasswordValid =
                        formKeyPassword.currentState!.validate();
                    if (isEmailValid && isPasswordValid) {
                      viewModel.onLoginViaEmailPressed();
                      viewModel.addUsersToRemoteStorage();
                    }
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                MainButton(
                  text: "Sing In with Google",
                  onPressedFunction: () async {
                    await viewModel.onLoginWithGooglePressed();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
