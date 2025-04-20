import 'package:flutter/material.dart';
import 'package:personal_task_tracker/app/fonts.dart';
import 'package:personal_task_tracker/auth/auth_service.dart';
import 'package:personal_task_tracker/auth/signup_screen.dart';
import 'package:personal_task_tracker/dashboard/dashboard_screen.dart';
import 'package:personal_task_tracker/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo
            Center(
              child: SizedBox(
                width: 120,
                height: 80,
                child: Image.asset("assets/images/logo.png"),
              ),
            ),
            SizedBox(height: 40),

            // Welcome Back
            Text("Welcome Back!", style: AppFonts.displayLarge(context)),
            SizedBox(height: 30),

            // Email
            Text("Email Address", style: AppFonts.labelMedium(context)),
            SizedBox(height: 10),
            TextField(controller: emailController),
            SizedBox(height: 25),

            // Password
            Text("Password", style: AppFonts.labelMedium(context)),
            SizedBox(height: 10),

            TextField(
              controller: passwordController,
              obscureText: true,
              obscuringCharacter: "*",
            ),
            SizedBox(height: 25),

            // Login Button
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  // Login

                  AuthResponse userData = await AuthService().login(
                    emailController.text,
                    passwordController.text,
                  );

                  context.read<UserProvider>().updateUserData(
                    userId: userData.user!.id,
                    name: userData.user!.userMetadata!["name"],
                    email: userData.user!.email!,
                  );

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                  );
                },
                child: Text("Log In"),
              ),
            ),
            SizedBox(height: 25),

            // SignUp Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  child: Text("Sign Up"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
