import 'package:clean_code_app/core/usecases/usecases.dart';
import 'package:clean_code_app/core/utils/typedefs.dart';
import 'package:clean_code_app/src/course/domain/entities/course.dart';
import 'package:clean_code_app/src/course/domain/repositories/course_repository.dart';

class AddCourse extends UsecaseWithParams<void, Course> {
  const AddCourse(this._repo);

  final CourseRepository _repo;

  @override
  ResultFuture<void> call(Course params) async => _repo.addCourse(params);
}
