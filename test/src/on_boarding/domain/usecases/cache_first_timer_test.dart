import 'package:clean_code_app/core/commons/errors/failures.dart';
import 'package:clean_code_app/src/on_boarding/domain/repositories/on_boarding_repository.dart';
import 'package:clean_code_app/src/on_boarding/domain/usecases/cache_first_timer.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'on_boarding_repository.mock.dart';

//TOASK: why is mocking the answer as a failure. if i call the cache first timer,
//and if it is, why it should answer e as error?
void main() {
  late OnBoardingRepository repository;
  late CacheFirstTimer usecase;

  setUp(() {
    repository = MockOnBoardingRepository();
    usecase = CacheFirstTimer(repository);
  });

  test(
    'should call the [OnBoardingRepository.cacheFirstTimer] successfully',
    () async {
      when(() => repository.cacheFirstTimer()).thenAnswer(
        (_) async => Left(
          ServerFailure(
            message: 'Unknown Error Occurred',
            statusCode: 500,
          ),
        ),
      );

      final result = await usecase();

      expect(
        result,
        equals(
          Left<Failure, dynamic>(
            ServerFailure(
              message: 'Unknown Error Occurred',
              statusCode: 500,
            ),
          ),
        ),
      );
      verify(() => repository.cacheFirstTimer()).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
