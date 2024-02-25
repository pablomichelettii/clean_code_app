import 'package:clean_code_app/core/commons/feature/course/domain/entities/course.dart';
import 'package:clean_code_app/core/commons/feature/course/domain/repositories/course_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:clean_code_app/core/commons/feature/course/domain/usecases/add_course.dart';

import 'course_repository.mock.dart';

void main() {
  late CourseRepository repo;
  late AddCourse usecase;

  final tCourse = Course.empty();

  setUp(() {
    repo = MockCourseRepo();
    usecase = AddCourse(repo);
    registerFallbackValue(tCourse);
  });

  test(
    'should call [CourseRepo.addCourse]',
    () async {
      // arrange
      when(() => repo.addCourse(any()))
          .thenAnswer((_) async => const Right(null));
      // act
      await usecase.call(tCourse);
      // assert
      verify(() => repo.addCourse(tCourse)).called(1);
      verifyNoMoreInteractions(repo);
    },
  );
}
