import 'package:flutter/material.dart';
import 'package:planlekcji/pages/subjectsSettings.dart';
import 'package:planlekcji/pages/teachersSettings.dart';
import 'package:planlekcji/pages/todaysClasses.dart' as todaysClassesPage;
import 'package:planlekcji/pages/weeksClasses.dart' as weeksClassesPage;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plan lekcji',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new NavigationTabs(),
    );
  }
}

class NavigationTabs extends StatefulWidget {
  @override
  NavigationTabsState createState() => new NavigationTabsState();
}

class NavigationTabsState extends State<NavigationTabs>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Plan lekcji'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Color(0xFF268FFF), Color(0xFF007BFF)])),
        ),
        bottom: new TabBar(
            controller: controller,
            indicatorColor: Color(0xFFFFFF8D),
            tabs: <Tab>[
              new Tab(text: 'Dzisiaj'),
              new Tab(text: 'Ten tydzień')
            ]),
      ),
      body: new TabBarView(controller: controller, children: <Widget>[
        new todaysClassesPage.TodaysClasses(),
        new weeksClassesPage.WeeksClasses()
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {},
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 136,
            child: DrawerHeader(
              child: Center(
                child: Text(
                  'Plan lekcji',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[Color(0xFF268FFF), Color(0xFF007BFF)])),
            ),
          ),
          CustomListTile(
              Icons.people,
              'Nauczyciele',
                  () =>
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TeacherSettings()))
              }),
          CustomListTile(
              Icons.library_books,
              'Przedmioty',
                  () =>
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubjectSettings()))
              }),
          CustomListTile(Icons.settings, 'Ustawienia', () => {}),
          Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                  child: Text('\u00a9 2020 Jakub Macioł',
                      style: TextStyle(color: Colors.grey[500])),
                )),
          ),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String tile;
  final Function onTap;

  CustomListTile(this.icon, this.tile, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 8, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[300]))),
        child: InkWell(
          onTap: this.onTap,
          splashColor: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 50,
                child: Row(
                  children: <Widget>[
                    Icon(icon, color: Colors.grey[600]),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text(
                        this.tile,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
              Icon(Icons.arrow_right, color: Colors.grey[600]),
            ],
          ),
        ),
      ),
    );
  }
}
