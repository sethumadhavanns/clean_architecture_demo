import 'package:demo_clean_architecture/core/error/failure.dart';
import 'package:demo_clean_architecture/core/common/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailAndPassword(
      {required String name, required String email, required String password});

  Future<Either<Failure, User>> loginWithEmailAndPassword(
      {required String email, required String password});
  Future<Either<Failure, User>> currentUser();
}
