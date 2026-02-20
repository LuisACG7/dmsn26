
import 'package:dmsn26/listeners/value_listener.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: Drawer(),
      appBar: AppBar(
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i){ 
          setState(() => _currentIndex = i);
          if( i == 3 ){
            ValueListener.isDarkMode.value = !ValueListener.isDarkMode.value;
          }
        },
        items: [
          SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.purple,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.favorite_border),
              title: Text("Likes"),
              selectedColor: Colors.pink,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: Icon(Icons.search),
              title: Text("Search"),
              selectedColor: Colors.orange,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: ValueListenableBuilder(
                valueListenable: ValueListener.isDarkMode,
                builder: (context,value,_) {
                  return value ? Icon(Icons.dark_mode) : Icon(Icons.light_mode);
                }
              ),
              title: Text("Profile"),
              selectedColor: Colors.teal,
            ),
        ]
      ),  
    );
  }
}