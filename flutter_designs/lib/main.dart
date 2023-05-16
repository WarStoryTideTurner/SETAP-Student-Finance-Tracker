// ignore_for_file: unused_import

import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:mysql_client/mysql_client.dart';

import 'package:flutter_designs/house_type.dart';

import 'package:flutter_designs/student_class.dart';
import 'package:flutter_designs/house.dart';
import 'package:flutter_designs/money_pot.dart';
import 'package:flutter_designs/email.dart';

import 'package:flutter_designs/my_home_page.dart';
import 'package:flutter_designs/my_profile_page.dart';
import 'package:flutter_designs/my_profile_editing_page.dart';
import 'package:flutter_designs/my_inbox_page.dart';
import 'package:flutter_designs/my_map_page.dart';
import 'package:flutter_designs/my_rent_page.dart';

MyProfilePage profilePage = const MyProfilePage();
MyInboxPage inboxPage = const MyInboxPage();
MyHomePage homePage = const MyHomePage();
MyMapPage mapPage = const MyMapPage();
MyRentPage rentPage = const MyRentPage();

late StudentClass profile;
late House sampleHouse;

List<Email> emails = [
  // Email(
  //   sender: 'john.doe@example.com',
  //   subject: 'Meeting',
  //   message: 'Hey, are you available for a meeting at 2 PM?',
  // ),
  // Email(
  //   sender: 'jane.doe@example.com',
  //   subject: 'Task assigned',
  //   message: 'You have been assigned a new task, please complete it by EOD.',
  // ),
  // Email(
  //   sender: 'bob.smith@example.com',
  //   subject: 'Reminder',
  //   message: 'Just a reminder that our team meeting is tomorrow at 10 AM.',
  // ),
  // Email(
  //   sender: 'steve.smith@example.com',
  //   subject: 'Reminder',
  //   message: 'Just a reminder that our team meeting is tomorrow at 10 AM.',
  // ),
  // Email(
  //   sender: 'jenny.smith@example.com',
  //   subject: 'Reminder',
  //   message: 'Just a reminder that our team meeting is tomorrow at 10 AM.',
  // ),
  // Email(
  //   sender: 'bob.smith@example.com',
  //   subject: 'Reminder',
  //   message: 'Just a reminder that our team meeting is tomorrow at 10 AM.',
  // ),
  // Email(
  //   sender: 'bob.smith@example.com',
  //   subject: 'Reminder',
  //   message: 'Just a reminder that our team meeting is tomorrow at 10 AM.',
  // ),
  // Email(
  //   sender: 'bob.smith@example.com',
  //   subject: 'Reminder',
  //   message: 'Just a reminder that our team meeting is tomorrow at 10 AM.',
  // ),
  // Email(
  //   sender: 'bob.smith@example.com',
  //   subject: 'Reminder',
  //   message: 'Just a reminder that our team meeting is tomorrow at 10 AM.',
  // ),
  // Email(
  //   sender: 'bob.smith@example.com',
  //   subject: 'Reminder',
  //   message: 'Just a reminder that our team meeting is tomorrow at 10 AM.',
  // ),
  // Email(
  //   sender: 'bob.smith@example.com',
  //   subject: 'Reminder',
  //   message: 'Just a reminder that our team meeting is tomorrow at 10 AM.',
  // ),
  // Email(
  //   sender: 'bob.smith@example.com',
  //   subject: 'Reminder',
  //   message: 'Just a reminder that our team meeting is tomorrow at 10 AM.',
  // ),
  // Email(
  //   sender: 'bob.smith@example.com',
  //   subject: 'Reminder',
  //   message: 'Just a reminder that our team meeting is tomorrow at 10 AM.',
  // ),
  // Add more emails here...
];

Future<List<Email>> getEmailsFromDB() async {
  List<Email> emailList = [];
  final conn = await MySQLConnection.createConnection(
    host: '127.0.0.1',
    port: 3306,
    userName: 'root',
    password: 'Mypassword@1',
    databaseName: 'setap',
  );

  await conn.connect();
  IResultSet results = await conn.execute("SELECT sender subject message FROM inbox WHERE id = ${profile.getID};");

  try {
    for (ResultSetRow row in results.rows) {
      final sender = row.colAt(0);
      final subject = row.colAt(1);
      final message = row.colAt(2);
      emailList.add(Email(sender: sender!, subject: subject!, message: message!));
    }
    await conn.close();
  } catch (e) {
    log("Error fetching from database");
  }
  return emailList;
}

void main() async {
  profile = StudentClass(0, "Karol", "Krzystof Floraan Lubicz-Gruzewski", 'assets/images/pfp1.jpg', "karol69@gmail.com", "42069 420 666");
  sampleHouse =
      House(0, 'assets/images/house1.jpeg', "123", "Perfect Street", "Portsmouth", "PO4 21S", EHouseTypes.semiDetachedHouse, "An ugly small house with a red garage.", 3, 1, 1, true, true, true);
  emails = await getEmailsFromDB();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // Set this to false to remove the debug banner
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
  State<NavBarWidget> createState() => NavBarPageState();
}

class NavBarPageState extends State<NavBarWidget> {
  static int selectedIndex = 2;

  static final LinkedHashMap<StatefulWidget, BottomNavigationBarItem> _widgetOptions = LinkedHashMap.from({
    profilePage: const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    inboxPage: const BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Inbox'),
    homePage: const BottomNavigationBarItem(icon: Icon(Icons.house), label: 'Home'),
    mapPage: const BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
    rentPage: const BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Rent')
  });

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: _widgetOptions.keys.toList()[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          _widgetOptions.values.toList()[0],
          _widgetOptions.values.toList()[1],
          _widgetOptions.values.toList()[2],
          _widgetOptions.values.toList()[3],
          _widgetOptions.values.toList()[4],
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
