import 'package:flutter/material.dart';
import 'package:divine_word_app/screens/home_screen.dart' as home;
import 'package:divine_word_app/screens/videos_screen.dart' as videos;
import 'package:divine_word_app/screens/shop_screen.dart' as shop;
import 'package:divine_word_app/screens/saved_screen.dart' as saved;
import 'package:divine_word_app/screens/more_screen.dart' as more;

void main() => runApp(DivineWordApp());

class DivineWordApp extends StatelessWidget {
  static const String _title = 'Divine Word Media';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: new ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          primaryColor: Colors.black,
          primaryIconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.grey[200],
          appBarTheme: AppBarTheme(color: Colors.white),
          primaryTextTheme: TextTheme(
              title: TextStyle(color: Colors.black, fontFamily: "Aveny")),
          textTheme: TextTheme(title: TextStyle(color: Colors.black))),
      home: DivineWordMainApp(),
    );
  }
}

class DivineWordMainApp extends StatefulWidget {
  DivineWordMainApp({Key key}) : super(key: key);

  @override
  createState() => new _DivineWordState();
}

class _DivineWordState extends State<DivineWordMainApp>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  static GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final PageStorageBucket bucket = PageStorageBucket();

  final topBar = new AppBar(
//    backgroundColor: new Color(0xfff8faf8),
    centerTitle: true,
    elevation: 1.0,
//    leading: new IconButton(
//      icon: new Icon(Icons.menu),
//      onPressed: () => _scaffoldKey.currentState.openDrawer(),
//    ),
    title: Text('Divine Word Media'),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Icon(Icons.search),
      )
    ],
  );

  final drawer = Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.amber[800]),
          child: Text(
            'Drawer Header',
            style: TextStyle(color: Colors.white, fontSize: 24.0),
          ),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
        )
      ],
    ),
  );

  final List<Widget> pages = <Widget>[
    home.HomeScreen(key: PageStorageKey('Home')),
    videos.VideosScreen(),
    shop.ShopScreen(),
    saved.SavedScreen(),
    more.MoreScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.grey[200],
        appBar: topBar,
        body: PageStorage(
          child: pages[_selectedIndex],
          bucket: bucket,
        ),
//        body: Center(
//          child: _widgetOptions.elementAt(_selectedIndex),
//        ),
//        drawer: drawer,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_library), title: Text('Videos')),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_books), title: Text('Shop')),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), title: Text('Saved')),
            BottomNavigationBarItem(icon: Icon(Icons.menu), title: Text('More'))
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).accentColor,
          onTap: _onItemTapped,
        ));
  }
}
