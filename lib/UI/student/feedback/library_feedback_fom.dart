import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LibraryEvaluationForm extends StatefulWidget {
  @override
  State<LibraryEvaluationForm> createState() => _LibraryEvaluationForm();
}

class _LibraryEvaluationForm extends State<LibraryEvaluationForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Library Evaluation Form"),
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
                        hintText: 'Library materials availability',
                        labelText:
                            "1.	Are the required numbers of titles in your Subject available in the Library?",
                        labelStyle: TextStyle(fontSize: 18),
                        border: InputBorder.none),
                    name: 'Library materials availability ',
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
                        hintText: 'Availability of journals, magazines and Newspaper',
                        labelText: "2.	Are you satisfied with the available journals, magazines and Newspaper?",
                        labelStyle: TextStyle(fontSize: 18),
                        border: InputBorder.none),
                    name: 'Availability_of_journals_magazines_Newspaper',
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
                        hintText: 'Library shelves arrangement',
                        labelText: "3.	Are you satisfied with the arrangement of books in the Library shelves?",
                        labelStyle: TextStyle(fontSize: 18),
                        border: InputBorder.none),
                    name: 'Library shelves arrangement',
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
                        hintText: 'Reading space in the Library',
                        labelText: "4.	Are you satisfied with the available reading space in the Library?",
                        labelStyle: TextStyle(fontSize: 18),
                        border: InputBorder.none),
                    name: 'reading_space_int_the_library',
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
                        hintText: 'Library Staff cooperative',
                        labelText: "5.	Are the Library Staff cooperative and helpful?",
                        labelStyle: TextStyle(fontSize: 18),
                        border: InputBorder.none),
                    name: 'Library Staff cooperative',
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
                        hintText: 'Accessibility of e-resources inside the campus',
                        labelText: "6.	Are you satisfied with computer lab/Wi‐Fi network to access e-resources?",
                        labelStyle: TextStyle(fontSize: 18),
                        border: InputBorder.none),
                    name: 'Accessibility of e-resources inside the campus',
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
                        child: Text("Submit"))
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}
