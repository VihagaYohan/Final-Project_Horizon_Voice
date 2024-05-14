import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CourseEvaluationForm extends StatefulWidget {
  @override
  State<CourseEvaluationForm> createState() => _CourseEvaluationForm();
}

class _CourseEvaluationForm extends State<CourseEvaluationForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Evaluation Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormBuilder(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              FormBuilderTextField(
                name: 'faculty',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your faculty",
                  labelText: "Faculty",
                ),
              ),
              const SizedBox(
                height: 8,
              ),

              FormBuilderTextField(
                name: 'Intake',
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Lecturer Intake",
                    labelText: "Intake"),
              ),
              const SizedBox(
                height: 8,
              ),

              FormBuilderTextField(
                name: 'Lecturer',
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Lecturer Name",
                    labelText: "Lecturer"),
              ),
              const SizedBox(
                height: 8,
              ),

              FormBuilderTextField(
                name: 'Course',
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Course Name",
                    labelText: "Course"),
              ),
              const SizedBox(
                height: 8,
              ),

              const Text(
                "Select Options",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                  "Instructions: Please provide a rating between 1 and 5 to all the pedagogical dimensions mentioned below. The representative values of 1-5 are as follows. "),
              const Text(
                  " 5 - Strongly agree \n 4 - Agree \n 3 - Neither agree nor disagree \n 2 - Disagree\n 1 - Strongly disagree "),
              const SizedBox(
                height: 8,
              ),

              // Radio Question Start
              FormBuilderRadioGroup(
                  decoration: const InputDecoration(
                      hintText: 'Appropriate course content',
                      labelText:
                          "1.	The course content was appropriate to the expected goals set",
                      labelStyle: TextStyle(fontSize: 18),
                      border: InputBorder.none),
                  name: 'Appropriate course content',
                  options: const [
                    FormBuilderFieldOption(
                      value: 0,
                      child: Text("0"),
                    ),
                    FormBuilderFieldOption(
                      value: 1,
                      child: Text("1"),
                    ),
                    FormBuilderFieldOption(
                      value: 2,
                      child: Text("2"),
                    ),
                    FormBuilderFieldOption(
                      value: 3,
                      child: Text("3"),
                    ),
                    FormBuilderFieldOption(
                      value: 4,
                      child: Text("4"),
                    ),
                    FormBuilderFieldOption(
                      value: 5,
                      child: Text("5"),
                    ),
                  ]),
              // Radio Question Ends
              const SizedBox(
                height: 8,
              ),

              // Radio Question Start
              FormBuilderRadioGroup(
                  decoration: const InputDecoration(
                      hintText: 'Student knowledge of the subject matter',
                      labelText:
                          "2.	The course increased Student knowledge of the subject matter?",
                      labelStyle: TextStyle(fontSize: 18),
                      border: InputBorder.none),
                  name: 'Student knowledge of the subject matter',
                  options: const [
                    FormBuilderFieldOption(
                      value: 0,
                      child: Text("0"),
                    ),
                    FormBuilderFieldOption(
                      value: 1,
                      child: Text("1"),
                    ),
                    FormBuilderFieldOption(
                      value: 2,
                      child: Text("2"),
                    ),
                    FormBuilderFieldOption(
                      value: 3,
                      child: Text("3"),
                    ),
                    FormBuilderFieldOption(
                      value: 4,
                      child: Text("4"),
                    ),
                    FormBuilderFieldOption(
                      value: 5,
                      child: Text("5"),
                    ),
                  ]),
              // Radio Question Ends
              const SizedBox(
                height: 8,
              ),

              FormBuilderRadioGroup(
                  decoration: const InputDecoration(
                      hintText: 'student interest in the subject matter',
                      labelText:
                          "3.	The course increased student interest in the subject matter?",
                      labelStyle: TextStyle(fontSize: 18),
                      border: InputBorder.none),
                  name: 'student interest in the subject matter',
                  options: const [
                    FormBuilderFieldOption(
                      value: 0,
                      child: Text("0"),
                    ),
                    FormBuilderFieldOption(
                      value: 1,
                      child: Text("1"),
                    ),
                    FormBuilderFieldOption(
                      value: 2,
                      child: Text("2"),
                    ),
                    FormBuilderFieldOption(
                      value: 3,
                      child: Text("3"),
                    ),
                    FormBuilderFieldOption(
                      value: 4,
                      child: Text("4"),
                    ),
                    FormBuilderFieldOption(
                      value: 5,
                      child: Text("5"),
                    ),
                  ]),
              // Radio Question Ends
              const SizedBox(
                height: 8,
              ),

              FormBuilderRadioGroup(
                  decoration: const InputDecoration(
                      hintText: 'Course was reasonable and appropriate',
                      labelText:
                          "4.	The workload in this course was reasonable and appropriate ?",
                      labelStyle: TextStyle(fontSize: 18),
                      border: InputBorder.none),
                  name: 'Course was reasonable and appropriate',
                  options: const [
                    FormBuilderFieldOption(
                      value: 0,
                      child: Text("0"),
                    ),
                    FormBuilderFieldOption(
                      value: 1,
                      child: Text("1"),
                    ),
                    FormBuilderFieldOption(
                      value: 2,
                      child: Text("2"),
                    ),
                    FormBuilderFieldOption(
                      value: 3,
                      child: Text("3"),
                    ),
                    FormBuilderFieldOption(
                      value: 4,
                      child: Text("4"),
                    ),
                    FormBuilderFieldOption(
                      value: 5,
                      child: Text("5"),
                    ),
                  ]),
              // Radio Question Ends
              const SizedBox(
                height: 8,
              ),

              FormBuilderRadioGroup(
                  decoration: const InputDecoration(
                      hintText: 'Class size was appropriate',
                      labelText: "5.	The class size was appropriate?",
                      labelStyle: TextStyle(fontSize: 18),
                      border: InputBorder.none),
                  name: 'Class size was appropriate',
                  options: const [
                    FormBuilderFieldOption(
                      value: 0,
                      child: Text("0"),
                    ),
                    FormBuilderFieldOption(
                      value: 1,
                      child: Text("1"),
                    ),
                    FormBuilderFieldOption(
                      value: 2,
                      child: Text("2"),
                    ),
                    FormBuilderFieldOption(
                      value: 3,
                      child: Text("3"),
                    ),
                    FormBuilderFieldOption(
                      value: 4,
                      child: Text("4"),
                    ),
                    FormBuilderFieldOption(
                      value: 5,
                      child: Text("5"),
                    ),
                  ]),
              // Radio Question Ends
              const SizedBox(
                height: 8,
              ),

              FormBuilderRadioGroup(
                  decoration: const InputDecoration(
                      hintText: 'recommend the course to other students',
                      labelText:
                          "6.	I would recommend this course to other students?",
                      labelStyle: TextStyle(fontSize: 18),
                      border: InputBorder.none),
                  name: 'recommend the course to other students',
                  options: const [
                    FormBuilderFieldOption(
                      value: 0,
                      child: Text("0"),
                    ),
                    FormBuilderFieldOption(
                      value: 1,
                      child: Text("1"),
                    ),
                    FormBuilderFieldOption(
                      value: 2,
                      child: Text("2"),
                    ),
                    FormBuilderFieldOption(
                      value: 3,
                      child: Text("3"),
                    ),
                    FormBuilderFieldOption(
                      value: 4,
                      child: Text("4"),
                    ),
                    FormBuilderFieldOption(
                      value: 5,
                      child: Text("5"),
                    ),
                  ]),
              // Radio Question Ends
              const SizedBox(
                height: 8,
              ),

              // Radio Question Ends
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: Text("Submit"))
            ]),
          ),
        ),
      ),
    );
  }
}
