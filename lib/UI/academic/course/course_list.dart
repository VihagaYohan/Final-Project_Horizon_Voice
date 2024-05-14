import 'package:feedback_app/UI/academic/course/course_details_acad.dart';
import 'package:feedback_app/UI/academic/course/manage_course.dart';
import 'package:feedback_app/UI/student/course/course.dart';
import 'package:feedback_app/UI/student/course/course_details.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CourseListAcadScreen extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Courses')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
           Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ManageCourse(
                                  course: Course(id: DateTime.timestamp().toString(),classCode: '',courseCode: '',lecturer: '',name: ''),
                                )));
        },
        label: Text('New Course'),
        icon: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: db.collection("courses").get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.size > 0) {
              return ListView.builder(
                itemCount: snapshot.data?.size,
                itemBuilder: (context, index) {
                  Course course =
                      Course.fromJson(snapshot.data!.docs[index].data());
                      print(course.name);
                  return ListTile(
                    title: Text(course.name),
                    subtitle: Text(course.courseCode),
                    leading: CircleAvatar(
                      child: Text(
                        course.classCode,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    trailing:IconButton(icon: Icon(Icons.edit),onPressed: (){
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ManageCourse(
                                  course: course,
                                )));
                    },),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CourseDetailsAcadScreen(
                                  course: course,
                                )),
                      );
                    },
                  );
                },
              );
            } else {
              return Center(child: Text('No Courses'));
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
