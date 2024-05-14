import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ManageCourseMaterial extends StatefulWidget {
  final String courseId;
  final Map<String, dynamic>? material;

  ManageCourseMaterial({Key? key, required this.courseId, this.material})
      : super(key: key);

  @override
  State<ManageCourseMaterial> createState() => _ManageCourseMaterialState();
}

class _ManageCourseMaterialState extends State<ManageCourseMaterial> {
  final _formKey = GlobalKey<FormBuilderState>();
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Course Material'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: FormBuilder(
          key: _formKey,
          initialValue: widget.material ?? {},
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'title',
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Material Title',
                  labelText: 'Title',
                ),
              ),
              SizedBox(height: 12),
              FormBuilderTextField(
                name: 'link',
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'https://example.com',
                  labelText: 'Link',
                ),
              ),
              SizedBox(height: 12),
              FormBuilderTextField(
                name: 'instructions',
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Instructions (if any)',
                  labelText: 'Instructions',
                ),
              ),
              SizedBox(height: 12),
              FormBuilderDateTimePicker(
                name: 'created_at',
                inputType: InputType.date,
                decoration: InputDecoration(
                  labelText: 'Created At',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.saveAndValidate()) {
                    try {
                      Map<String, dynamic> data = {
                        ..._formKey.currentState!.value,
                        'course_id': widget.courseId,
                      };

                      if (widget.material != null) {
                        // If editing existing material
                        await db
                            .doc('courses/${widget.courseId}/materials/${widget.material!['id']}')
                            .update(data);
                      } else {
                        // If adding new material
                        await db.collection("courses/${widget.courseId}/materials").add(data);
                      }
                      Navigator.pop(context);
                    } catch (e) {
                      print(e);
                    }
                  }
                },
                child: Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
