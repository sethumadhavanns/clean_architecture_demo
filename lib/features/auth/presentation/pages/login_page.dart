import 'package:demo_clean_architecture/core/common/widgets/loader.dart';
import 'package:demo_clean_architecture/core/theme/app_colors.dart';
import 'package:demo_clean_architecture/core/utils/snackbar.dart';
import 'package:demo_clean_architecture/features/auth/presentation/bloc/auth_bloc_bloc.dart';
import 'package:demo_clean_architecture/features/auth/presentation/pages/sign_up_page.dart';
import 'package:demo_clean_architecture/features/auth/presentation/widgets/auth_button.dart';
import 'package:demo_clean_architecture/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final nameController = TextEditingController();
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  AuthTextfield(
                    controller: emailController,
                    hintText: "Name",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  AuthTextfield(
                    controller: passwordController,
                    hintText: "Password",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(AuthLogin(
                            password: passwordController.text.trim(),
                            email: emailController.text.trim()));
                      }
                    },
                    buttonText: "Login",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, SignUpPage.route());
                    },
                    child: RichText(
                        text: const TextSpan(
                            children: [
                          TextSpan(
                              text: "Sign Up",
                              style: TextStyle(color: AppPallete.gradient2))
                        ],
                            text: "Don't have an account ? ",
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
