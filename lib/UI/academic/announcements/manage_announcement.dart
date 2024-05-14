import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedback_app/widgets/elevated_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ManageAnnouncement extends StatefulWidget {
  @override
  State<ManageAnnouncement> createState() => _ManageAnnouncementState();
}

class _ManageAnnouncementState extends State<ManageAnnouncement> {
  final _formKey = GlobalKey<FormBuilderState>();
  final db = FirebaseFirestore.instance;

  String? _classCode; // To store the entered class code

  bool _selectAll = false; // To store whether "All" is selected or not

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Announcement'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'title',
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Announcement Title',
                  labelText: 'Title',
                ),
              ),
              SizedBox(
                height: 12,
              ),
              FormBuilderTextField(
                name: 'description',
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Announcement Description',
                  labelText: 'Description',
                ),
                maxLines: 3,
              ),
              SizedBox(
                height: 12,
              ),
              FormBuilderDropdown(
                name: 'type',
                decoration: InputDecoration(
                  labelText: 'Type',
                  border: OutlineInputBorder(),
                ),
                items: ['Event', 'Notice', 'Reminder']
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        ))
                    .toList(),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: FormBuilderTextField(
                      name: 'class_code',
                      decoration: InputDecoration(
                        labelText: 'Class Code',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          _classCode = newValue;
                        });
                      },
                      enabled: !_selectAll, // Disable when "All" is selected
                    ),
                  ),
                  SizedBox(width: 12),
                  Checkbox(
                    value: _selectAll,
                    onChanged: (newValue) {
                      setState(() {
                        _selectAll = newValue ?? false;
                        if (_selectAll) {
                          _classCode = null; // Clear class code if "All" is selected
                        }
                      });
                    },
                  ),
                  Text('All'),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Created Date: ${DateTime.now().toString()}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 12,
              ),
              UIButton(
                onPressed: () async {
                  if (_formKey.currentState!.saveAndValidate()) {
                    try {
                      await db.collection("announcements").add({
                        'title': _formKey.currentState!.value['title'],
                        'description':
                            _formKey.currentState!.value['description'],
                        'type': _formKey.currentState!.value['type'],
                        'class_code': _selectAll ? 'All' : _classCode,
                        'created_date': DateTime.now(),
                      });
                      Navigator.pop(context);
                    } catch (e) {
                      print(e);
                    }
                  }
                },
                label: 'Save',
              )
            ],
          ),
        ),
      ),
    );
  }
}
