import 'dart:developer';

import 'package:demo_clean_architecture/core/common/widgets/loader.dart';
import 'package:demo_clean_architecture/core/theme/app_colors.dart';
import 'package:demo_clean_architecture/core/utils/snackbar.dart';
import 'package:demo_clean_architecture/features/auth/presentation/bloc/auth_bloc_bloc.dart';
import 'package:demo_clean_architecture/features/auth/presentation/pages/login_page.dart';
import 'package:demo_clean_architecture/features/auth/presentation/widgets/auth_button.dart';
import 'package:demo_clean_architecture/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignUpPage(),
      );
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              showSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const CommonLoader();
            }
            return Form(
              key: formKey,
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
                  AuthButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(AuthSignUp(
                            email: emailController.text,
                            password: passwordController.text,
                            name: nameController.text));
                      }
                    },
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
            );
          },
        ),
      ),
    );
  }
}
