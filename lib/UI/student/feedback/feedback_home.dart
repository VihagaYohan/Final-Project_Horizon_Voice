import 'package:feedback_app/UI/academic/announcements/announcements.dart';
import 'package:feedback_app/UI/academic/feedback/batch_rating_form.dart';
import 'package:feedback_app/UI/academic/feedback/course_evaluation_form.dart';
import 'package:feedback_app/UI/academic/feedback/institution_feedback_form_academic.dart';
import 'package:feedback_app/UI/academic/feedback/suggestions_form_academic.dart';
import 'package:feedback_app/UI/student/feedback/acc_feedback_form.dart';
import 'package:feedback_app/UI/student/feedback/feedback_scaffold.dart';
import 'package:feedback_app/UI/student/feedback/institution_feedback_form.dart';
import 'package:feedback_app/UI/student/feedback/library_feedback_fom.dart';
import 'package:feedback_app/UI/student/feedback/suggestion_form.dart';
import 'package:feedback_app/config/constants.dart';
import 'package:feedback_app/widgets/dashboard_tile.dart';
import 'package:flutter/material.dart';

class StudentFeedbackHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.count(
        padding: EdgeInsets.all(64),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        children: [
          DashboardTile(
            text: 'Institute Evaluation',
            icon: Icon(Icons.comment_bank),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FeedbackForm(
                          appBarTitle: 'Institution Evaluation',
                          questions: AppConfigs.inst_stu_questions,
                          firebaseCollection: 'institute_evaluation_student',
                        )),
              );
            },
          ),
          DashboardTile(
            text: 'Academic Feedback',
            icon: Icon(Icons.star_rate),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AcademicFeedbackForm()),
              );
            },
          ),
          DashboardTile(
            text: 'Library Feedback',
            icon: Icon(Icons.comment_sharp),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FeedbackForm(
                          appBarTitle: 'Library Feedback',
                          questions: [
                            "Are the required numbers of titles in your Subject available in the Library?",
                            "Are you satisfied with the available journals, magazines and Newspaper?",
                            "Are you satisfied with the arrangement of books in the Library shelves?"
                          ],
                          firebaseCollection: 'library_feedback_student',
                        )),
              );
            },
          ),
          DashboardTile(
            text: 'Suggestions',
            icon: Icon(Icons.rate_review),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SuggestionForm()),
              );
            },
          ),
        ],
      ),
    );
  }
}
