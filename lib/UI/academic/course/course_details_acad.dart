import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedback_app/UI/student/course/course.dart';
import 'package:feedback_app/UI/student/course/course_material.dart';
import 'package:flutter/material.dart';
import 'package:feedback_app/UI/academic/course/manage_course_material.dart';

class CourseDetailsAcadScreen extends StatelessWidget {
  final Course course;

  CourseDetailsAcadScreen({Key? key, required this.course}) : super(key: key);

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.name),
        actions: [
          Chip(
            label: Text(course.lecturer),
          ),
          SizedBox(width: 16,)
        ],
      ),
      body: FutureBuilder(
        future: db.collection("courses/${course.id}/materials").get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                CourseMaterial courseMat =
                    CourseMaterial.fromJson(snapshot.data!.docs[index].data());
                return ListTile(
                  leading: Text('${index + 1}'),
                  title: Text(courseMat.title),
                  subtitle: Text(courseMat.instructions),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ManageCourseMaterial(
                              courseId: course.id,
                              material: {
                                ...snapshot.data!.docs[index].data(),
                                'created_at': courseMat.createdAt.toDate()
                              }),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No content available'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('New Material'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ManageCourseMaterial(courseId: course.id),
            ),
          );
        },
        icon: Icon(Icons.add),
      ),
    );
  }
}
