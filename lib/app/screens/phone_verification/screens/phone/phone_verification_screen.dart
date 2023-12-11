import 'package:calaton_firebase_auth/app/screens/common/widgets/input_field.dart';
import 'package:calaton_firebase_auth/app/screens/phone_verification/screens/phone/phone_verification_view_model.dart';
import 'package:flutter/material.dart';

import '../../../../utilits/app_forms_formatters.dart';
import '../../../common/widgets/main_button.dart';

class PhoneVerificationScreen extends StatelessWidget {
  const PhoneVerificationScreen({super.key, required this.viewModel});

  final PhoneVerificationViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final phoneFormKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: phoneFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: InputField(
                    keyBoardType: TextInputType.phone,
                    hintText: '+38',
                    onValueChanged: viewModel.updatePhoneNumber,
                    inputFormatters: [AppFormsFormatters.phoneMask],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                MainButton(
                  text: "Send Otp Code",
                  onPressedFunction: () async {
                    await viewModel.onLoginViaPhonePressed();
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
