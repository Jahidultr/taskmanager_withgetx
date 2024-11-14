import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager_withgetx/UI/screens/sign_in/sign_in_screen.dart';
import 'package:taskmanager_withgetx/common/utlis/app_padding.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  static String name = '/password';

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _newPasswordTEController =
      TextEditingController();
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
    return Form(
      key: _globalKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Update password',
            style: textTheme.displayMedium,
          ),
          SizedBox(height: size.height * 0.016),
          TextFormField(
            controller: _passwordTEController,
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'New Password',
            ),
            validator: (value) {
              if (value!.length < 6) {
                return 'Enter value a minimum 6 character';
              }
              return null;
            },
          ),
          SizedBox(height: size.height * 0.010),
          TextFormField(
            controller: _newPasswordTEController,
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'Confirm Password',
            ),
            validator: (value) {
              if (value!.length < 6) {
                return 'Enter value a minimum 6 character';
              }
              return null;
            },
          ),
          SizedBox(height: size.height * 0.026),
          ElevatedButton(
            onPressed: _onTapNextScreen,
            child: const Text('Save'),
          ),
          SizedBox(height: size.height * 0.046),
        ],
      ),
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
  }

  @override
  void dispose() {
    super.dispose();
    _passwordTEController.dispose();
    _newPasswordTEController.dispose();
  }
}
