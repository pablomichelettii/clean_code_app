import 'package:clean_code_app/src/course/domain/entities/course.dart';
import 'package:flutter/material.dart';

class HomeSubjects extends StatelessWidget {
  const HomeSubjects({required this.courses, super.key});

  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
    // return Column(
    //   mainAxisSize: MainAxisSize.min,
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     SectionHeader(
    //       sectionTitle: 'Courses',
    //       seeAll: courses.length > 4,
    //       onSeeAll: () => context.push(AllCoursesView(courses)),
    //     ),
    //     const Text(
    //       'Explore our courses',
    //       style: TextStyle(
    //         fontWeight: FontWeight.w500,
    //         color: Colours.neutralTextColour,
    //       ),
    //     ),
    //     const SizedBox(height: 20),
    //     Row(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: courses
    //           .take(4)
    //           .map(
    //             (course) => CourseTile(
    //               course: course,
    //               onTap: () => Navigator.of(context).pushNamed(
    //                 CourseDetailsScreen.routeName,
    //                 arguments: course,
    //               ),
    //             ),
    //           )
    //           .toList(),
    //     ),
    //   ],
    // );
  }
}
