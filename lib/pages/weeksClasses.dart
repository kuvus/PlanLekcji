import 'package:flutter/material.dart';
import 'package:planlekcji/utils/cards.dart';

class WeeksClasses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClassCard(
              type: 'other',
              when: 'Poniedziałek',
              classes: [{'hours': 'Brak', 'subject': 'Brak', 'teacher': 'Brak'}, {'hours': 'Brak', 'subject': 'Brak', 'teacher': 'Brak'}],
            ),
            ClassCard(
              type: 'other',
              when: 'Wtorek',
              classes: [{'hours': 'Brak', 'subject': 'Brak', 'teacher': 'Brak'}, {'hours': 'Brak', 'subject': 'Brak', 'teacher': 'Brak'}],
            ),
            ClassCard(
              type: 'other',
              when: 'Środa',
              classes: [{'hours': 'Brak', 'subject': 'Brak', 'teacher': 'Brak'}, {'hours': 'Brak', 'subject': 'Brak', 'teacher': 'Brak'}],
            ),
          ],
        ));
  }
}