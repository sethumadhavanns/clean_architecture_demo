import 'package:demo_clean_architecture/core/theme/app_colors.dart';
import 'package:demo_clean_architecture/features/auth/presentation/pages/login_page.dart';
import 'package:demo_clean_architecture/features/auth/presentation/widgets/auth_button.dart';
import 'package:demo_clean_architecture/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignUpPage(),
      );
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign Up",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
            AuthTextfield(
              controller: nameController,
              hintText: "Name",
            ),
            const SizedBox(
              height: 5,
            ),
            AuthTextfield(
              controller: emailController,
              hintText: "Email",
            ),
            const SizedBox(
              height: 5,
            ),
            AuthTextfield(
              controller: passwordController,
              hintText: "Password",
            ),
            const AuthButton(
              buttonText: "Sign Up",
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, LoginPage.route());
              },
              child: RichText(
                  text: const TextSpan(
                      children: [
                    TextSpan(
                        text: "Sign In",
                        style: TextStyle(color: AppPallete.gradient2))
                  ],
                      text: "Already have an account ? ",
                      style: TextStyle(fontWeight: FontWeight.bold))),
            )
          ],
        ),
      ),
    );
  }
}
