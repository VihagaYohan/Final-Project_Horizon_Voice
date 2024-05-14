import 'package:feedback_app/widgets/elevated_botton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Horizon Voice - Register'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Container(width:250,height:250,child:Image.asset('images/hv_icon.png',),),
                SizedBox(height: 42,),
                FormBuilderTextField(
                  name: 'email',
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(),
                      label: Text('Email'),
                      hintText: 'xx00@staff.horizoncampus.edu.lk'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    } else if (value.contains('staff') == false) {
                      return 'Registration available only for staff';
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
                FormBuilderTextField(
                  name: 'conf_password',
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password_outlined),
                    border: OutlineInputBorder(),
                    label: Text('Confirm Password'),
                    hintText: 'Confirm your password',
                  ),
                  validator:(value) {
                     if (value == null || value.isEmpty) {
                      return 'Confirm Password is required';
                    }else if (_formKey.currentState?.value['password'] != value) {
                      return 'Password confirmation faild.';
                    } else {
                      return null;
                    }
                  }
                ),
                SizedBox(
                  height: 12,
                ),
                UIButton(
                  label: 'Register',
                  onPressed: () async {
                    if (_formKey.currentState!.saveAndValidate()) {
                      String emailAddress =
                          _formKey.currentState?.value['email'] ?? '';
                      String password =
                          _formKey.currentState?.value['password'] ?? '';
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: emailAddress,
                          password: password,
                        );
                        Navigator.pop(context);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          _formKey.currentState?.fields['password']
                              ?.invalidate('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          _formKey.currentState?.fields['email']?.invalidate(
                              'The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                ),
              ]),
            ),
          ),
        ));
  }
}
