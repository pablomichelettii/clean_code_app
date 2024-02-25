import 'package:clean_code_app/core/commons/errors/exceptions.dart';
import 'package:clean_code_app/core/commons/errors/failures.dart';
import 'package:clean_code_app/core/commons/feature/course/data/datasource/course_remote_data_source.dart';
import 'package:clean_code_app/core/commons/feature/course/domain/entities/course.dart';
import 'package:clean_code_app/core/commons/feature/course/domain/repositories/course_repository.dart';
import 'package:clean_code_app/core/utils/typedefs.dart';
import 'package:dartz/dartz.dart';

class CourseRepoImpl implements CourseRepository {
  const CourseRepoImpl(this._remoteDataSrc);

  final CourseRemoteDataSource _remoteDataSrc;

  @override
  ResultFuture<void> addCourse(Course course) async {
    try {
      await _remoteDataSrc.addCourse(course);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Course>> getCourses() async {
    try {
      final courses = await _remoteDataSrc.getCourses();
      return Right(courses);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
