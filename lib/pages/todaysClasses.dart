import 'package:flutter/material.dart';
import 'package:planlekcji/models/subject.dart';
import 'package:planlekcji/models/teacher.dart';
import 'package:planlekcji/utils/cards.dart';

class TodaysClasses extends StatelessWidget {
  final Subject testSubject = Subject(
      0,
      'test',
      [
        {'day': 'Poniedziałek', 'hours': '8.00-8.45'}
      ],
      Teacher(1, 'M. Kowalski'));

//  DB.insertSubject TODO: ogarnij jak to się robi

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
          child: Column(
            children: <Widget>[
              ClassCard(
                type: 'first',
                when: 'Teraz',
                classes: [
                  {
                    'hours': '8:00 - 8:45',
                    'subject': 'systemy operacyjne',
                    'teacher': 'M. Kowalski'
                  },
                ],
              ),
              ClassCard(
                type: 'second',
                when: 'Następnie',
                classes: [
                  {'hours': 'Brak', 'subject': 'Brak', 'teacher': 'Brak'},
                ],
              ),
              ClassCard(
                type: 'other',
                when: 'Dzisiaj',
                classes: [
                  {'hours': 'Brak', 'subject': 'Brak', 'teacher': 'Brak'},
                  {'hours': 'Brak', 'subject': 'Brak', 'teacher': 'Brak'}
                ],
              ),
            ],
          ),
        ));
  }
}
