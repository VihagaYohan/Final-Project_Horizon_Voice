
class Course {
  String id;
    String name;
    String lecturer;
    String courseCode;
    String classCode;

    Course({
      required this.id,
        required this.name,
        required this.lecturer,
        required this.courseCode,
        required this.classCode,
    });

    factory Course.fromJson(Map<String, dynamic> json) => Course(
      id:json["id"],
        name: json["name"],
        lecturer: json["lecturer"],
        courseCode: json["course_code"],
        classCode: json["class_code"],
    );

    Map<String, dynamic> toJson() => {
      "id":id,
        "name": name,
        "lecturer": lecturer,
        "course_code": courseCode,
        "class_code": classCode,
    };
}
