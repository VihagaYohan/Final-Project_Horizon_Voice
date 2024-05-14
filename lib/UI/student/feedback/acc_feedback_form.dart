import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AcademicFeedbackForm extends StatefulWidget {
  @override
  State<AcademicFeedbackForm> createState() => _AcademicFeedbackFormState();
}

class _AcademicFeedbackFormState extends State<AcademicFeedbackForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lecturer Evaluation"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormBuilder(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormBuilderTextField(
                    name: 'faculty',
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter your faculty",
                        labelText: "Faculty"),
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  FormBuilderTextField(
                    name: 'Semester',
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter your Semester",
                        labelText: "Semester"),
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  FormBuilderTextField(
                    name: 'Subject',
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter your Subject",
                        labelText: "Subject"),
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  FormBuilderTextField(
                    name: 'lecturer',
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter lecturer's name",
                        labelText: "Lecturer"),
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  FormBuilderTextField(
                    name: 'Intake',
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter your Intake",
                        labelText: "Intake"),
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
                  
                  // Radio Question Ends
                  const SizedBox(
                    height: 8,
                  ),
                  FormBuilderRadioGroup(
                      decoration: const InputDecoration(
                          hintText: 'Learning outcomes/work plan',
                          labelText:
                              "1.	The learning outcomes/work plan were clearly explained at the commencement of the course.",
                          border: InputBorder.none),
                      name: 'Learning outcomes/work plan',
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
                  const SizedBox(
                    height: 8,
                  ),
                  // Radio Question Start
                  FormBuilderRadioGroup(
                      decoration: const InputDecoration(
                          hintText: 'Confidence of the lecturer',
                          labelText:
                              "2.	The lecturer was confident in teaching the subject",
                          labelStyle: TextStyle(fontSize: 18),
                          border: InputBorder.none),
                      name: 'Confidence of the lecturer',
                      options: const [
                        FormBuilderFieldOption(
                          value: 0,
                          child:
                              Icon(Icons.mood, size: 30, color: Colors.green),
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

                  const SizedBox(
                    height: 8,
                  ),
                  // Radio Question Start
                  FormBuilderRadioGroup(
                      decoration: const InputDecoration(
                          hintText: 'Preparation of the lecturer',
                          labelText:
                              "3.	The lecturer was well prepared for the lecture",
                          labelStyle: TextStyle(fontSize: 18),
                          border: InputBorder.none),
                      name: 'Preparation of the lecturer',
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

                  const SizedBox(
                    height: 8,
                  ),
                  // Radio Question Start
                  FormBuilderRadioGroup(
                      decoration: const InputDecoration(
                          hintText: 'Speed of the lecture',
                          labelText:
                              "4.	The lectures were conducted at an acceptable speed.",
                          labelStyle: TextStyle(fontSize: 18),
                          border: InputBorder.none),
                      name: 'Speed of the lecture',
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

                  const SizedBox(
                    height: 8,
                  ),
                  // Radio Question Start
                  FormBuilderRadioGroup(
                      decoration: const InputDecoration(
                          hintText: 'Student interaction during the lecture',
                          labelText:
                              "5.	Students were encouraged to ask questions.",
                          labelStyle: TextStyle(fontSize: 18),
                          border: InputBorder.none),
                      name: 'Student interaction during the lecture',
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

                  const SizedBox(
                    height: 8,
                  ),
                  // Radio Question Start
                  FormBuilderRadioGroup(
                      decoration: const InputDecoration(
                          hintText: 'The subject explanation',
                          labelText:
                              "6.	The lecturer explained the subject matter clearly.",
                          labelStyle: TextStyle(fontSize: 18),
                          border: InputBorder.none),
                      name: 'The subject explanation',
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

                  const SizedBox(
                    height: 8,
                  ),
                  // Radio Question Start
                  FormBuilderRadioGroup(
                      decoration: const InputDecoration(
                          hintText: 'Effectiveness of the lecture time',
                          labelText:
                              "7.	The lecturer used lecture time effectively.",
                          labelStyle: TextStyle(fontSize: 18),
                          border: InputBorder.none),
                      name: 'Effectiveness of the lecture time',
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

                  const SizedBox(
                    height: 8,
                  ),
                  // Radio Question Start
                  FormBuilderRadioGroup(
                      decoration: const InputDecoration(
                          hintText: 'The friendliness of the lecturer',
                          labelText:
                              "8.	The lecturer was friendly towards/approachable with the students..",
                          labelStyle: TextStyle(fontSize: 18),
                          border: InputBorder.none),
                      name: 'The friendliness of the lecturer',
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

                  const SizedBox(
                    height: 8,
                  ),
                  // Radio Question Start
                  FormBuilderRadioGroup(
                      decoration: const InputDecoration(
                          hintText: 'Lecture materials',
                          labelText:
                              "9.	The lecturer uploaded lecture materials in the Learning Management System (LMS) on time",
                          labelStyle: TextStyle(fontSize: 18),
                          border: InputBorder.none),
                      name: 'Lecture materials',
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
                  // FormBuilderTextField(
                  //   name: 'comment',
                  //   decoration: InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       hintText: 'Enter comment',
                  //       label: Text('Comment')),
                  //   maxLines: 10,
                  // ),
                  const SizedBox(
                    height: 8,
                  ),
                  // Radio Question Start
                  FormBuilderRadioGroup(
                      validator: (value) {
                        if (value == 0) {
                          return 'Please do not select 0';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'The technology used during lecture',
                          labelText:
                              "10.	The technology used was appropriate for this lectures (Online/ physical white board, handouts, specimens, videos etc.)",
                          labelStyle: TextStyle(fontSize: 18),
                          border: InputBorder.none),
                      name: 'The technology used during lecture',
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
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: Text("Submit"),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
