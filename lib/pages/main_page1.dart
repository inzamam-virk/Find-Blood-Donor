import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'main_page.dart';

class MainPage1 extends StatefulWidget {
  const MainPage1({Key? key}) : super(key: key);
  static const String id = 'mainpage1';

  @override
  State<MainPage1> createState() => _MainPage1State();
}

class _MainPage1State extends State<MainPage1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 2,

          child: Scaffold(
            drawer: Drawerr(),
            appBar: AppBar(
              actions: [
                IconButton(onPressed: (){}, icon:const Icon(Icons.messenger)),
              ],
              backgroundColor: Colors.redAccent,
              bottom:const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.home),),
                    Tab(icon: Icon(Icons.history),),
              ]),
            ),
            body: TabBarView(
                  children: [
                    Home(),
                    History(),

                  ]
              ),
          )
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.extent(
          maxCrossAxisExtent: 300,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          scrollDirection: Axis.vertical,
          padding:const EdgeInsets.all(15),
          children: [
            Row(
              children: [
                Text("Inzamam virk"),

              ],
            )
          ],
        ),
      ),
    );
  }
}

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.extent(
          maxCrossAxisExtent: 300,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          scrollDirection: Axis.vertical,
          padding:const EdgeInsets.all(15),
          children: [
            Row(
              children: [
                Text("Inzamam virk"),

              ],
            )
          ],
        ),
      ),
    );
  }
}
