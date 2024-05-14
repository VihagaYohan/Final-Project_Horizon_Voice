import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class InstructionsFeedbackForm extends StatefulWidget {
  @override
  State<InstructionsFeedbackForm> createState() => _AcademicFeedbackFormState();
}

class _AcademicFeedbackFormState extends State<InstructionsFeedbackForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instructions Feedback Form'),
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
                        hintText: 'Satisfactory level of Website/Social Media',
                        labelText: "1.	Are you satisfied with the Website/Social Media presence of the institution?",
                        labelStyle: TextStyle(fontSize: 18),
                        border: InputBorder.none),
                    name: 'Satisfactory level of Website/Social Media',
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
                        hintText: 'Library',
                        labelText: "2.How would you rate the adequacy of the library's collection and resources for your academic needs?",
                        labelStyle: TextStyle(fontSize: 18),
                        border: InputBorder.none),
                    name: 'Library',
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
                        hintText: 'Lab',
                        labelText: "3.How would you rate the quality and availability of equipment in the lab ? ",
                        labelStyle: TextStyle(fontSize: 18),
                        border: InputBorder.none),
                    name: 'Lab',
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
                        hintText: 'Canteen facility',
                        labelText: "4.	How satisfied are you with the variety and quality of food offered in the canteen? ",
                        labelStyle: TextStyle(fontSize: 18),
                        border: InputBorder.none),
                    name: 'Canteen facility',
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
                        hintText: 'Sanitation and Cleanliness',
                        labelText: "How would you rate the overall cleanliness and maintenance of the campus facilities, including restrooms and common areas?",
                        labelStyle: TextStyle(fontSize: 18),
                        border: InputBorder.none),
                    name: 'Sanitation and Cleanlinessy',
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
                        hintText: 'Classrooms',
                        labelText: "6.	Rate the following aspects of the institution's infrastructure ",
                        labelStyle: TextStyle(fontSize: 18),
                        border: InputBorder.none),
                    name: 'Classrooms',
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
                        hintText: 'Sports and other activities',
                        labelText: "7.	The Sports and other activities provided by your institute ",
                        labelStyle: TextStyle(fontSize: 18),
                        border: InputBorder.none),
                    name: 'Sports and other activities',
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
                        hintText: 'Satisfied with the security staff ',
                        labelText: "8. Are you satisfied with the security staff at the institution? ",
                        labelStyle: TextStyle(fontSize: 18),
                        border: InputBorder.none),
                    name: 'Satisfied with the security staff ',
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
                        hintText: 'recommend',
                        labelText: "9.	Would you recommend your institute to others?",
                        labelStyle: TextStyle(fontSize: 18),
                        border: InputBorder.none),
                    name: 'recommend',
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
                        hintText: 'How to improve',
                        labelText: "10.	How can your institute improve? ",
                        labelStyle: TextStyle(fontSize: 18),
                        border: InputBorder.none),
                    name: 'How to improve',
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
      
              ],
            ),
          ),
        ),
      ),
    );
  }
}
