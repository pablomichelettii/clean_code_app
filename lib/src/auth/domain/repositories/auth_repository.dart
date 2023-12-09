import 'package:clean_code_app/core/enums/update_user.dart';
import 'package:clean_code_app/core/utils/typedefs.dart';
import 'package:clean_code_app/src/auth/domain/entities/user.dart';

abstract class AuthRepository {
  const AuthRepository();

  ResultFuture<void> forgotPassword(String email);

  ResultFuture<LocalUser> signIn({
    required String email,
    required String password,
  });

  ResultFuture<void> signUp({
    required String email,
    required String fullName,
    required String password,
  });

  ResultFuture<void> updateUser(
      {required UpdateUserAction action, required dynamic userData,});
}
