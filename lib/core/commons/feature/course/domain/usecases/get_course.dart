import 'package:clean_code_app/core/commons/feature/course/domain/entities/course.dart';
import 'package:clean_code_app/core/commons/feature/course/domain/repositories/course_repository.dart';
import 'package:clean_code_app/core/usecases/usecases.dart';
import 'package:clean_code_app/core/utils/typedefs.dart';

class GetCourses extends UsecaseWithoutParams<List<Course>> {
  const GetCourses(this._repo);

  final CourseRepository _repo;

  @override
  ResultFuture<List<Course>> call() async => _repo.getCourses();
}
