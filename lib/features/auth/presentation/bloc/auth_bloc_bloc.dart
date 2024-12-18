import 'package:demo_clean_architecture/features/auth/domain/entities/user.dart';
import 'package:demo_clean_architecture/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  AuthBloc({required UserSignUp userSignUp})
      : _userSignUp = userSignUp,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      emit(AuthLoading());
      final res = await _userSignUp(UserSignUpParams(
          email: event.email, password: event.password, name: event.name));
      res.fold(
        (l) => emit(AuthFailure(message: l.message)),
        (user) => emit(AuthSuccess(user: user)),
      );
    });
  }
}
