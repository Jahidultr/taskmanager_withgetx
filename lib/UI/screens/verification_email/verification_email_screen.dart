import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager_withgetx/UI/screens/otp_verify/otp_verify_screen.dart';
import 'package:taskmanager_withgetx/UI/screens/sign_in/sign_in_screen.dart';
import 'package:taskmanager_withgetx/common/utlis/app_padding.dart';

class VerificationEmailScreen extends StatefulWidget {
  const VerificationEmailScreen({super.key});

  static String name = '/email';

  @override
  State<VerificationEmailScreen> createState() =>
      _VerificationEmailScreenState();
}

class _VerificationEmailScreenState extends State<VerificationEmailScreen> {
  final TextEditingController _emailTEController = TextEditingController();
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
          'Your Email',
          style: textTheme.displayMedium,
        ),
        SizedBox(height: size.height * 0.010),
        const Text(
          '  A 6 digit verification pin will send to your email address',
        ),
        SizedBox(height: size.height * 0.036),
        Form(
          key: _globalKey,
          child: TextFormField(
            controller: _emailTEController,
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter valid value';
              }
              return null;
            },
          ),
        ),
        SizedBox(height: size.height * 0.036),
        ElevatedButton(
          onPressed: _onTapNextScreen,
          child: const Text('Next'),
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
    Get.to(() => const OtpScreen());
  }

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
  }
}
