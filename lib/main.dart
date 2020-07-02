import 'package:flutter/material.dart';
import './pages/todaysClasses.dart' as todaysClassesPage;
import './pages/weeksClasses.dart' as weeksClassesPage;

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
        onPressed: (){},
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
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
          ListTile(leading: Icon(Icons.home), title: Text('Strona Główna'))
        ],
      ),
    );
  }
}
