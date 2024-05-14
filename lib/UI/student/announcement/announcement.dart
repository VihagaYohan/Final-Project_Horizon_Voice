import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedback_app/UI/academic/announcements/manage_announcement.dart';
import 'package:flutter/material.dart';

class AnnouncementListScreen extends StatelessWidget {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcements'),
      ),
     
      body: FutureBuilder(
        future: db.collection("announcements").get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var announcement = snapshot.data!.docs[index];
                var type = announcement['type'];
                var classCode = announcement['class_code'];
                var createdDate = (announcement['created_date'] as Timestamp)
                    .toDate()
                    .toString();
                Color color;
                IconData iconData;
                switch (type) {
                  case 'Event':
                    color = Colors.blue;
                    iconData = Icons.event;
                    break;
                  case 'Notice':
                    color = Colors.orange;
                    iconData = Icons.info;
                    break;
                  case 'Reminder':
                    color = Colors.green;
                    iconData = Icons.alarm;
                    break;
                  default:
                    color = Colors.grey;
                    iconData = Icons.error;
                }
                return ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      iconData,
                      color: Colors.white,
                    ),
                    backgroundColor: color,
                  ),
                  title: Text(
                    announcement['title'],
                    style: TextStyle(color: color),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        announcement['description'],
                        style: TextStyle(color: Colors.black87),
                      ),
                      SizedBox(height: 4),
                      Text(
                        createdDate.substring(2, 16),
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  trailing: Text(
                    '$classCode',
                    style: TextStyle(color: Colors.black87),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No Announcements'));
          }
        },
      ),
    );
  }
}
