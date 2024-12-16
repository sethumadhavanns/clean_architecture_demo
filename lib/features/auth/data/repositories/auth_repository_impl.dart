import 'package:demo_clean_architecture/core/error/exceptions.dart';
import 'package:demo_clean_architecture/core/error/failure.dart';
import 'package:demo_clean_architecture/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:demo_clean_architecture/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl(this.authRemoteDataSource);
  @override
  Future<Either<Failure, String>> loginWithEmailAndPassword(
      {required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailAndPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final userId = await authRemoteDataSource.signUpWithEmailAndPassword(
          email: email, password: password, name: name);
      return Right(userId);
    } on ServerExceptions catch (e) {
      return Left(Failure(e.message));
    }
  }
}
