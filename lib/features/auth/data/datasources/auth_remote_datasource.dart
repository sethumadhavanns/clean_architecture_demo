import 'dart:developer';

import 'package:demo_clean_architecture/core/error/exceptions.dart';
import 'package:demo_clean_architecture/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Session? get currentUserSession;
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
  Future<UserModel> loginWithEmailAndPassword({
    required String password,
    required String email,
  });
  Future<UserModel?> getCurrentUserData();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl({required this.supabaseClient});

  @override
  // TODO: implement currentUserSession
  Session? get currentUserSession => supabaseClient.auth.currentSession;
  @override
  Future<UserModel> loginWithEmailAndPassword(
      {required String password, required String email}) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );

      if (response.user == null) {
        throw ServerExceptions('User not created');
      }

      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      log(e.toString());
      throw ServerExceptions(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final response = await supabaseClient.auth
          .signUp(password: password, email: email, data: {"name": name});

      if (response.user == null) {
        throw ServerExceptions('User not created');
      }

      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      log(e.toString());
      throw ServerExceptions(e.toString());
    }
  }

  @override
  Future<UserModel?> getCurrentUserData() async {
    try {
      if (currentUserSession != null) {
        final userData = await supabaseClient
            .from("profiles")
            .select()
            .eq("id", currentUserSession!.user.id)
            .single();
        return UserModel.fromJson(userData);
      }
      return null;
    } catch (e) {
      throw ServerExceptions(e.toString());
    }
  }
}
