import 'package:flutter/material.dart';
import 'package:planlekcji/utils/cards.dart';

class TodaysClasses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        ClassCard(
          type: 'first',
          when: 'Teraz',
          classes: [
            {'hours': 'Brak', 'subject': 'Brak', 'teacher': 'Brak'},
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
    ));
  }
}
