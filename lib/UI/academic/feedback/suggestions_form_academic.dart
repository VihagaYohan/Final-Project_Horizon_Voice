import 'package:flutter/material.dart';

class SuggestionsFormAcademic extends StatefulWidget {
  @override
  State<SuggestionsFormAcademic> createState() => _SuggestionsFormAcademic();
}

class _SuggestionsFormAcademic extends State<SuggestionsFormAcademic> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suggestions Form Academic"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Faculty is required";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your faculty",
                    labelText: "Faculty"),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Intkae is required';
                  }
                  if (value == "AL") {
                    return 'Cannot type AL';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "02",
                    labelText: "Intake"),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                validator: (value) {
                  if (value == "AL") {
                    return 'Cannot type AL';
                  }
                  return null;
                },
                maxLines: 10,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your comment here",
                    labelText: "Comment"),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: Text("Submit"),),
                      
            ],
          ),
        ),
      ),
    );
  }
}
