import 'package:flutter/material.dart';
import 'widgets/homePage_widget.dart';
import 'widgets/roster_widget.dart';
import 'widgets/workAggregation_widget.dart';
import 'widgets/settings_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BottomNav',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  PageController _pageController;

  int _screen = 0;

  List<BottomNavigationBarItem> myBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: const Text('ホーム'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.assignment),
        title: const Text('勤務表'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.assessment),
        title: const Text('勤務集計'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        title: const Text('設定'),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _screen, // 初期ページの指定。上記で_screenを１とすれば２番目のページが初期表示される。
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        backgroundColor: Colors.tealAccent[700],
        title: Text(
          '勤務管理',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _screen = index;
            });
          },
          children: [
            HomePage(),
            Roster(),
            ChangeForm(),
            Settings(),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _screen,
        onTap: (index) {
          setState(() {
            _screen = index;

            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.easeOut);
          });
        },
        items: myBottomNavBarItems(),
      ),
    );
  }
}
