// ignore_for_file: unused_import

import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:flutter_designs/student_class.dart';
import 'package:flutter_designs/house.dart';
import 'package:flutter_designs/money_pot.dart';

import 'package:flutter_designs/my_home_page.dart';
import 'package:flutter_designs/my_profile_page.dart';
import 'package:flutter_designs/my_profile_editing_page.dart';
import 'package:flutter_designs/my_inbox_page.dart';
import 'package:flutter_designs/my_map_page.dart';
import 'package:flutter_designs/my_rent_page.dart';

late StudentClass profile;

void main() {
  profile = StudentClass(0);
  profile.setName = "Karol";
  profile.setSurname = "Krzystof Floraan Lubicz-Gruzewski";
  profile.setProfilePicture = 'assets/images/pfp1.jpg';
  profile.setEmail = "karol69@gmail.com";
  profile.setPhoneNumber = "42069 420 666";

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner:
          false, // Set this to false to remove the debug banner
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: "Rubik"),
          labelLarge: TextStyle(fontFamily: "Rubik"),
        ),
      ),
      home: const NavBarWidget(),
    );
  }
}

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarWidget> {
  int _selectedIndex = 0;

  static final LinkedHashMap<StatefulWidget, BottomNavigationBarItem>
      _widgetOptions = LinkedHashMap.from({
    const MyProfilePage(): const BottomNavigationBarItem(
        icon: Icon(Icons.person), label: 'Profile'),
    const MyInboxPage():
        const BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Inbox'),
    const MyHomePage():
        const BottomNavigationBarItem(icon: Icon(Icons.house), label: 'Home'),
    const MyMapPage():
        const BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
    const MyRentPage():
        const BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Rent')
  });

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: _widgetOptions.keys.toList()[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          _widgetOptions.values.toList()[0],
          _widgetOptions.values.toList()[1],
          _widgetOptions.values.toList()[2],
          _widgetOptions.values.toList()[3],
          _widgetOptions.values.toList()[4],
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
