import 'package:flutter/material.dart';

class ViewFeedbackForms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("View Feedback Form")),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(title: Text('Comment'));
          },
        ));
  }
}
