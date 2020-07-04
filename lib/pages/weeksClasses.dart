import 'package:flutter/material.dart';
import 'package:planlekcji/utils/cards.dart';

class WeeksClasses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
          child: Column(
            children: <Widget>[
              ClassCard(
                type: 'other',
                when: 'Poniedziałek',
                classes: [
                  {'hours': 'Brak', 'subject': 'Brak', 'teacher': 'Brak'},
                  {'hours': 'Brak', 'subject': 'Brak', 'teacher': 'Brak'}
                ],
              ),
              ClassCard(
                type: 'other',
                when: 'Wtorek',
                classes: [
                  {'hours': 'Brak', 'subject': 'Brak', 'teacher': 'Brak'},
                  {'hours': 'Brak', 'subject': 'Brak', 'teacher': 'Brak'}
                ],
              ),
              ClassCard(
                type: 'other',
                when: 'Środa',
                classes: [
                  {'hours': 'Brak', 'subject': 'Brak', 'teacher': 'Brak'},
                  {'hours': 'Brak', 'subject': 'Brak', 'teacher': 'Brak'}
                ],
              ),
              ClassCard(
                type: 'other',
                when: 'Czwartek',
                classes: [
                  {'hours': 'Brak', 'subject': 'Brak', 'teacher': 'Brak'},
                  {'hours': 'Brak', 'subject': 'Brak', 'teacher': 'Brak'}
                ],
              ),
              ClassCard(
                type: 'other',
                when: 'Piątek',
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
