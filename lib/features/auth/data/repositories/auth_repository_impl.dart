import 'package:demo_clean_architecture/core/error/exceptions.dart';
import 'package:demo_clean_architecture/core/error/failure.dart';
import 'package:demo_clean_architecture/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:demo_clean_architecture/features/auth/domain/entities/user.dart';
import 'package:demo_clean_architecture/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl(this.authRemoteDataSource);
  @override
  Future<Either<Failure, User>> loginWithEmailAndPassword(
      {required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailAndPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final user = await authRemoteDataSource.signUpWithEmailAndPassword(
          email: email, password: password, name: name);
      return Right(user);
    } on ServerExceptions catch (e) {
      return Left(Failure(e.message));
    }
  }
}
