import 'package:clean_code_app/core/commons/errors/exceptions.dart';
import 'package:clean_code_app/core/commons/errors/failures.dart';
import 'package:clean_code_app/src/on_boarding/data/datasources/on_boarding_local_datasource.dart';
import 'package:clean_code_app/src/on_boarding/data/repositories/on_boarding_repository_implementation.dart';
import 'package:clean_code_app/src/on_boarding/domain/repositories/on_boarding_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockOnBoardingLocalDataSouece extends Mock
    implements OnBoardingLocalDataSource {}

void main() {
  late OnBoardingLocalDataSource localDataSource;
  late OnBoardingRepositoryImpl repositoryImpl;

  setUp(() {
    localDataSource = MockOnBoardingLocalDataSouece();
    repositoryImpl = OnBoardingRepositoryImpl(localDataSource);
  });

  test('should be a subclass of [OnboardingRepository]', () {
    expect(repositoryImpl, isA<OnBoardingRepository>());
  });

  group('cacheFirstTimer', () {
    test('should complete succesfully when call to local source is successful',
        () async {
      when(() => localDataSource.cacheFirstTimer()).thenAnswer(
        (_) async => Future.value(),
      );

      final result = await repositoryImpl.cacheFirstTimer();

      expect(result, equals(const Right<dynamic, void>(null)));
      verify(() => localDataSource.cacheFirstTimer());
      verifyNoMoreInteractions(localDataSource);
    });

    test(
        'should return [CacheFailure] when call to local source is unsuccessful',
        () async {
      when(() => localDataSource.cacheFirstTimer()).thenThrow(
        const CacheException(message: 'Insufficent storage'),
      );

      final result = await repositoryImpl.cacheFirstTimer();

      expect(
        result,
        Left<CacheFailure, dynamic>(
          CacheFailure(message: 'Insufficent storage', statusCode: 500),
        ),
      );
      verify(() => localDataSource.cacheFirstTimer());
      verifyNoMoreInteractions(localDataSource);
    });
  });

  group('checkIfUserIsFirstTimer', () {
    test(
      'should return true when user is first timer',
      () async {
        when(() => localDataSource.checkIfUserIsFirstTimer())
            .thenAnswer((_) async => Future.value(true));

        final result = await repositoryImpl.checkIfUserIsFirstTimer();

        expect(result, equals(const Right<dynamic, bool>(true)));

        verify(() => localDataSource.checkIfUserIsFirstTimer()).called(1);

        verifyNoMoreInteractions(localDataSource);
      },
    );

    test(
      'should return false when user is not first timer',
      () async {
        when(() => localDataSource.checkIfUserIsFirstTimer())
            .thenAnswer((_) async => Future.value(false));

        final result = await repositoryImpl.checkIfUserIsFirstTimer();

        expect(result, equals(const Right<dynamic, bool>(false)));

        verify(() => localDataSource.checkIfUserIsFirstTimer()).called(1);

        verifyNoMoreInteractions(localDataSource);
      },
    );

    test(
      'should return a CacheFailure when call to local data source '
      'is unsuccessful',
      () async {
        when(() => localDataSource.checkIfUserIsFirstTimer()).thenThrow(
          const CacheException(
            message: 'Insufficient permissions',
            statusCode: 403,
          ),
        );

        final result = await repositoryImpl.checkIfUserIsFirstTimer();

        expect(
          result,
          equals(
            Left<CacheFailure, bool>(
              CacheFailure(
                message: 'Insufficient permissions',
                statusCode: 403,
              ),
            ),
          ),
        );

        verify(() => localDataSource.checkIfUserIsFirstTimer()).called(1);

        verifyNoMoreInteractions(localDataSource);
      },
    );
  });
}
