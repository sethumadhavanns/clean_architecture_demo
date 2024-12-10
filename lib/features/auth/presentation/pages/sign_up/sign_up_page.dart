import 'package:demo_clean_architecture/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign Up",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
            AuthTextfield(
              hintText: "Name",
            ),
            SizedBox(
              height: 5,
            ),
            AuthTextfield(
              hintText: "Email",
            ),
            SizedBox(
              height: 5,
            ),
            AuthTextfield(
              hintText: "Password",
            )
          ],
        ),
      ),
    );
  }
}
