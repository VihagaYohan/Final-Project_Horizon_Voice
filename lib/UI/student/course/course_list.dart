import 'package:feedback_app/UI/student/course/course.dart';
import 'package:feedback_app/UI/student/course/course_details.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CourseListScreen extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Available Courses')),
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
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CourseDetailsScreen(course: course,)),
                      );
                    },
                    child: Container(
                      margin:EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                      decoration: BoxDecoration(
                        border:Border.all(width: 0.5,color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(10),),),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 32, horizontal: 16),
                            child:
                                Text(course.name, style: TextStyle(fontSize: 20)),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            color: Colors.purple.shade400,
                            child: Row(
                              children: [
                                Chip(
                                  label: Text(course.lecturer),
                                ),
                                SizedBox(width: 8,),
                                Chip(
                                  label: Text(course.courseCode),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                  // return ListTile(
                  //   title: Text(course.name),
                  //   subtitle: Text(course.lecturer),
                  //   leading: CircleAvatar(
                  //     child: Text(course.classCode,style: TextStyle(fontSize: 14),),
                  //   ),
                  //   trailing: Text(course.courseCode),
                  //   onTap: (){
                      //  Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => CourseDetailsScreen(course: course,)),
                      // );
                  //   },
                  // );
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
