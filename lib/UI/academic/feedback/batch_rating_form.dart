import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class BatchRatingForm extends StatefulWidget {
  @override
  State<BatchRatingForm> createState() => _BatchRatingForm();
}

class _BatchRatingForm extends State<BatchRatingForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BatchRatingForm'),
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
                      hintText: "Enter your Intake",
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
                        hintText: 'Students background knowledge',
                        labelText:
                            "1.	1.	The students have sufficient background knowledge about academic skills and intellectual development ",
                        labelStyle: TextStyle(fontSize: 18),
                        border: InputBorder.none),
                    name: 'Students background knowledge',
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
                        hintText: 'Students prepared to acquire new knowledge',
                        labelText:
                            "2. The students feel that they are prepared to acquire new knowledge based on their self-assessment of learning skills?",
                        labelStyle: TextStyle(fontSize: 18),
                        border: InputBorder.none),
                    name: 'Students prepared to acquire new knowledge',
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
                        hintText: 'commitment and contribution of students',
                        labelText:
                            "3. The Student commitment and contribution for their academic work. ",
                        labelStyle: TextStyle(fontSize: 18),
                        border: InputBorder.none),
                    name: 'commitment and contribution of students',
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
                        hintText: 'Actively participating in teamwork',
                        labelText:
                            "4.	The students are actively participating and contribute in teamwork.",
                        labelStyle: TextStyle(fontSize: 18),
                        border: InputBorder.none),
                    name: 'Actively participating in teamwork',
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
                        hintText: 'Students talent',
                        labelText:
                            "5.	The overall talent level of the students.",
                        labelStyle: TextStyle(fontSize: 18),
                        border: InputBorder.none),
                    name: 'Students talent',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
