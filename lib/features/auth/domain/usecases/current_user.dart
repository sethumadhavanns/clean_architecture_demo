import 'package:demo_clean_architecture/core/error/failure.dart';
import 'package:demo_clean_architecture/core/usecase/usecase.dart';
import 'package:demo_clean_architecture/features/auth/domain/entities/user.dart';
import 'package:demo_clean_architecture/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class CurrentUser implements UseCase<User, Noparams> {
  final AuthRepository authRepository;
  CurrentUser(this.authRepository);
  @override
  Future<Either<Failure, User>> call(Noparams params) async {
    return await authRepository.currentUser();
  }
}
