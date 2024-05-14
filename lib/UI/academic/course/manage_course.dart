import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedback_app/UI/academic/course/course_list.dart';
import 'package:feedback_app/UI/student/course/course.dart';
import 'package:feedback_app/widgets/elevated_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ManageCourse extends StatefulWidget {
  Course? course;

  ManageCourse({super.key, this.course});

  @override
  State<ManageCourse> createState() => _ManageCourseState();
}

class _ManageCourseState extends State<ManageCourse> {
  final _formKey = GlobalKey<FormBuilderState>();
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('${widget.course != null ? 'Manage' : 'Edit'} Course')),
        body: Container(
          padding: EdgeInsets.all(16),
          child: FormBuilder(
              key: _formKey,
              initialValue: widget.course!.toJson(),
              child: Column(
                children: [
                  FormBuilderTextField(
                      name: 'name',
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Computer Science',
                          label: Text('Course Name'))),
                  SizedBox(
                    height: 12,
                  ),
                  FormBuilderTextField(
                      name: 'course_code',
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'CS 101',
                          label: Text('Course Code'))),
                  SizedBox(
                    height: 12,
                  ),
                  FormBuilderTextField(
                      name: 'class_code',
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'IC21',
                          label: Text('Class Code'))),
                  SizedBox(
                    height: 12,
                  ),
                  FormBuilderTextField(
                      name: 'lecturer',
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'John',
                          label: Text('Lecturer'))),
                  SizedBox(
                    height: 12,
                  ),
                  UIButton(
                      label: 'Save',
                      onPressed: () async {
                        if (_formKey.currentState!.saveAndValidate()) {
                          try {
                            Course c =
                              Course.fromJson({..._formKey.currentState!.value,'id':widget.course!.id});
                          await db
                              .collection("courses")
                              .doc(widget.course!.id)
                              .set(c.toJson());
                              Navigator.pop(context);
                          } catch(e) {
                            print(e);
                          }
                        }
                      })
                ],
              )),
        ));
  }
}
