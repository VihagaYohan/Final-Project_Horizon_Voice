import 'package:feedback_app/UI/admin/stats_home.dart';
import 'package:feedback_app/config/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {
  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int activeTab = 0;
  List<String> tabList = AppConfigs.faculties;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  auth.signOut();
                },
                icon: Icon(Icons.logout))
          ],
          bottom: TabBar(
            tabs: tabList.map(
              (e) {
                return Tab(
                  text: e,
                );
              },
            ).toList(),
            onTap: (i) => setState(() {
              activeTab = i;
            }),
          ),
          title: const Text('Admin'),
        ),
        body: StatsHome(
            faculty: tabList[activeTab], key: Key(activeTab.toString())),
      ),
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:d_chart/d_chart.dart';

// class AdminDashboard extends StatelessWidget {
//   List<Color> gradientColors = [
//     Colors.blue,
//     Colors.red,
//   ];

//   final FirebaseFirestore db = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     List<OrdinalData> ordinalList = [
//       OrdinalData(domain: 'Mon', measure: 3),
//       OrdinalData(domain: 'Tue', measure: 5),
//       OrdinalData(domain: 'Wed', measure: 9),
//       OrdinalData(domain: 'Thu', measure: 6.5),
//     ];

//     final ordinalGroup = [
//       OrdinalGroup(
//         id: '1',
//         data: ordinalList,
//       ),
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Admin'),
//       ),
//     body: FutureBuilder(
//         future: db.collection('institute_evaluation').get(),
//         builder: (context, snapshot) {
//          if (snapshot.hasData && snapshot.data != null && snapshot.data!.docs.isNotEmpty) {
// // Initialize a list to store counts for each value
// List<int> valueCounts = [0, 0, 0, 0, 0]; // 0 to 4

//   // Count occurrences of each value
//   snapshot.data!.docs.forEach((doc) {
//     int value = doc.data()['0'];
//     if (value >= 0 && value <= 4) {
//       valueCounts[value]++;
//     }
//   });

//   // Create a list of OrdinalData based on the counts
// List<OrdinalData> ordinalDataList = [];
// for (int i = 0; i <= 4; i++) {
//   ordinalDataList.add(OrdinalData(domain: i.toString(), measure: valueCounts[i]));
// }

//   // Create the chart with aggregated data
// return AspectRatio(
//   aspectRatio: 16 / 9,
//   child: DChartBarO(
//     groupList: [
//       OrdinalGroup(
//         id: '1',
//         data: ordinalDataList,
//       )
//     ],
//   ),
// );
// }
// else {
//               return CircularProgressIndicator();
//             }
//           }),
//     );
//   }
// }
