import 'package:feedback_app/UI/academic/announcements/announcements.dart';
import 'package:feedback_app/UI/academic/course/course_list.dart';
import 'package:feedback_app/UI/academic/feedback/institution_feedback_form_academic.dart';
import 'package:feedback_app/UI/academic/feedback/suggestions_form_academic.dart';
import 'package:feedback_app/UI/academic/feedback/batch_rating_form.dart';
import 'package:feedback_app/UI/academic/feedback/course_evaluation_form.dart';
import 'package:feedback_app/UI/student/feedback/feedback_scaffold.dart';
import 'package:feedback_app/UI/student/profile/profile_view_update.dart';
import 'package:feedback_app/config/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:feedback_app/widgets/dashboard_tile.dart';

class AcademicDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Academic Dashboard".toUpperCase()),
        actions: [
          IconButton(
            icon: CircleAvatar(
              foregroundImage: NetworkImage(
                FirebaseAuth.instance.currentUser?.photoURL ?? 'https://placehold.co/512',
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfileScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.logout_outlined),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          )
        ],
      ),
      backgroundColor: Color(0xFFB19AB6), // Set background color here
      body: SingleChildScrollView(
        child: GridView.count(
            padding: EdgeInsets.all(64),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
          children: [
            DashboardTile(
              text: 'Courses',
              icon: Icon(Icons.dashboard),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CourseListAcadScreen()),
                );
              },
            ),
            DashboardTile(
              text: 'Announcements',
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnnouncementListAcadScreen()),
                );
              },
            ),
        
            DashboardTile(
            text: 'Institute Evaluation',
            icon: Icon(Icons.comment_bank),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FeedbackForm(
                          appBarTitle: 'Institution Evaluation',
                          questions: AppConfigs.inst_staff_questions,
                          firebaseCollection: 'institute_evaluation_staff',
                        )),
              );
            },
          ),
            DashboardTile(
              text: 'Batch Rating Form',
              icon:Icon(Icons.star_rate),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BatchRatingForm()),
                );
              },
            ),
            DashboardTile(
              text: 'Course Evaluation Form',
              icon: Icon(Icons.comment_sharp),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CourseEvaluationForm()),
                );
              },
            ),
            DashboardTile(
              text: 'Suggestions Form Academic',
              icon:Icon(Icons.rate_review),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SuggestionsFormAcademic()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
