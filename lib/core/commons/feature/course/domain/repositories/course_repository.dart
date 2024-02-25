import 'package:clean_code_app/core/commons/feature/course/domain/entities/course.dart';
import 'package:clean_code_app/core/utils/typedefs.dart';

abstract class CourseRepository {
  const CourseRepository();

  ResultFuture<List<Course>> getCourses();

  ResultFuture<void> addCourse(Course course);
}
