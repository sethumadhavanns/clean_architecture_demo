import 'package:demo_clean_architecture/core/theme/secrets/secret_file.dart';
import 'package:demo_clean_architecture/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:demo_clean_architecture/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:demo_clean_architecture/features/auth/domain/repository/auth_repository.dart';
import 'package:demo_clean_architecture/features/auth/domain/usecases/current_user.dart';
import 'package:demo_clean_architecture/features/auth/domain/usecases/user_login.dart';
import 'package:demo_clean_architecture/features/auth/domain/usecases/user_sign_up.dart';
import 'package:demo_clean_architecture/features/auth/presentation/bloc/auth_bloc_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;
Future<void> initDependencies() async {
  _initAuth();
  final supaBase = await Supabase.initialize(
      anonKey: Secrets.anonKey, url: Secrets.supaBaseUrl);
  serviceLocator.registerLazySingleton(() => supaBase.client);
}

void _initAuth() {
  serviceLocator
    //dataSource
    ..registerFactory<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(supabaseClient: serviceLocator()))
    //REPOSITORY
    ..registerFactory<AuthRepository>(
        () => AuthRepositoryImpl(serviceLocator()))
    //USE_CASES
    ..registerFactory(() => UserSignUp(serviceLocator()))
    ..registerFactory(() => UserLogin(serviceLocator()))
    ..registerFactory(() => CurrentUser(serviceLocator()))
    //BLOC
    ..registerLazySingleton(() => AuthBloc(
        userSignUp: serviceLocator(),
        userLogin: serviceLocator(),
        currentUser: serviceLocator()));
}
