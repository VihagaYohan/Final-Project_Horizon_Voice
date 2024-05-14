import 'package:flutter/material.dart';

class AppConfigs {
  static List<String> faculties = ['Law', 'IT', 'Management', 'Science'];
  static List<Color> facultyColors = [
    Colors.blue.shade900,
    Colors.blue.shade700,
    Colors.blue.shade500,
    Colors.blue.shade300,
  ];

  static List<String> inst_staff_questions = [
    "Are you satisfied with the Website/Social Media presence of the institution?",
    "How would you rate the adequacy of the library's collection and resources for your academic needs?",
    "How would you rate the quality and availability of equipment in the lab?",
    "How satisfied are you with the variety and quality of food offered in the canteen?",
  ];
  static List<String> inst_stu_questions = [
    "Are you satisfied with the Website/Social Media presence of the institution?",
    "How would you rate the adequacy of the library's collection and resources for your academic needs?",
    "How would you rate the quality and availability of equipment in the lab?",
    "How satisfied are you with the variety and quality of food offered in the canteen?",
  ];
  static List<String> inst_stu_question_titles = [
    "Online Presence",
    "Library Collection",
    "Laboratory Equipement",
    "Canteen Food",
  ];
  static List<String> lib_stu_question_titles = [
    "Titles Availability",
    "Journals, Magazines and Newspaper",
    "Arrangement"
  ];
}
