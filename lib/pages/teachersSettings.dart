import 'package:flutter/material.dart';
import 'package:planlekcji/models/teacher.dart';
import 'package:planlekcji/utils/cards.dart';

class TeacherSettings extends StatefulWidget {
  @override
  _TeacherSettingsState createState() => _TeacherSettingsState();
}

class _TeacherSettingsState extends State<TeacherSettings> {
  String test = 'test';

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List<Widget>();

    for (int i = 0; i <= 10; i++) {
      items.add(
        OptionCard(
//          subject: Subject(1, 'Test', [], Teacher(1, 'Abdul')),
          teacher: Teacher(1, 'name'),
          type: 'teacher',
          editAction: () => {},
          deleteAction: () => {},
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Nauczyciele'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Color(0xFF268FFF), Color(0xFF007BFF)])),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
            child: Column(
              children: items,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
        backgroundColor: Colors.blue,
      ),
    );
  }
}
