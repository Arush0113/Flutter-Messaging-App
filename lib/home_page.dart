import 'package:flutter/material.dart';
import './screens/calender_screen.dart';
import './screens/chat_home_screen.dart';
import './screens/explore_screen.dart';
import './screens/home_screen.dart';
import './screens/notifications_screen.dart';

class HomePage extends StatefulWidget {

  static const routeName = '/home-page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  List<Widget> _screens = [HomeScreen(), ExploreScreen(), ChatHomeScreen(), NotificationsScreen(), /*CalenderScreen(),*/];

  int _selectedPageIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _onItemTapped(int _selectedIndex) {
//    setState(() {
//      _selectedPageIndex = index;
//    });
    _pageController.jumpToPage(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('Demo'),
//        backgroundColor: Theme.of(context).canvasColor,
//      ),
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
//      Container(
////        child: Text(
////          'hey there',
//////          style: TextStyle(color: Colors.white),
////        ),
////        color: Colors.white,
//      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPageIndex,
        onTap: _onItemTapped,
        backgroundColor: Theme.of(context).canvasColor,
        unselectedItemColor: Colors.white,
        unselectedIconTheme: IconThemeData(
          size: 25
        ),
        selectedIconTheme: IconThemeData(
          size: 34
        ),
        showSelectedLabels: false,
        showUnselectedLabels: false,
//        unselectedFontSize: 10,
        selectedItemColor: Color(0XFF66ff66),
        elevation: 3,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home', style: TextStyle(fontSize: 12),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title: Text('Explore', style: TextStyle(fontSize: 12),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text('Groups', style: TextStyle(fontSize: 12),),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Notifications', style: TextStyle(fontSize: 12),),
          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.calendar_today),
//            title: Text('Calender', style: TextStyle(fontSize: 12),),
//          ),
        ],
      ),
    );
  }
}