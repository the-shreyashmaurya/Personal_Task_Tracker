import 'package:flutter/material.dart';
import 'package:personal_task_tracker/app/colors.dart';
import 'package:personal_task_tracker/app/fonts.dart';
import 'package:personal_task_tracker/auth/auth_service.dart';
import 'package:personal_task_tracker/auth/login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
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
            SizedBox(height: 20),

            // Create your account
            Text("Create your account", style: AppFonts.displayLarge(context)),
            SizedBox(height: 20),

            // Full Name
            Text("Full Name", style: AppFonts.labelMedium(context)),
            SizedBox(height: 5),
            TextField(controller: nameController),
            SizedBox(height: 15),

            // Email
            Text("Email Address", style: AppFonts.labelMedium(context)),
            SizedBox(height: 5),
            TextField(controller: emailController),
            SizedBox(height: 15),

            // Password
            Text("Password", style: AppFonts.labelMedium(context)),
            SizedBox(height: 5),

            TextField(
              controller: passwordController,
              obscureText: true,
              obscuringCharacter: "*",
            ),
            SizedBox(height: 15),

            // Agree to Terms and condition
            Row(
              children: [
                Icon(Icons.check_box_outlined, size: 18),
                SizedBox(width: 5),
                Expanded(
                  // or Flexible
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "I have read & agree to DayTask ",
                          style: TextStyle(fontSize: 11),
                        ),
                        TextSpan(
                          text: "Privacy Policy, Terms & Conditions",
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors().primary,
                          ),
                        ),
                      ],
                    ),
                    softWrap:
                        true, // This enables text wrapping (default is true)
                    overflow: TextOverflow.visible, // Allows text to wrap
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),

            // Login Button
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  // SignUp

                  await AuthService().signUp(
                    emailController.text,
                    passwordController.text,
                    nameController.text,
                  );

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text("Sign Up"),
              ),
            ),
            SizedBox(height: 15),

            // SignUp Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(
                  onPressed: () async {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text("Log In"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
