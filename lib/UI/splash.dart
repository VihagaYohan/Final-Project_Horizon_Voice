import 'package:feedback_app/UI/academic/academic_dashboard.dart';
import 'package:feedback_app/UI/admin/admin_layout.dart';
import 'package:feedback_app/UI/authentication/login.dart';
import 'package:feedback_app/UI/student/student_dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFB19AB6),
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              User? u = snapshot.data;
              if (u != null) {
                if (u.email != null && u.email!.contains('staff')) {
                  return AcademicDashboard();
                } else if (u.email != null && u.email!.contains('admin')) {
                  return AdminLayout();
                } else {
                  return StudentDashboard();
                }
              } else {
                return Login();
              }
            } else {
              return Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/hv_icon.png'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "HorizonVoice",
                          style: TextStyle(fontSize: 24),
                        ),
                      )
                    ]),
              );
            }
          },
        ));
  }
}
