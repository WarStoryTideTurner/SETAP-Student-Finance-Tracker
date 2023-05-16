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

NavBarPageState curNavBarState = NavBarPageState(); // Making the NavBarPageState public is a poor work around but will have to do under these time constraints.

MyProfilePage profilePage = const MyProfilePage();
MyInboxPage inboxPage = const MyInboxPage();
MyHomePage homePage = const MyHomePage();
MyMapPage mapPage = const MyMapPage();
MyRentPage rentPage = const MyRentPage();

String currentName = "Harold";
String currentLName = "Remus";

late StudentClass profile;
late House sampleHouse;

List<Email> emails = [];

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
  try {
    IResultSet results = await conn.execute("SELECT sender, subject, message FROM inbox WHERE cust_id = ${profile.getID};");

    for (ResultSetRow row in results.rows) {
      final sender = row.colAt(0);
      final subject = row.colAt(1);
      final message = row.colAt(2);
      emailList.add(Email(sender: sender!, subject: subject!, message: message!));
    }
    await conn.close();
  } catch (ex) {
    log("Error: $ex");
  }

  return emailList;
}

Future<StudentClass> getProfile() async {
  final conn = await MySQLConnection.createConnection(
    host: '127.0.0.1',
    port: 3306,
    userName: 'root',
    password: 'Mypassword@1',
    databaseName: 'setap',
  );

  await conn.connect();
  StudentClass student;

  try {
    IResultSet results = await conn.execute("SELECT * FROM customer WHERE cust_name = '$currentName' AND cust_surname = '$currentLName';");

    if (results.numOfRows == 1) {
      ResultSetRow userResults = results.rows.first;
      student = StudentClass(userResults.typedColByName<int>('cust_id')!, userResults.colByName('cust_name')!, userResults.colByName('cust_surname')!, 'assets/images/pfp1.jpg',
          userResults.colByName('cust_email')!, userResults.colByName('cust_phone')!);
    } else {
      throw Exception("Error: Multiple profiles with that name!");
    }
    await conn.close();
  } catch (ex) {
    log("Error: $ex");
    student = StudentClass(1, "Karol", "Krzystof Floraan Lubicz-Gruzewski", 'assets/images/pfp1.jpg', "karol69@gmail.com", "42069 420 666");
  }

  return student;
}

Future<House> getHouse() async {
  return House(0, 'assets/images/house1.jpeg', "123", "Perfect Street", "Portsmouth", "PO4 21S", EHouseTypes.semiDetachedHouse, "An ugly small house with a red garage.", 3, 1, 1, true, true, true);
}

void main() async {
  profile = await getProfile();
  sampleHouse = await getHouse();
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
