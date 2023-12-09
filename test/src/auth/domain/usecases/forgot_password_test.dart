import 'package:clean_code_app/core/usecases/usecases.dart';
import 'package:clean_code_app/core/utils/typedefs.dart';
import 'package:clean_code_app/src/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:clean_code_app/src/auth/domain/usecases/forgot_password.dart';

import 'auth_repository.mock.dart';

void main() {
  late MockAuthRepository repo;
  late ForgotPassword usecase;

  setUp(() {
    repo = MockAuthRepository();
    usecase = ForgotPassword(repo);
  });

  test(
    'should call the [AuthRepo.forgotPassword]',
    () async {
      when(() => repo.forgotPassword(any())).thenAnswer(
        (_) async => const Right(null),
      );

      final result = await usecase('email');

      expect(result, equals(const Right<dynamic, void>(null)));

      verify(() => repo.forgotPassword('email')).called(1);

      verifyNoMoreInteractions(repo);
    },
  );
}
