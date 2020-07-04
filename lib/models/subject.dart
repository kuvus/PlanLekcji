import 'package:planlekcji/models/teacher.dart';

class Subject {
  final int id;
  final String subject;
  final List occurrence;
  final Teacher teacher;

  Subject(this.id, this.subject, this.occurrence, this.teacher);


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subject': subject,
      'occurrence': occurrence,
      'teacher': teacher.toMap()['name']
    };
  }

  @override
  String toString() {
    final String teacherName = teacher.toMap()['name'];
    return 'Subject{id: $id, subject: $subject, occurrence: $occurrence, teacherm $teacherName}';
  }
}
