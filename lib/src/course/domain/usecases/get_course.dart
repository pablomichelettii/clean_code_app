import 'package:clean_code_app/core/usecases/usecases.dart';
import 'package:clean_code_app/core/utils/typedefs.dart';
import 'package:clean_code_app/src/course/domain/entities/course.dart';
import 'package:clean_code_app/src/course/domain/repositories/course_repository.dart';

class GetCourses extends UsecaseWithoutParams<List<Course>> {
  const GetCourses(this._repo);

  final CourseRepository _repo;

  @override
  ResultFuture<List<Course>> call() async => _repo.getCourses();
}
