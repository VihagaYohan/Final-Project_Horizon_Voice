import 'package:feedback_app/widgets/elevated_botton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: FormBuilder(
          key: _formKey,
          initialValue: {
            'displayName': FirebaseAuth.instance.currentUser?.displayName ?? '',
            'email': FirebaseAuth.instance.currentUser?.email ?? '',
            'photoUrl': FirebaseAuth.instance.currentUser?.photoURL ?? '',
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                foregroundImage: NetworkImage(
                    FirebaseAuth.instance.currentUser?.photoURL ??
                        'https://placehold.co/512'),
                minRadius: 50,
              ),
              SizedBox(height: 20),
              FormBuilderTextField(
                name: 'displayName',
                decoration: InputDecoration(
                    labelText: 'Display Name', border: OutlineInputBorder()),
              ),
              SizedBox(height: 12),
              FormBuilderTextField(
                name: 'email',
                decoration: InputDecoration(
                    labelText: 'Email', border: OutlineInputBorder()),
              ),
              SizedBox(height: 12),
              FormBuilderTextField(
                name: 'photoUrl',
                decoration: InputDecoration(
                    labelText: 'Photo URL', border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              UIButton(
                onPressed: () async {
                  if (_formKey.currentState!.saveAndValidate()) {
                    try {
                      User? user = FirebaseAuth.instance.currentUser;
                      await user!.updateDisplayName(
                          _formKey.currentState!.value['displayName']);
                      await user
                          .updateEmail(_formKey.currentState!.value['email']);
                      await user.updatePhotoURL(
                          _formKey.currentState!.value['photoUrl']);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Profile updated successfully'),
                      ));
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Failed to update profile: $e'),
                      ));
                    }
                  }
                },
                label: 'Save',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
