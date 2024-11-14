import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taskmanager_withgetx/UI/screens/sign_in/sign_in_screen.dart';
import 'package:taskmanager_withgetx/UI/screens/update_password/update_password.dart';
import 'package:taskmanager_withgetx/common/utlis/app_padding.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  static String name = '/otp';

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.authScreenSidePadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFormSection(),
              _buildHaveAccountSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormSection() {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pin Verification',
          style: textTheme.displayMedium,
        ),
        SizedBox(height: size.height * 0.010),
        const Text(
          '  A 6 digit verification pin will send to your email address',
        ),
        SizedBox(height: size.height * 0.036),
        Form(
          key: _globalKey,
          child: PinCodeTextField(
            controller: _otpTEController,
            backgroundColor: Colors.transparent,
            appContext: (context),
            length: 6,
            pinTheme: PinTheme(
              fieldWidth: 44,
              fieldHeight: 56,
              activeFillColor: Colors.transparent,
              selectedFillColor: Colors.transparent,
              inactiveFillColor: Colors.transparent,
              inactiveColor: Colors.grey[200],
              selectedColor: Colors.grey,
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(8),
            ),
            enableActiveFill: true,
          ),
        ),
        SizedBox(height: size.height * 0.036),
        ElevatedButton(
          onPressed: _onTapNextScreen,
          child: const Text('Verify'),
        ),
        SizedBox(height: size.height * 0.046),
      ],
    );
  }

  Widget _buildHaveAccountSection() {
    return Center(
      child: RichText(
        text: TextSpan(
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w600,
            ),
            children: [
              const TextSpan(
                text: "have account?  ",
              ),
              TextSpan(
                  style: TextStyle(
                    color: Colors.grey[900],
                  ),
                  text: 'Sing In',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.offAllNamed(SingInScreen.name);
                    }),
            ]),
      ),
    );
  }

  void _onTapNextScreen() {
    if (!_globalKey.currentState!.validate()) {
      return;
    }
    Get.to(() => const UpdatePasswordScreen());
  }

  @override
  void dispose() {
    super.dispose();
    _otpTEController.dispose();
  }
}
