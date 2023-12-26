import 'package:bloc_test/bloc_test.dart';
import 'package:clean_code_app/core/commons/errors/failures.dart';
import 'package:clean_code_app/src/auth/data/models/user_model.dart';
import 'package:clean_code_app/src/auth/domain/usecases/forgot_password.dart';
import 'package:clean_code_app/src/auth/domain/usecases/sign_in.dart';
import 'package:clean_code_app/src/auth/domain/usecases/sign_up.dart';
import 'package:clean_code_app/src/auth/domain/usecases/update_user.dart';
import 'package:clean_code_app/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockSignUp extends Mock implements SignUp {}

class MockSignIn extends Mock implements SignIn {}

class MockForgotPassword extends Mock implements ForgotPassword {}

class MockUpdateUser extends Mock implements UpdateUser {}

void main() {
  late SignIn signIn;
  late SignUp signUp;
  late ForgotPassword forgotPassword;
  late UpdateUser updateUser;
  late AuthBloc authBloc;

  const tSignUpParams = SignUpParams.empty();
  const tUpdateUserParams = UpdateUserParams.empty();
  const tSignInParams = SignInParams.empty();

  final tServerFailure = ServerFailure(
    message: 'user-not-found',
    statusCode: 'There is no user record corresponding to this identifier. '
        'The user may have been deleted',
  );

  setUp(() {
    signIn = MockSignIn();
    signUp = MockSignUp();
    forgotPassword = MockForgotPassword();
    updateUser = MockUpdateUser();
    authBloc = AuthBloc(
      signIn: signIn,
      signUp: signUp,
      forgotPassword: forgotPassword,
      updateUser: updateUser,
    );
  });

  setUpAll(() {
    registerFallbackValue(tUpdateUserParams);
    registerFallbackValue(tSignUpParams);
    registerFallbackValue(tSignInParams);
  });

  tearDown(() => authBloc.close());

  test('initialState should be [AuthInitial]', () {
    expect(authBloc.state, const AuthInitial());
  });

  group('SignInEvent', () {
    const tUser = LocalUserModel.empty();
    blocTest<AuthBloc, AuthState>(
      'should emit [AuthLoading, SignedIn] when [SignInEvent] is added',
      build: () {
        when(
          () => signIn(any()),
        ).thenAnswer((invocation) async => const Right(tUser));
        return authBloc;
      },
      act: (bloc) => bloc.add(
        SignInEvent(
          email: tSignInParams.email,
          password: tSignInParams.password,
        ),
      ),
      expect: () => [
        const AuthLoading(),
        const SignedIn(tUser),
      ],
      verify: (_) {
        verify(() => signIn(tSignInParams)).called(1);
        verifyNoMoreInteractions(signIn);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'should emit [AuthLoading, AuthError] when signIn fails',
      build: () {
        when(() => signIn(any())).thenAnswer((_) async => Left(tServerFailure));
        return authBloc;
      },
      act: (bloc) => bloc.add(
        SignInEvent(
          email: tSignInParams.email,
          password: tSignInParams.password,
        ),
      ),
      expect: () => [
        const AuthLoading(),
        AuthError(tServerFailure.errorMessage),
      ],
      verify: (_) {
        verify(() => signIn(tSignInParams)).called(1);
        verifyNoMoreInteractions(signIn);
      },
    );
  });
}
