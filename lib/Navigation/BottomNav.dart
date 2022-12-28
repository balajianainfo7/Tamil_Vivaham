import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:thirumanam/Auth/Home_list_page.dart';


class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  List<Widget> tabItems = [
    Center(child: HomePageView()),
    Center(child: Text("1")),
    Center(child: Text("2")),
    Center(child: Text("3")),
    
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        body: Center(
          child: tabItems[_selectedIndex],
        ),
        bottomNavigationBar: FlashyTabBar(
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInBack,
          selectedIndex: _selectedIndex,
          iconSize: 30,
          
          showElevation: false, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
          }),
          items: [
            FlashyTabBarItem(
              title: Text('Home', style: TextStyle(color: Color(0xFF134FAF),),),
              icon: Icon(Icons.home, color: Color(0xFF134FAF),),
              
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.play_circle, color: Color(0xFF134FAF),),
              title: Text('Story', style: TextStyle(color: Color(0xFF134FAF),),),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.emoji_people, color: Color(0xFF134FAF),),
              title: Text('MemberShip', style: TextStyle(color: Color(0xFF134FAF),),),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.group, color: Color(0xFF134FAF),),
              title: Text('Happy Story', style: TextStyle(color: Color(0xFF134FAF),),),
            ),
            
          ],
        ),
      ),
    );
  }
}