import 'package:feedback_app/UI/academic/academic_dashboard.dart';
import 'package:feedback_app/UI/authentication/registration_academic.dart';
import 'package:feedback_app/UI/student/student_dashboard.dart';
import 'package:feedback_app/widgets/elevated_botton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horizon Voice - Login'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: FormBuilder(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(width:250,height:250,child:Image.asset('images/hv_icon.png',),),
            SizedBox(
              height: 42,
            ),
            FormBuilderTextField(
              name: 'email',
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(),
                  label: Text('Email'),
                  hintText: 'xx00@horizoncampus.edu.lk'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email is required';
                } else if (value.contains('horizoncampus') == false) {
                  return 'Use your institute email address to register';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 12,
            ),
            FormBuilderTextField(
                name: 'password',
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                  label: Text('Password'),
                  hintText: 'Type a strong password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  } else if (value.length < 6) {
                    return 'Password must longer than 6 letters';
                  } else {
                    return null;
                  }
                }),
            SizedBox(
              height: 12,
            ),
            UIButton(
              label: 'Login',
              onPressed: () async {
                if (_formKey.currentState!.saveAndValidate()) {
                  String emailAddress =
                      _formKey.currentState?.value['email'] ?? '';
                  String password =
                      _formKey.currentState?.value['password'] ?? '';
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailAddress, password: password);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      _formKey.currentState?.fields['email']
                          ?.invalidate('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      _formKey.currentState?.fields['password']?.invalidate(
                          'Wrong password provided for that user.');
                    }
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Login faild try again.'),
                      ));
                  } catch (e) {
                    print(e);
                  }
                }
              },
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('New user?'),
                TextButton(
                  child: Text('Register'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
