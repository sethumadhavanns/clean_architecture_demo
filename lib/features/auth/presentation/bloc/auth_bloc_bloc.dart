import 'package:demo_clean_architecture/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:demo_clean_architecture/core/common/entities/user.dart';
import 'package:demo_clean_architecture/features/auth/domain/usecases/current_user.dart';
import 'package:demo_clean_architecture/features/auth/domain/usecases/user_login.dart';
import 'package:demo_clean_architecture/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;
  final CurrentUser _currentUser;
  final AppUserCubit _appUserCubit;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserLogin userLogin,
    required CurrentUser currentUser,
    required AppUserCubit appUserCubit,
  })  : _userSignUp = userSignUp,
        _userLogin = userLogin,
        _currentUser = currentUser,
        _appUserCubit = appUserCubit,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLogin);
    on<AuthIsUserLoggedIn>(_onAuthIsUserLoggedIn);
  }

  Future<void> _onAuthIsUserLoggedIn(
      AuthIsUserLoggedIn event, Emitter<AuthState> emit) async {
    final res = await _currentUser(Noparams());
    res.fold(
      (l) => emit(AuthFailure(message: l.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  Future<void> _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    final res = await _userSignUp(UserSignUpParams(
        email: event.email, password: event.password, name: event.name));
    res.fold(
      (l) => emit(AuthFailure(message: l.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  Future<void> _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    final res = await _userLogin(UserLoginParams(
      email: event.email,
      password: event.password,
    ));
    res.fold(
      (l) => emit(AuthFailure(message: l.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _emitAuthSuccess(User user, Emitter<AuthState> emit) {
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user: user));
  }
}
