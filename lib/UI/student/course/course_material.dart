
import 'package:cloud_firestore/cloud_firestore.dart';

class CourseMaterial {
    String title;
    Timestamp createdAt;
    String instructions;
    String link;

    CourseMaterial({
        required this.title,
        required this.createdAt,
        required this.instructions,
        required this.link,
    });

    factory CourseMaterial.fromJson(Map<String, dynamic> json) => CourseMaterial(
        title: json["title"],
        createdAt: json["created_at"],
        instructions: json["instructions"],
        link: json["link"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "created_at": createdAt,
        "instructions": instructions,
        "link": link,
    };
}