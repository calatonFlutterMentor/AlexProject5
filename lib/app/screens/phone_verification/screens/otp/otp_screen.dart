import 'package:calaton_firebase_auth/app/screens/common/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common/widgets/main_button.dart';
import 'otp_view_model.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.viewModel});

  final OtpViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final firstNumberFormKey = GlobalKey<FormState>();
    final secondNumberFormKey = GlobalKey<FormState>();
    final thirdNumberFormKey = GlobalKey<FormState>();
    final fourthNumberFormKey = GlobalKey<FormState>();
    final fifthNumberFormKey = GlobalKey<FormState>();
    final sixthNumberFormKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Center(
          child: SingleChildScrollView(
              child: Column(
            children: [
              FittedBox(
                fit: BoxFit.contain,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Form(
                      key: firstNumberFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: OtpField(
                        onValueChanged: viewModel.updateFirstNumber,
                      ),
                    ),
                    Form(
                      key: secondNumberFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: OtpField(
                        onValueChanged: viewModel.updateSecondNumber,
                      ),
                    ),
                    Form(
                      key: thirdNumberFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: OtpField(
                        onValueChanged: viewModel.updateThirdNumber,
                      ),
                    ),
                    Form(
                      key: fourthNumberFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: OtpField(
                        onValueChanged: viewModel.updateFourthNumber,
                      ),
                    ),
                    Form(
                      key: fifthNumberFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: OtpField(
                        onValueChanged: viewModel.updateFifthNumber,
                      ),
                    ),
                    Form(
                      key: sixthNumberFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: OtpField(
                        onValueChanged: viewModel.updateSixthNumber,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              MainButton(
                text: "Send Otp Code",
                onPressedFunction: () async {
                  viewModel.sendOtpCode();
                },
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class OtpField extends StatelessWidget {
  const OtpField({super.key, required this.onValueChanged});

  final Function(String value) onValueChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 60,
      child: InputField(
        textAlign: TextAlign.center,
        hintText: "",
        onValueChanged: onValueChanged,
        keyBoardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        inputDecoration: const InputDecoration(
          contentPadding: EdgeInsets.all(14),
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
