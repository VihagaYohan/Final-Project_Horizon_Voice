import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_chart/d_chart.dart';
import 'package:feedback_app/UI/admin/feedback_category.dart';
import 'package:feedback_app/UI/admin/stat_card.dart';
import 'package:feedback_app/config/constants.dart';
import 'package:flutter/material.dart';

class StatsHome extends StatefulWidget {
  String faculty;
  StatsHome({super.key, required this.faculty});

  @override
  State<StatsHome> createState() => _StatsHomeState();
}

class _StatsHomeState extends State<StatsHome> {
  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.faculty} Faculty Analytics',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            FeedbackCategory(
              title: 'Institute Satisfaction',
              collectionPath: 'feedbacks/${widget.faculty}/institute_evaluation',
              titleList: AppConfigs.inst_stu_question_titles,
            ),
            FeedbackCategory(
              title: 'Library',
              collectionPath: 'feedbacks/${widget.faculty}/library_feedback',
              titleList: AppConfigs.lib_stu_question_titles,
            ),
          ],
        ),
      ),
    );
  }
}
