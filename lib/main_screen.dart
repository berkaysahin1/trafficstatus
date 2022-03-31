import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:trafficstatus/AddPostPage.dart';
import 'package:trafficstatus/HomePage.dart';
import 'package:trafficstatus/Notifications.dart';
import 'package:trafficstatus/ProfilePage.dart';
import 'package:trafficstatus/SearchPage.dart';

class MainScreen extends StatefulWidget {
  static final title = 'salomon_bottom_bar';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
  var _currentIndex = 0;
  var pages = [
    HomePage(),NotificationsPage(),AddPostPage(),SearchPage(),ProfilePage()
  ];
  late PageController _pageController;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: MainScreen.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: onPageChanged,
          children: List.generate(pages.length, (context) => pages[context]),
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) {
            setState(() => _currentIndex = i);
            _pageController.jumpToPage(i);
          },
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Color.fromRGBO(0, 51, 78, 1),
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.notifications_none),
              title: Text("Notifications"),
              selectedColor: Color.fromRGBO(0, 51, 78, 1),
            ),
            /// New Post
            SalomonBottomBarItem(
              icon: Icon(Icons.add_a_photo),
              title: Text("New Post"),
              selectedColor: Color.fromRGBO(0, 51, 78, 1),
            ),
            /// discover
            SalomonBottomBarItem(
              icon: Icon(Icons.search),
              title: Text("Discover"),
              selectedColor: Color.fromRGBO(0, 51, 78, 1),
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: Color.fromRGBO(0, 51, 78, 1),
            ),
          ],
        ),
      ),
    );
  }
  void onPageChanged(int page) {
    setState(() {
      this._currentIndex = page;
    });
  }
}
