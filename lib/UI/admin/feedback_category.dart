import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedback_app/UI/admin/stat_card.dart';
import 'package:feedback_app/config/constants.dart';
import 'package:flutter/material.dart';

class FeedbackCategory extends StatefulWidget {
  String title;
  String collectionPath;
  List<String> titleList;
  FeedbackCategory(
      {required this.title,
      required this.collectionPath,
      required this.titleList});

  @override
  State<FeedbackCategory> createState() => _FeedbackCategoryState();
}

class _FeedbackCategoryState extends State<FeedbackCategory> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  bool isStudent = true;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: db
            .collection(
                '${widget.collectionPath}_${isStudent ? 'student' : 'staff'}')
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData &&
                snapshot.data != null &&
                snapshot.data!.docs.isNotEmpty) {
              final docs = snapshot.data!.docs.map((e) => e.data());
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          InkWell(
                              onTap: () => setState(() {
                                    isStudent = !isStudent;
                                  }),
                              child: Text(
                                'Students',
                                style: TextStyle(
                                    color: isStudent
                                        ? Colors.purple
                                        : Colors.grey),
                              )),
                          SizedBox(
                            width: 16,
                          ),
                          InkWell(
                              onTap: () => setState(() {
                                    isStudent = !isStudent;
                                  }),
                              child: Text(
                                'Staff',
                                style: TextStyle(
                                    color: !isStudent
                                        ? Colors.purple
                                        : Colors.grey),
                              )),
                        ],
                      )
                    ],
                  ),
                  GridView(
                    padding: EdgeInsets.only(top: 16),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    children: [
                      Card(
                        child: Column(
                          children: [
                            Text('Total Responses'),
                            Text(docs.length.toString()),
                            ElevatedButton(
                                onPressed: () {
                                  processData(docs);
                                },
                                child: Text('COunt'))
                          ],
                        ),
                      )
                    ],
                  ),
                  GridView.builder(
                      padding: EdgeInsets.only(top: 16),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: widget.titleList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return StatCard(
                          docs: docs,
                          index: index,
                          titleList: widget.titleList,
                        );
                      })
                ],
              );
            } else {
              return Text('No Data');
            }
          } else {
            return Center(child: LinearProgressIndicator());
          }
        });
  }
}

List<Map<String, dynamic>> processData(Iterable<Map<String, dynamic>> docs) {
  List<Map<String, dynamic>> result = [];
  final data = {};
  for (var doc in docs) {
    for (String k in doc.keys) {
      int kn = int.parse(k);
      if (!data.containsKey(kn)) {
        data[kn] = {
          "counts": {1: 0, 2: 0, 3: 0, 4: 0, 5: 0},
          "total": 0,
          "average": 0,
          "percentage": ""
        };
      }
      if (doc[k] > 0 && doc[k] <= 5) {
        if (!data[kn]!["counts"]!.containsKey(doc[k])) {
          data[kn]!["counts"]![doc[k]] = 0;
        }
        data[kn]!["counts"]![doc[k]] = data[kn]!["counts"]![doc[k]]! + 1;
        data[kn]!["total"] += doc[k];

        data[kn]!["average"] = data[kn]!["total"] / 5;
        data[kn]!["percentage"] =
            (data[kn]!["average"] * 100 / 5).toStringAsFixed(1);

        double sumSquaredDiff = 0;
        for (int i = 1; i <= 5; i++) {
          sumSquaredDiff +=
              pow((i - data[kn]!["average"]), 2) * data[kn]!["counts"]![i]!;
        }
        double variance = sumSquaredDiff / 5;
        double standardDeviation = sqrt(variance);
        data[kn]!["standardDeviation"] = standardDeviation;

        int mode = 1;
        int maxCount = data[kn]!["counts"]![1]!;
        for (int i = 2; i <= 5; i++) {
          if (data[kn]!["counts"]![i]! > maxCount) {
            mode = i;
            maxCount = data[kn]!["counts"]![i]!;
          }
        }
        data[kn]!["mode"] = mode;

        int minRating = 5;
        int maxRating = 1;
        for (int i = 1; i <= 5; i++) {
          if (data[kn]!["counts"]![i]! > 0) {
            minRating = min(minRating, i);
            maxRating = max(maxRating, i);
          }
        }
        int range = maxRating - minRating;
        data[kn]!["range"] = range;

        int totalCount = data[kn]!["total"];
        int middleIndex = (totalCount + 1) ~/ 2;
        int median = 0;
        int cumulativeCount = 0;
        for (int i = 1; i <= 5; i++) {
          cumulativeCount += data[kn]!["counts"]![i]! as int;
          if (cumulativeCount >= middleIndex) {
            median = i;
            break;
          }
        }
        data[kn]!["median"] = median;
      }
    }
  }
  print(data);

  

  return result;
}
