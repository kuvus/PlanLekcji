import 'package:flutter/material.dart';

class ClassCard extends StatelessWidget {
  String when;
  String type;
  List classes;

  ClassCard({this.when = 'Kiedyś', this.type = 'other', this.classes});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = List<Widget>();
    int classesCount = this.classes != null ? this.classes.length : 0;
    if (classesCount == 0)
      widgets.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Brak',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          Column(
            children: <Widget>[
              Text(
                'Brak',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              Text(
                'Brak',
                style: TextStyle(color: Colors.white),
              )
            ],
          )
        ],
      ));
    else
      for (int i = 0; i < classesCount; i++) {
        if (i > 0) widgets.add(Divider(color: Colors.grey[200]));
        widgets.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              this.classes[i]['hours'],
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            Column(
              children: <Widget>[
                Text(
                  this.classes[i]['subject'],
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Text(
                  this.classes[i]['teacher'],
                  style: TextStyle(color: Colors.white),
                )
              ],
            )
          ],
        ));
      }
    return Card(
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        color: this.type == 'first'
            ? Colors.blue[600]
            : (this.type == 'second' ? Colors.cyan[700] : Colors.blueGrey[400]),
        child: Column(children: <Widget>[
          Card(
            color: this.type == 'first'
                ? Colors.blue[500]
                : (this.type == 'second'
                    ? Colors.cyan[600]
                    : Colors.blueGrey[300]),
            elevation: 0,
            margin: EdgeInsets.zero,
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(13, 6, 0, 6),
                child: Text(
                  this.when,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 6.0,
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(17, 6, 17, 15),
              child: Column(
                children: widgets,
              ))
        ]));
  }
}
