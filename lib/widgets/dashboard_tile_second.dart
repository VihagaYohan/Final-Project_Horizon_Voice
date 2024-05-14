import 'package:feedback_app/UI/academic/academic_dashboard.dart';
import 'package:flutter/material.dart';



  Widget item(Color backgroundColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
        ),
      ],
    );
  }