import 'package:clean_code_app/core/commons/errors/exceptions.dart';
import 'package:clean_code_app/core/commons/errors/failures.dart';
import 'package:clean_code_app/src/on_boarding/data/datasources/on_boarding_local_datasource.dart';
import 'package:clean_code_app/src/on_boarding/data/repositories/on_boarding_repository_implementation.dart';
import 'package:clean_code_app/src/on_boarding/domain/repositories/on_boarding_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

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

      expect(result, equals(const Right<dynamic, void>(null)));
      verify(() => localDataSource.cacheFirstTimer());
      verifyNoMoreInteractions(localDataSource);
    });
  });
}
