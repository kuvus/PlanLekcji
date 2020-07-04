import 'package:flutter/material.dart';
import 'package:planlekcji/models/subject.dart';
import 'package:planlekcji/models/teacher.dart';
import 'package:planlekcji/utils/cards.dart';

class SubjectSettings extends StatefulWidget {
  @override
  _SubjectSettingsState createState() => _SubjectSettingsState();
}

class _SubjectSettingsState extends State<SubjectSettings> {
  String test = 'test';

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List<Widget>();

    for (int i = 0; i <= 10; i++) {
      items.add(
        OptionCard(
          subject: Subject(1, 'Test', [], Teacher(1, 'M. Kowalski')),
//          teacher: Teacher(1, 'name'),
          type: 'subject',
          editAction: () => {},
          deleteAction: () => {},
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Przedmioty'),
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
