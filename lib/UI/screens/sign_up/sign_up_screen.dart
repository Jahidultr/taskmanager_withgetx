import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager_withgetx/UI/screens/sign_in/sign_in_screen.dart';
import 'package:taskmanager_withgetx/common/utlis/app_padding.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  static String name = '/SingUp';

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
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
            'Join with us',
            style: textTheme.displayMedium,
          ),
          SizedBox(height: size.height * 0.016),
          TextFormField(
            controller: _emailTEController,
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            validator: (value) {
              if (value!.trim().isEmpty) {
                return 'Enter valid value';
              }
              return null;
            },
          ),
          SizedBox(height: size.height * 0.010),
          TextFormField(
            controller: _firstNameTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'First Name',
            ),
            validator: (value) {
              if (value!.trim().isEmpty) {
                return 'Enter valid value';
              }
              return null;
            },
          ),
          SizedBox(height: size.height * 0.010),
          TextFormField(
            controller: _lastNameTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'Last Name',
            ),
            validator: (value) {
              if (value!.trim().isEmpty) {
                return 'Enter valid value';
              }
              return null;
            },
          ),
          SizedBox(height: size.height * 0.010),
          TextFormField(
            controller: _mobileTEController,
            keyboardType: TextInputType.phone,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'Mobile',
            ),
            validator: (value) {
              if (value!.trim().isEmpty) {
                return 'Enter valid value';
              }
              return null;
            },
          ),
          SizedBox(height: size.height * 0.010),
          TextFormField(
            controller: _passwordTEController,
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
            validator: (value) {
              if (value!.length < 6) {
                return 'Enter value a minimum 6 character';
              }
              return null;
            },
          ),
          SizedBox(height: size.height * 0.036),
          ElevatedButton(
            onPressed: _onTapNextScreen,
            child: const Text('Sing Up'),
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
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
  }
}
