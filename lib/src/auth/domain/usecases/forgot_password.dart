import 'package:clean_code_app/core/usecases/usecases.dart';
import 'package:clean_code_app/core/utils/typedefs.dart';
import 'package:clean_code_app/src/auth/domain/repositories/auth_repository.dart';

class ForgotPassword extends UsecaseWithParams<void, String> {
  const ForgotPassword(this._repo);

  final AuthRepository _repo;

  @override
  ResultFuture<void> call(String params) => _repo.forgotPassword(params);
}
