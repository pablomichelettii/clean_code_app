import 'package:clean_code_app/core/usecases/usecases.dart';
import 'package:clean_code_app/core/utils/typedefs.dart';
import 'package:clean_code_app/src/auth/domain/entities/user.dart';
import 'package:clean_code_app/src/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class SignIn extends UsecaseWithParams<LocalUser, SignInParams> {
  const SignIn(this._repo);

  final AuthRepository _repo;

  @override
  ResultFuture<LocalUser> call(SignInParams params) => _repo.signIn(
        email: params.email,
        password: params.password,
      );
}

class SignInParams extends Equatable {
  const SignInParams({
    required this.email,
    required this.password,
  });

  const SignInParams.empty()
      : email = '',
        password = '';

  final String email;
  final String password;

  @override
  List<String> get props => [email, password];
}
