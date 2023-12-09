import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart'; 
import 'package:clean_code_app/src/auth/domain/usecases/sign_up.dart';

import 'auth_repository.mock.dart';

void main() {
  late MockAuthRepository repo;
  late SignUp usecase;

  const tEmail = 'Test email';
  const tPassword = 'Test password';
  const tFullName = 'Test full name';

  setUp(() {
    repo = MockAuthRepository();
    usecase = SignUp(repo);
  });

  test(
    'should call the [AuthRepo]',
    () async {
      when(
        () => repo.signUp(
          email: any(named: 'email'),
          fullName: any(named: 'fullName'),
          password: any(named: 'password'),
        ),
      ).thenAnswer(
        (_) async => const Right(null),
      );

      final result = await usecase(
        const SignUpParams(
          email: tEmail,
          password: tPassword,
          fullName: tFullName,
        ),
      );

      expect(result, const Right<dynamic, void>(null));

      verify(
        () => repo.signUp(
          email: tEmail,
          password: tPassword,
          fullName: tFullName,
        ),
      ).called(1);

      verifyNoMoreInteractions(repo);
    },
  );
}
