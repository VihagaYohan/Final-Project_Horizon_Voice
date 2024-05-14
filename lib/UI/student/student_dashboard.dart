import 'package:feedback_app/UI/academic/feedback/institution_feedback_form_academic.dart';
import 'package:feedback_app/UI/student/announcement/announcement.dart';
import 'package:feedback_app/UI/student/course/course_list.dart';
import 'package:feedback_app/UI/student/feedback/acc_feedback_form.dart';
import 'package:feedback_app/UI/student/feedback/feedback_home.dart';
import 'package:feedback_app/UI/student/feedback/institution_feedback_form.dart';
import 'package:feedback_app/UI/student/feedback/library_feedback_fom.dart';
import 'package:feedback_app/UI/student/feedback/suggestion_form.dart';
import 'package:feedback_app/UI/student/feedback/view_feedbacks.dart';
import 'package:feedback_app/UI/student/profile/profile_view_update.dart';
import 'package:feedback_app/widgets/dashboard_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StudentDashboard extends StatefulWidget {
  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    CourseListScreen(),
    Container(
      child: Center(child: Text('Schedule')),
    ),
    StudentFeedbackHome(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.purple),
        titleTextStyle: TextStyle(color: Colors.purple),
        backgroundColor: Colors.white,
        title: Text("Student Dashboard".toUpperCase()),
        elevation:0.4,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_active),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AnnouncementListScreen()),
              );
            },
          ),
          IconButton(
            icon: CircleAvatar(
              foregroundImage: NetworkImage(
                FirebaseAuth.instance.currentUser?.photoURL ??
                    'https://placehold.co/512',
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
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName:
                  Text(FirebaseAuth.instance.currentUser?.displayName ?? ''),
              accountEmail:
                  Text(FirebaseAuth.instance.currentUser?.email ?? ''),
                  onDetailsPressed: (){
                    Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfileScreen()),
              );
              
                  },
              currentAccountPicture: CircleAvatar(
                foregroundImage: NetworkImage(
                  FirebaseAuth.instance.currentUser?.photoURL ??
                      'https://placehold.co/512',
                ),
              ),
            ),
            ListTile(
              title:Text('Announcements'),
              leading:Icon(Icons.notifications),
            ),
            ListTile(
              title:Text('Logout'),
              leading:Icon(Icons.logout),
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.purple,
        unselectedItemColor: Colors.purple.shade200,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment),
            label: 'Feedback',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
