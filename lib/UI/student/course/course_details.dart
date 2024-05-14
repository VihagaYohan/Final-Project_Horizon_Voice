import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedback_app/UI/student/course/course.dart';
import 'package:feedback_app/UI/student/course/course_material.dart';
import 'package:flutter/material.dart';

class CourseDetailsScreen extends StatelessWidget {
  final Course course;

  CourseDetailsScreen({super.key, required this.course});

  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(course.name),
          actions: [
            Chip(
              label: Text(course.lecturer),
            )
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
                    CourseMaterial courseMat = CourseMaterial.fromJson(
                        snapshot.data!.docs[index].data());
                    return ListTile(
                      leading:Text('${index+1}'),
                      title: Text(courseMat.title),
                      subtitle: Text(courseMat.instructions),
                      trailing: IconButton(
                        icon: Icon(Icons.open_in_new),
                        onPressed: () {},
                      ),
                    );
                  });
            } else {
              return Center(child: Text('No content available'));
            }
          },
        ));
  }
}
