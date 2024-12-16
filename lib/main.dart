import 'package:demo_clean_architecture/core/theme/app_theme.dart';
import 'package:demo_clean_architecture/core/theme/secrets/secret_file.dart';
import 'package:demo_clean_architecture/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(anonKey: Secrets.anonKey, url: Secrets.supaBaseUrl);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.darkTheme,
        home: const LoginPage());
  }
}
