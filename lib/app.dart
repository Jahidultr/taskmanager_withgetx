import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager_withgetx/UI/screens/otp_verify/otp_verify_screen.dart';
import 'package:taskmanager_withgetx/UI/screens/sign_in/sign_in_screen.dart';
import 'package:taskmanager_withgetx/UI/screens/sign_up/sign_up_screen.dart';
import 'package:taskmanager_withgetx/UI/screens/splash/splash_screen.dart';
import 'package:taskmanager_withgetx/UI/screens/update_password/update_password.dart';
import 'package:taskmanager_withgetx/UI/screens/verification_email/verification_email_screen.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: _buildInputDecorationTheme(),
        elevatedButtonTheme: _buildElevatedButtonThemeData(),
      ),
      initialRoute: SplashScreen.name,
      routes: {
        SplashScreen.name: (context) => const SplashScreen(),
        SingInScreen.name: (context) => const SingInScreen(),
        SingUpScreen.name: (context) => const SingUpScreen(),
        UpdatePasswordScreen.name: (context) => const UpdatePasswordScreen(),
        VerificationEmailScreen.name: (context) =>
            const VerificationEmailScreen(),
        OtpScreen.name: (context) => const OtpScreen(),
      },
    );
  }

  ElevatedButtonThemeData _buildElevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[600],
        foregroundColor: Colors.grey[300],
        fixedSize: const Size(double.maxFinite, 54),
      ),
    );
  }

  InputDecorationTheme _buildInputDecorationTheme() {
    return InputDecorationTheme(
      labelStyle: const TextStyle(color: Colors.grey),
      border: _buildOutlineInputBorder(),
      focusedBorder: _buildOutlineInputBorder(),
      enabledBorder: _buildOutlineInputBorder(),
      errorBorder: _buildOutlineInputBorder(),
      focusedErrorBorder: _buildOutlineInputBorder(),
      disabledBorder: _buildOutlineInputBorder(),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.grey.shade100),
    );
  }
}
