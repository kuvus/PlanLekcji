import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:planlekcji/models/subject.dart';
import 'package:planlekcji/models/teacher.dart';

class ClassCard extends StatelessWidget {
  final String when;
  final String type;
  final List classes;

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
        widgets.add(Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Text(
                  this.classes[i]['hours'],
                  style: TextStyle(color: Colors.white, fontSize: 25),
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      this.classes[i]['subject'],
                      style: TextStyle(color: Colors.white, fontSize: 28),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
                    Text(
                      this.classes[i]['teacher'],
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
      }
    return GradientCard(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              this.type == 'first'
                  ? Colors.blue[500]
                  : (this.type == 'second'
                      ? Colors.cyan[600]
                      : Colors.blueGrey[300]),
              this.type == 'first'
                  ? Colors.blue[600]
                  : (this.type == 'second'
                      ? Colors.cyan[700]
                      : Colors.blueGrey[400])
            ]),
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Column(children: <Widget>[
          Card(
            color: Color.fromRGBO(255, 255, 255, 0.11),
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

class OptionCard extends StatelessWidget {
  final String type;
  final Teacher teacher;
  final Subject subject;
  final Function editAction;
  final Function deleteAction;

  OptionCard({this.type = 'other',
    this.teacher,
    this.subject,
    this.editAction,
    this.deleteAction});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.grey[200],
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Container(
                    child: this.type == 'subject'
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          this.subject.toMap()['subject'],
                          style: TextStyle(
                              color: Colors.grey[900], fontSize: 28),
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                        ),
                        Text(
                          this.subject.toMap()['teacher'],
                          style: TextStyle(
                              color: Colors.grey[900], fontSize: 18),
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                        )
                      ],
                    )
                        : (this.type == 'teacher'
                        ? Text(
                      this.teacher.toMap()['name'],
                      style: TextStyle(
                          color: Colors.grey[900], fontSize: 23),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    )
                        : Text('')),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: IconButton(
                          icon: Icon(Icons.edit, color: Colors.grey[900]),
                          onPressed: editAction,
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: IconButton(
                        icon: Icon(Icons.delete, color: Colors.grey[900]),
                        onPressed: deleteAction,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
