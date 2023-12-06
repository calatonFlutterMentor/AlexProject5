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
    final formKeyPhone = GlobalKey<FormState>();
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
                      hintText: "email",
                      errorMassage: "Enter correct email",
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
                      hintText: "password",
                      errorMassage: "Enter correct password",
                      onValueChanged: viewModel.updatePasswordValue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formKeyPhone,
                    child: InputField(
                      hintText: "phone",
                      errorMassage: "Enter correct phone",
                      onValueChanged: viewModel.updatePhone,
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
                    }
                  },
                ),
                const SizedBox(height: 24),
                MainButton(
                  text: "Login via phone",
                  onPressedFunction: () async {
                    final isPhoneValid = formKeyPhone.currentState!.validate();
                    if (isPhoneValid) {
                      viewModel.onLoginViaPhonePressed();
                    }
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
