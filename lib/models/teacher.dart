

class Teacher {
  final int id;
  final String name;

  Teacher(this.id, this.name);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'Teacher{id: $id, name: $name}';
  }
}
